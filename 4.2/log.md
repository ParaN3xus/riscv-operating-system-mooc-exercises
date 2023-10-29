```sh
paran3xus@ParaN3xusLaptop:~/riscv-operating-system-mooc-exercises/4.2$ cat hello.c
#include<stdio.h>

int main()
{
    printf("hello world!");
    return 0;
}paran3xus@ParaN3xusLaptop:~/riscv-operating-system-mooc-exercises/4.2$ riscv64-linux
-gnu-gcc -march=rv64ifd hello.c -g
paran3xus@ParaN3xusLaptop:~/riscv-operating-system-mooc-exercises/4.2$ cat hello.c
#include<stdio.h>

int main()
{
    printf("hello world!");
    return 0;
paran3xus@ParaN3xusLaptop:~/riscv-operating-system-mooc-exercises/4.2$ riscv64-linux-gnu-gcc -march=rv64ifd hello.cc
paran3xus@ParaN3xusLaptop:~/riscv-operating-system-mooc-exercises/4.2$ qemu-riscv64
a.out
hello world!paran3xus@ParaN3xusLaptop:~/riscv-operating-system-mooc-exercises/4.2$ qemu-riscv64 -g 1234 -singlestep a.out
hello world!
```

```sh
paran3xus@ParaN3xusLaptop:~$ gdb-multiarch
GNU gdb (Debian 10.1-1.7) 10.1.90.20210103-git
Copyright (C) 2021 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
Type "show copying" and "show warranty" for details.
This GDB was configured as "x86_64-linux-gnu".
Type "show configuration" for configuration details.
For bug reporting instructions, please see:
<https://www.gnu.org/software/gdb/bugs/>.
Find the GDB manual and other documentation resources online at:
    <http://www.gnu.org/software/gdb/documentation/>.

For help, type "help".
Type "apropos word" to search for commands related to "word".
(gdb) file ~/riscv-operating-system-mooc-exercises/4.2/a.out
Reading symbols from ~/riscv-operating-system-mooc-exercises/4.2/a.out...
(gdb) set architecture riscv:rv64
The target architecture is set to "riscv:rv64".
(gdb) target remote localhost:1234
Remote debugging using localhost:1234
warning: remote target does not support file transfer, attempting to access files from local filesystem.
Reading symbols from /lib/ld-linux-riscv64-lp64d.so.1...
(No debugging symbols found in /lib/ld-linux-riscv64-lp64d.so.1)
0x0000004001804f40 in ?? () from /lib/ld-linux-riscv64-lp64d.so.1
(gdb) continue
Continuing.
[Inferior 1 (process 1) exited normally]
(gdb)
```

