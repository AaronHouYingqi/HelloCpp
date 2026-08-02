# HelloCpp
Exercise C++.
## Prerequisite
### Ubuntu
`sudo apt install cmake ninja-build clang lldb bear`
### Windows
- **最推荐、最兼容、最方便的方式：安装 Visual Studio Build Tools (选择 C++ 桌面开发工作负载)**。这会提供完整的 UCRT、Windows SDK 和可选的 MSVC C++ 库。
 - [Build Tools for Visual Studio 2022](https://visualstudio.microsoft.com/downloads/#build-tools-for-visual-studio-2022)
 - Run "x64 Native Tools Command Prompt for VS 2022"
## Usage
### main
- Test Syntax
### LeetCode
- solution.h: ...
- leetcode_ut.cpp: ...
---

# My Cache

## CMake
- .cmake 文件是什么？
- 把脚本的内容改到 CMake 里
- 使用 install
  - ./bin、./lib
  - 构建之后通过 CMake 删除 ./build
- 各级 CMakeLists.txt

## GoogleTest
- .gitmodules
  - open-source 改成 third_party
- 尽量不使用脚本，改用 Cmake
- 使用 install
  - dependence
- 用 find_package 导入 GoogleTest

## root path
- .gitignore
  - .idea
- CMakePresets.json
  - https://cmake.org/cmake/help/latest/manual/cmake-presets.7.html
  - https://blog.csdn.net/sumover/article/details/141214659
- snippet.sh
- README.md

## 在 Windows 上编译运行 HelloCpp
- __declspec
- * 之后你可以使用 `clang-cl` (兼容 MSVC 命令行) 或带 `--target=x86_64-pc-windows-msvc` 的 `clang/clang++`，并利用 VS 提供的环境变量（如通过 `vcvarsall.bat`）自动设置好包含路径和库路径。
- 每次编译都要加载 vs build 生成工具的环境吗？
- 把 Common7... 改成 VC\Auxiliary\Build\vcvars64.bat
- launch.json: cppvsdbg
### **使用 LLVM (`clang/clang++`) 编译时需要做什么：**
1. **包含路径 (`-I`)：** 需要告诉编译器在哪里找到标准库头文件（如 UCRT 头文件、Windows SDK 头文件、libc++ 头文件（如果用的话））。
2. **库路径 (`-L`)：** 需要告诉链接器在哪里找到标准库的导入库/静态库（如 `ucrt.lib`, `kernel32.lib`, `user32.lib`, `libc++.lib` 等）。
3. **链接库 (`-l`)：** 需要明确指定链接哪些库（如 `-lucrt -lkernel32 -luser32` 或 `-lc++`）。
4. **目标平台 (`--target`)：** 对于 `clang/clang++`，在 Windows 上**强烈建议**明确指定目标三元组，因为它决定了默认使用的 C 库、C++ 库和链接器行为。常见目标有：
  - `x86_64-pc-windows-msvc`: 使用 MSVC ABI, UCRT, 链接到 `link.exe` (或 `lld-link.exe` 模拟其行为)。这是最接近原生 Windows 开发的方式，通常需要 Visual Studio/Win SDK 环境。
  - `x86_64-w64-windows-gnu`: 使用 MinGW-w64/GNU ABI, MinGW-w64 的 C 库 (可能是 UCRT 变种) 和 `libstdc++`。需要 MinGW-w64 环境。
5. **运行时库：** 程序运行时需要找到对应的动态库（`ucrtbase.dll`, `vcruntimeXXX.dll` (如果用 MSVC C++ 库), `libstdc++-6.dll` (如果用 MinGW C++ 库), `libc++.dll` (如果用 LLVM 的 C++ 库), 以及各种 Windows 系统 DLL）。
