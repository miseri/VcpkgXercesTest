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

SET VCPKG_DEFAULT_TRIPLET=x86-windows

.\vcpkg.exe install ^
 glog ^
 xerces-c

:: change back to script dir
cd /D  %~dp0

if not exist ..\build mkdir ..\build
cd ..\build

:: toolchain
SET TOOLCHAIN_FILE=%VCPKG_DIR%/scripts/buildsystems/vcpkg.cmake

:: commenting out to use vcpkg with modified x86-windows triplet
:: dynamically linked
:: SET XercesC_DIR=%VCPKG_DIR%\installed\x86-windows-csir-custom\share\xercesc
:: SET glog_DIR=%VCPKG_DIR%\installed\x86-windows-csir-custom\share\glog
:: SET gflags_DIR=%VCPKG_DIR%\installed\x86-windows-csir-custom\share\gflags

ECHO "Invoking CMake with TOOLCHAIN_FILE=%TOOLCHAIN_FILE%"

cmake -DCMAKE_TOOLCHAIN_FILE=%TOOLCHAIN_FILE% ^
  -A Win32 .. 

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
