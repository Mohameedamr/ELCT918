@echo off
REM ELCT918 Lab 5, Topic 1 -- SAIF power from a post-implementation netlist
REM
REM The RTL-level flow in run_power.bat only matched 13%% of nets. This runs the
REM same four cases against the implemented netlist, where net names match the
REM routed design exactly.
REM
REM Run from a Command Prompt, in this sim\ folder:
REM     run_power_gate.bat

cd /d "%~dp0"

if "%XILINX_VIVADO%"=="" call "D:\Vivado2020.1\Vivado\2020.1\settings64.bat"

set DCP=D:\Vivado\eyeriss_pe_ooc\eyeriss_pe_ooc.runs\impl_1\eyeriss_rs_pe_routed.dcp
set GLBL=%XILINX_VIVADO%\data\verilog\src\glbl.v

if not exist "%DCP%" (
  echo ERROR: routed checkpoint not found at %DCP%
  exit /b 1
)

echo ============================================
echo  exporting the implemented netlist
echo ============================================
call vivado -mode batch -nojournal -nolog -source write_netlist.tcl -tclargs "%DCP%" netlist_funcsim.v
if not exist netlist_funcsim.v (
  echo ERROR: netlist was not written
  exit /b 1
)

echo.
echo ============================================
echo  compiling netlist + testbench
echo ============================================
call xvlog -d GATE_SIM netlist_funcsim.v ..\tb\tb_eyeriss_rs_pe.v "%GLBL%" || goto :err
call xelab -debug typical -L unisims_ver -L unimacro_ver -L secureip ^
     tb_eyeriss_rs_pe glbl -s pe_gate || goto :err

call :onecase 1 || goto :err
call :onecase 2 || goto :err
call :onecase 3 || goto :err
call :onecase 4 || goto :err

echo.
echo ============================================
echo  summary
echo ============================================
for %%C in (1 2 3 4) do (
  echo --- case %%C ---
  findstr /C:"Total On-Chip Power" /C:"Dynamic (W)" /C:"Device Static" /C:"Design Nets Matched" gate_power_case%%C.rpt
)
goto :eof

REM --------------------------------------------------------------------
:onecase
setlocal
set C=%1
echo.
echo ============================================
echo  case %C%: gate-level switching activity
echo ============================================
if exist pe_activity.saif del pe_activity.saif
call xsim pe_gate -onfinish stop -testplusarg "CASE=%C%" -tclbatch saif_dump_gate.tcl
if not exist pe_activity.saif (
  echo ERROR: no SAIF produced for case %C%
  endlocal & exit /b 1
)
move /y pe_activity.saif gate_case%C%.saif >nul

call vivado -mode batch -nojournal -nolog -source power_from_dcp.tcl -tclargs "%DCP%" gate_case%C%.saif gate_power_case%C%.rpt
if not exist gate_power_case%C%.rpt (
  echo ERROR: no power report for case %C%
  endlocal & exit /b 1
)
endlocal & exit /b 0

:err
echo.
echo FAILED
exit /b 1
