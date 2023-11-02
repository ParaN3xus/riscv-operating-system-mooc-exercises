```sh
paran3xus@ParaN3xusLaptop:~/riscv-operating-system-mooc/code/asm/sub$ make code
test.elf:     file format elf32-littleriscv


Disassembly of section .text:

80000000 <_start>:

        .text                   # Define beginning of text section
        .global _start          # Define entry _start

_start:
        li x6, -1               # x6 = -1
80000000:       fff00313                li      t1,-1
        li x7, -2               # x7 = -2
80000004:       ffe00393                li      t2,-2
        sub x5, x6, x7          # x5 = x6 - x7
80000008:       407302b3                sub     t0,t1,t2

8000000c <stop>:

stop:
        j stop                  # Infinite loop to stop execution
8000000c:       0000006f                j       8000000c <stop>
(END)
```

因此该指令对应的编码为`407302b3`，也即` 0100 0000 0111 0011 0000 0010 1011 0011`，也即

````
0100000 00111 00110 000    00101 0110011
funct7  rs2   rs1   funct3 rd    opcode   
        x7    x6           x5    sub
````



`b3 05 95 00`也即`00 95 05 b3`也即`10010101000001011 0110011`，也即

```
0000000 01001 01010 000    01011 0110011
funct7  rs2   rs1   funct3 rd    opcode
        x9    x10          x11   add
```

也即`add x11, x10, x9`

