```c++
#include <stdio.h>

// text? data
int global_init = 0x11111111;
// rodata? rodata
const int global_const = 0x22222222;

void main()
{
    // data? data
    static int static_var = 0x33333333;
    // text? bss (contains statically allocated variables that are declared but have not been assigned a value yet)
    static int static_var_uninit;

    // text? text
    int auto_var = 0x44444444;

    printf("hello world!\n");
    return;
}
```

借助工具：

```sh
paran3xus@ParaN3xusLaptop:~/riscv-operating-system-mooc/exercises/3.2$ objdump -t code.o

code.o:     file format elf64-x86-64

SYMBOL TABLE:
0000000000000000 l    df *ABS*  0000000000000000 code.c
0000000000000000 l    d  .text  0000000000000000 .text
0000000000000000 l    d  .data  0000000000000000 .data
0000000000000000 l    d  .bss   0000000000000000 .bss
0000000000000000 l    d  .rodata        0000000000000000 .rodata
0000000000000000 l     O .bss   0000000000000004 static_var_uninit.1
0000000000000004 l     O .data  0000000000000004 static_var.0
0000000000000000 l    d  .note.GNU-stack        0000000000000000 .note.GNU-stack
0000000000000000 l    d  .eh_frame      0000000000000000 .eh_frame
0000000000000000 l    d  .comment       0000000000000000 .comment
0000000000000000 g     O .data  0000000000000004 global_init
0000000000000000 g     O .rodata        0000000000000004 global_const
0000000000000000 g     F .text  000000000000001e main
0000000000000000         *UND*  0000000000000000 _GLOBAL_OFFSET_TABLE_
0000000000000000         *UND*  0000000000000000 puts


paran3xus@ParaN3xusLaptop:~/riscv-operating-system-mooc/exercises/3.2$ objdump -s code.o

code.o:     file format elf64-x86-64

Contents of section .text:
 0000 554889e5 4883ec10 c745fc44 44444448  UH..H....E.DDDDH
 0010 8d3d0000 0000e800 00000090 c9c3      .=............
Contents of section .data:
 0000 11111111 33333333                    ....3333
Contents of section .rodata:
 0000 22222222 68656c6c 6f20776f 726c6421  """"hello world!
 0010 00                                   .
Contents of section .comment:
 0000 00474343 3a202844 65626961 6e203130  .GCC: (Debian 10
 0010 2e322e31 2d362920 31302e32 2e312032  .2.1-6) 10.2.1 2
 0020 30323130 31313000                    0210110.
Contents of section .eh_frame:
 0000 14000000 00000000 017a5200 01781001  .........zR..x..
 0010 1b0c0708 90010000 1c000000 1c000000  ................
 0020 00000000 1e000000 00410e10 8602430d  .........A....C.
 0030 06590c07 08000000                    .Y......
```

除了auto的在符号表里面没有需要看代码，剩下的都可以在符号表里面找到。

`"hello world!"`在`.rodata`，可以用`-s`看到。