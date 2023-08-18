@echo off

:: capture parameters
set Architecture=%1
set BuildType=%2
set BuilderDirectory=%~dp0
set BuilderDirectory=%BuilderDirectory:~0,-1%

:: display info
echo "Target Architecture: %Architecture%"
echo "Build Type: %BuildType%"
echo "Builder Directory: %BuilderDirectory%"

:: initialize environment
call "%BuilderDirectory%\vcvarsallcall.bat" %Architecture%

:: build
call cmake --preset=%Architecture%-%BuildType% && cmake --build --preset=%Architecture%-%BuildType%