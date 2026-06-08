#pragma once

#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <memory.h>

/*==============================
 *  自定义日志系统
 ===============================*/
#define INFO_OUTPUT         3
#define WARNING_OUTPUT      2
#define ERROR_OUTPUT        1
#define DEBUG_OUTPUT        0

#define DEBUG
#define DEBUG_LEVEL         INFO_OUTPUT

#define PRINT(info, ...) do { \
    printf("[INFO] (%s:%d->%s):" info"", __FILE__, __LINE__, __func__, ##__VA_ARGS__); \
}while (0)

#define INFO_PRINT(info, ...) do { \
    if (DEBUG_LEVEL >= INFO_OUTPUT) { \
        printf("[Info] (%s:%d->%s):" info"", __FILE__, __LINE__, __FUNCTION__, ##__VA_ARGS__); \
    } \
}while (0)

#define WARNING_PRINT(info, ...) do{ \
    if(DEBUG_LEVEL>=WARNING_OUTPUT){ \
        printf("[Warning] (%s:%d->%s):" info"", __FILE__, __LINE__, __FUNCTION__, ##__VA_ARGS__); \
    } \
}while(0)

#define DEBUG_PRINT(info,...) do{ \
    if(DEBUG_LEVEL>=DEBUG_OUTPUT){ \
        printf("[Debug] (%s:%d->%s):" info"",__FILE__,__FUNCTION__,__LINE__,##__VA_ARGS__); \
    } \
}while(0)

#define ERROR_PRINT(info, ...) do{ \
    if(DEBUG_LEVEL>=ERROR_OUTPUT){ \
        printf("[Error] (%s:%d->%s):" info"", __FILE__, __LINE__, __FUNCTION__, ##__VA_ARGS__); \
    } \
}while(0)

#define assert(cond, msg) do{ \
if (!cond) { \
    fprintf(stderr, "assert fails %s %d: %s\n", __FILE__, __LINE__, msg); \
    abort(); \
    } \
}while(0)

#define WRITE(str) do{ \
    write(STDOUT_FILENO, str, strlen(str)); \
}while(0)

#define ASSERT_ZERO(status, str) do{ \
    if (0 != status) { \
        WRITE(str); \
        exit(-1); \
    } \
}while(0)