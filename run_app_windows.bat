@echo off
setlocal

:: Step 1: Check if Python is installed
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Python is not installed. Installing Python...

    :: Step 2: Download Python installer
    powershell -Command "Invoke-WebRequest https://www.python.org/ftp/python/3.12.2/python-3.12.2-amd64.exe -OutFile python_installer.exe"

    :: Step 3: Install Python silently
    start /wait python_installer.exe /quiet InstallAllUsers=1 PrependPath=1 Include_test=0

    :: Step 4: Clean up installer
    del python_installer.exe

    :: Step 5: Refresh environment
    echo Please restart this script to use Python.
    pause
    exit /b
)

:: Step 6: Run local server and open browser
cd build\web
start "" "http://localhost:8080"
python -m http.server 8080

endlocal
pause
