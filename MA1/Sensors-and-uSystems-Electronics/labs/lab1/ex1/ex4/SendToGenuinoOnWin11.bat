:: first argument:  absolute path to the directory that contains the avrdude folder
:: second argument: absolute path to the project directory
:: third argument:  name of the target (HEX-file, extension excluded)

@echo off
echo ---------------------------------------------------------------------------
echo ---------------------------------------------------------------------------
echo Sensors and Microsystem Electronics
echo Practical assignment: microcontroller design
echo ---------------------------------------------------------------------------
echo ---------------------------------------------------------------------------
echo.
echo This script uploads a program to the microcontroller board.
echo Make sure the microcontroller board is connected to this computer !!!
echo ---------------------------------------------------------------------------

echo Solution directory: "%~1"
echo Project directory:  "%~2"
echo Target name:        "%~3.hex"

:: Get the COM port number (PowerShell for modern Windows, WMIC fallback for older versions)
set comport=

:: Attempt 1: PowerShell (Windows 10/11)
for /f "usebackq tokens=*" %%A in (`powershell -NoProfile -Command "$device = Get-PnpDevice -Class Ports -PresentOnly -ErrorAction SilentlyContinue | Where-Object { $_.FriendlyName -match 'Genuino|Arduino|Serial' } | Select-Object -First 1; if ($device) { $device.FriendlyName -replace '.*\((COM\d+)\).*', '$1' }" 2^>nul`) do set comport=%%A

:: Attempt 2: wmic fallback (Windows 7/8 legacy)
if "%comport%"=="" (
    for /f "usebackq" %%B in (`wmic path Win32_SerialPort Where "Caption LIKE '%%Genuino%%'" Get DeviceID 2^>nul ^| FINDSTR "COM"`) do set comport=%%B
)
if "%comport%"=="" (
    for /f "usebackq" %%B in (`wmic path Win32_SerialPort Where "Caption LIKE '%%Arduino%%'" Get DeviceID 2^>nul ^| FINDSTR "COM"`) do set comport=%%B
)
if "%comport%"=="" (
    for /f "usebackq" %%B in (`wmic path Win32_SerialPort Where "Caption LIKE '%%Serial%%'" Get DeviceID 2^>nul ^| FINDSTR "COM"`) do set comport=%%B
)

if "%comport%"=="" (
    echo ERROR: No compatible COM port found.
    pause
    exit /b 1
)

echo COM port number:    %comport%
echo.

:: Set the first argument (typically the solution directory) as working directory.
set SolDir=%1
%SolDir:~1,2%
cd %1

:: Copy the content of TestPeripherals.hex to the Genuino Uno's program memory.
avrdude\avrdude -C "avrdude\avrdude.conf" -p atmega328p -c arduino -P %comport% -b 115200 -U flash:w:"%~2Debug\%~3.hex":i

:: Wait for a keystroke before terminating this script.
pause