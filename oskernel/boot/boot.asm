; 加载到 0x7c00
[ORG 0x7c00]
; 定义 代码段
[SECTION .text]
; 申明 当前为 16位实模式
[BITS 16]
; 申明程序入口 _start 给链接器看的
global _start

_start:
    ; 设置屏幕模式为文本模式，清除屏幕
    ; 固定功能：设置80x25的文本模式
    mov ax, 3 ; 固定值 3 = 文本模式 ax(ah:al)是16位实模式下最常用的寄存器
    int 0x10 ; BIOS视频服务（显示/屏幕相关）

    ; 所有段寄存器清零
    ; 16位模式下： 物理地址 = 段寄存器 + 偏移寄存器
    mov ax, 0 ; x86汇编规则，段寄存器不能直接赋值
    mov ss, ax ; 栈段
    mov ds, ax ; 数据段
    mov es, ax ; 附加段
    mov fs, ax
    mov gs, ax
    mov si, ax ; si是偏移寄存器

    ;执行逻辑
    mov si, msg ; 把字符串msg的起始位置放入si寄存器
    call print

    ; 死循环，没有这个CPU会向后继续运行，会死机
    jmp $

print:
    ; ah 指令
    ; 参数 bh:显示密码 bl:显示颜色 al:要打印的字符
    mov ah, 0x0e ; ah：BIOS中断专门用来存放功能号的寄存器
                 ; 0x0e: 在0x10中断下的TTY单字符打印指令
    mov bh, 0 ; BH：专门用来放 显示页号 0
    mov bl, 0x01 ; BL：专门用来放 字符颜色 01蓝色
    int 0x10
.loop:                  ; 1. 循环标签：程序跳转到这里开始循环
    mov al, [si]        ; 2. 取字符：把 si 指向的内存数据 → al
    cmp al, 0           ; 3. 比较：al 等于 0 吗？
    jz .done            ; 4. 等于0 → 结束，跳转到 .done
    int 0x10            ; 5. 不等于0 → 打印 al 里的字符

    inc si              ; 6. si 加1：指向下一个字符
    jmp .loop           ; 7. 跳回循环开头，继续打印下一个
.done:
    ret

msg:
    db "hello, world", 10, 13, 0
    ; db:定义字节数据 10:"\n" 13: "\r" 0:"\0"

times 510 - ($ - $$) db 0
db 0x55, 0xaa