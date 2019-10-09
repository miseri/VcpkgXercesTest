@echo off

SET VCPKG_DIR=%~dp0..\vcpkg
echo "Using VCPKG_DIR %VCPKG_DIR%"

cd %VCPKG_DIR%

if not exist vcpkg.exe (
  if not exist bootstrap-vcpkg.bat (
    git submodule update --init
  )
  echo "Building vcpkg.exe"
  call bootstrap-vcpkg.bat
) else (
  echo "vcpkg.exe already exists"
)

.\vcpkg.exe install ^
 xerces-c:x86-windows

:: change back to script dir
cd /D  %~dp0

if not exist ..\build mkdir ..\build
cd ..\build

:: toolchain
SET TOOLCHAIN_FILE=%VCPKG_DIR%/scripts/buildsystems/vcpkg.cmake

:: dynamically linked
SET XercesC_DIR=%VCPKG_DIR%\installed\x86-windows\share\xercesc
::SET XercesC_LIBRARY=%VCPKG_DIR%/installed/x86-windows/lib/xerces-c_3.lib)
::SET XercesC_INCLUDE_DIR=%VCPKG_DIR%/installed/x86-windows/include)

ECHO "Invoking CMake with TOOLCHAIN_FILE=%TOOLCHAIN_FILE% XercesC_DIR=%XercesC_DIR%"

cmake -DCMAKE_TOOLCHAIN_FILE=%TOOLCHAIN_FILE% ^
  -DXercesC_DIR=%XercesC_DIR% ^
  -A Win32 .. 

:: -DXercesC_DIR=%XercesC_DIR% -DXercesC_LIBRARY=%XercesC_LIBRARY% -DXercesC_INCLUDE_DIR=%XercesC_INCLUDE_DIR% ^

goto eof

if %ERRORLEVEL% EQU 0 (
  ECHO "Building Release version"
  cmake --build . --config Release 
  ECHO "Building Debug version"
  cmake --build . --config Debug 
) else (
  ECHO "Error generating build files"
)
  
cd ..\scripts  

:eof
