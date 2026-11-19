@echo off
REM ELCT918 Lab 5, Topic 1 -- run both testbenches in Vivado xsim.
REM Open the Vivado 2020 command prompt, cd to this sim\ folder, run this file.

cd /d "%~dp0"

echo === compiling ===
call xvlog ..\rtl\eyeriss_rs_pe.v ..\rtl\mac_pe_baseline.v ^
           ..\tb\tb_eyeriss_rs_pe.v ..\tb\tb_mac_pe_baseline.v || goto :err

echo.
echo === row-stationary PE ===
call xelab -debug typical tb_eyeriss_rs_pe -s pe_sim || goto :err
call xsim pe_sim -R                                  || goto :err

echo.
echo === baseline MAC PE ===
call xelab -debug typical tb_mac_pe_baseline -s base_sim || goto :err
call xsim base_sim -R                                    || goto :err

goto :eof
:err
echo.
echo BUILD FAILED
exit /b 1
