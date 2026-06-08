# 1. 要求的最低 CMake 版本
cmake_minimum_required(VERSION 3.20)

# 2. 项目名 + 语言是 C
project(my_demo C)

# 3. 用 C11（可选，推荐）
set(CMAKE_C_STANDARD 11)

# 4. 把 main.c 编译成可执行文件 my_demo
add_executable(my_demo main.c)

