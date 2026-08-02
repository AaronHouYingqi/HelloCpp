add_library(leetcode SHARED solution.cpp ../../include/solution.h)
target_include_directories(leetcode PUBLIC ../../include)

# 添加导出宏定义（目标名 + _EXPORTS）
target_compile_definitions(leetcode PRIVATE 
    MYDLL_EXPORTS  # 这个名称必须匹配头文件中的检查
)

    install(TARGETS leetcode
        # ARCHIVE DESTINATION lib   # 静态库 (.a/.lib)
        LIBRARY DESTINATION lib   # 动态库 (.so/.dylib/.dll)
        # RUNTIME DESTINATION bin   # Windows DLL 需单独指定
)
