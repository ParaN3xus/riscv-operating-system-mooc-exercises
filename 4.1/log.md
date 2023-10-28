```sh
paran3xus@ParaN3xusLaptop:~/riscv-operating-system-mooc/exercises/4.1$ ls
hello.c
paran3xus@ParaN3xusLaptop:~/riscv-operating-system-mooc/exercises/4.1$ cat hello.c
#include<stdio.h>

int main()
{
    printf("hello world!");
    return 0;
}paran3xus@ParaN3xusLaptop:~/riscv-operating-system-mooc/exercises/4.1$ riscv64-linux-gnu-gcc -march=rv64ifd hello.c
```

