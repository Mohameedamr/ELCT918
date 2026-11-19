@echo off
REM ELCT918 Lab 5, Topic 1 -- maximum frequency sweep
REM
REM Run from the Vivado command prompt, in this sim\ folder:
REM     run_fmax.bat
REM
REM Takes roughly 20 minutes: five full synthesis and implementation runs.
REM The summary table is printed at the end and the per-period timing reports
REM land in ..\reports\.

cd /d "%~dp0"
call vivado -mode batch -nojournal -nolog -source fmax_sweep.tcl
