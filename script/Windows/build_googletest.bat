@echo off

REM 加载 VS 2022 编译环境
call "%ProgramFiles(x86)%\Microsoft Visual Studio\2022\BuildTools\Common7\Tools\VsDevCmd.bat"

setlocal enabledelayedexpansion

:: ===== 配置区域 =====
set ROOT_PATH=%~dp0..\..\
set SOURCE_PATH=%ROOT_PATH%open-source\GoogleTest
set BINARY_PATH=%ROOT_PATH%.GoogleTest
set DEPENDENCE_PATH=%ROOT_PATH%dependence\GoogleTest
set GENERATOR="Ninja"
:: 可选值: "Ninja", "Visual Studio 17 2022", "MinGW Makefiles"
:: ====================

echo.
echo [1/7] 检查必备工具...
where git >nul 2>&1 || (echo 错误: 未找到 Git. 请安装 Git 并添加到 PATH & exit /b 1)
where cmake >nul 2>&1 || (echo 错误: 未找到 CMake. 请安装 CMake 并添加到 PATH & exit /b 1)

if "%GENERATOR%"=="Ninja" (
    where ninja >nul 2>&1 || (echo 错误: 未找到 Ninja. 请安装 Ninja 并添加到 PATH & exit /b 1)
)

echo.
echo [2/7] 更新 Git 子模块...
cd /d "%ROOT_PATH%"
git submodule update --init --remote --recursive
if errorlevel 1 (
    echo 警告: 子模块更新失败
    @REM cd /d "%ROOT_PATH%"
    @REM rmdir /s /q "%SOURCE_PATH%" 2>nul
    exit /b 1
)

echo.
echo [3/7] 清理旧构建...
cd /d "%ROOT_PATH%"
if exist "%BINARY_PATH%" rmdir /s /q "%BINARY_PATH%"
if exist "%DEPENDENCE_PATH%" rmdir /s /q "%DEPENDENCE_PATH%"

echo.
echo [4/7] 生成构建系统 (生成器: %GENERATOR%)...
cmake -S "%SOURCE_PATH%" -B "%BINARY_PATH%" -G %GENERATOR%
if errorlevel 1 (
    echo 错误: CMake 生成失败
    echo 尝试备用生成器...
    cmake -S "%SOURCE_PATH%" -B "%BINARY_PATH%" -G "MinGW Makefiles"
    if errorlevel 1 (exit /b 1)
)

echo.
echo [5/7] 编译 GoogleTest...
cmake --build "%BINARY_PATH%"
if errorlevel 1 (
    echo 错误: 编译失败
    echo 尝试使用 Visual Studio 构建...
    if exist "%BINARY_PATH%\build" (
        cd /d "%BINARY_PATH%\build"
        cmake --build . --config Release
        if errorlevel 1 exit /b 1
    ) else (
        exit /b 1
    )
)

echo.
echo [6/7] 复制依赖文件到 %DEPENDENCE_PATH%...
mkdir "%DEPENDENCE_PATH%"
mkdir "%DEPENDENCE_PATH%\include"

:: 复制头文件
xcopy /E /Y "%SOURCE_PATH%\googletest\include\gtest" "%DEPENDENCE_PATH%\include\gtest\"
xcopy /E /Y "%SOURCE_PATH%\googlemock\include\gmock" "%DEPENDENCE_PATH%\include\gmock\"

:: 复制库文件
if exist "%BINARY_PATH%\lib" (
    xcopy /E /Y "%BINARY_PATH%\lib" "%DEPENDENCE_PATH%\lib\"
) else if exist "%BINARY_PATH%\build\lib" (
    xcopy /E /Y "%BINARY_PATH%\build\lib" "%DEPENDENCE_PATH%\lib\"
) else (
    echo 警告: 未找到库文件目录
)

echo.
echo [7/7] 清理构建目录...
rmdir /s /q "%BINARY_PATH%"

endlocal