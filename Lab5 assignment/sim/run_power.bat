@echo off
REM ELCT918 Lab 5, Topic 1 -- the four SAIF power runs
REM
REM Records switching activity for each power case, then applies each one to
REM the routed checkpoint and reports power.
REM
REM Run from a Command Prompt, in this sim\ folder:
REM     run_power.bat
REM
REM Cases:  1 = 0%% zeros gated     2 = 0%% zeros ungated
REM         3 = 50%% zeros gated    4 = 50%% zeros ungated

cd /d "%~dp0"

REM Put the Vivado executables on PATH.
if "%XILINX_VIVADO%"=="" call "D:\Vivado2020.1\Vivado\2020.1\settings64.bat"

set DCP=D:\Vivado\eyeriss_pe_ooc\eyeriss_pe_ooc.runs\impl_1\eyeriss_rs_pe_routed.dcp
if not exist "%DCP%" (
  echo ERROR: routed checkpoint not found at
  echo   %DCP%
  echo Run implementation in Vivado first, or edit DCP in this file.
  exit /b 1
)

echo ============================================
echo  compiling for xsim
echo ============================================
call xvlog ..\rtl\eyeriss_rs_pe.v ..\tb\tb_eyeriss_rs_pe.v || goto :err
call xelab -debug typical tb_eyeriss_rs_pe -s pe_sim       || goto :err

call :onecase 1 || goto :err
call :onecase 2 || goto :err
call :onecase 3 || goto :err
call :onecase 4 || goto :err

echo.
echo ============================================
echo  power summary
echo ============================================
for %%C in (1 2 3 4) do (
  echo --- case %%C ---
  findstr /C:"Total On-Chip Power" /C:"Dynamic (W)" /C:"Device Static" power_case%%C.rpt
)
echo.
echo Full reports: power_case1.rpt .. power_case4.rpt
goto :eof

REM --------------------------------------------------------------------
:onecase
setlocal
set C=%1
echo.
echo ============================================
echo  case %C%: switching activity
echo ============================================
if exist pe_activity.saif del pe_activity.saif

REM The plusarg must be quoted: cmd splits on '=' otherwise.
REM -onfinish stop keeps the simulator alive past $finish so close_saif runs.
call xsim pe_sim -onfinish stop -testplusarg "CASE=%C%" -tclbatch saif_dump.tcl
if not exist pe_activity.saif (
  echo ERROR: no SAIF produced for case %C%
  endlocal & exit /b 1
)
move /y pe_activity.saif case%C%.saif >nul

echo.
echo ============================================
echo  case %C%: power
echo ============================================
call vivado -mode batch -nojournal -nolog -source power_from_dcp.tcl -tclargs "%DCP%" case%C%.saif power_case%C%.rpt
if not exist power_case%C%.rpt (
  echo ERROR: no power report produced for case %C%
  endlocal & exit /b 1
)
endlocal & exit /b 0

REM --------------------------------------------------------------------
:err
echo.
echo FAILED
exit /b 1
