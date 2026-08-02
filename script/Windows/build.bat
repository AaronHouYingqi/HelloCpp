@echo off
setlocal enabledelayedexpansion

REM 加载 VS 2022 编译环境
call "%ProgramFiles(x86)%\Microsoft Visual Studio\2022\BuildTools\Common7\Tools\VsDevCmd.bat"

REM 获取脚本所在目录的上级目录作为根路径
set "SCRIPT_DIR=%~dp0..\"
set "ROOT_PATH=%SCRIPT_DIR:~0,-1%"
cd /d "%ROOT_PATH%" || exit /b
cd .. || exit /b
set "ROOT_PATH=%cd%"

REM 设置构建路径
set "BUILD_PATH=%ROOT_PATH%\build"

REM 如果构建目录存在则删除
if exist "%BUILD_PATH%" (
    rd /s /q "%BUILD_PATH%" || exit /b
)

REM 创建构建目录
md "%BUILD_PATH%" || exit /b

REM 进入构建目录并运行 CMake
cd /d "%BUILD_PATH%" || exit /b

REM 检查是否提供了命令行参数
if "%~1"=="" (
    echo Error: Missing build option argument
    exit /b 1
)

REM 运行 CMake 和 Ninja
cmake -S "%ROOT_PATH%" -B "%BUILD_PATH%" -G "Ninja" ^
    -D CMAKE_BUILD_TYPE:STRING=Debug ^
    -D CMAKE_EXPORT_COMPILE_COMMANDS:BOOL=TRUE ^
    -D CMAKE_INSTALL_PREFIX="%ROOT_PATH%"\bin ^
    -D %1=ON || exit /b

cmake --build "%ROOT_PATH%"\build -j 8
cmake --install "%ROOT_PATH%"\build 

@REM ninja -C "%BUILD_PATH%" || exit /b


REM TODO: 在这里添加 cp 和 rm 操作

endlocal