- `make`首先找到本目录下的Makefile
- 由于没有指定构建目标，执行`.DEFAULT_GOAL`即`all`
- 不回显命令执行`echo`，输出文本
- 执行`bash`的`for`命令，对于`SECTIONS`中的每一个目录，执行$(MAKE) -C $$dir || exit "$$?"。其中的$$是用来转义$的，exit "$?"可以返回`make`指令的结果，`-C`可以指定`make`获取Makefile的目录
  - 首先对code/asm下的Makefile进行构建，类似上述过程遍历该目录下的目录 
    - 以_first目录为例，这时该目录下的Makefile引用了rule.mk文件，这个文件中指定了`.DEFAULT_GOAL := all`并运行
        - 运行的两条命令的可执行文件等均在common.mk中指定，而目标EXEC在上一级Makefile中指定
    - 其他目录中的过程类似，此处不再列举。
  - 然后对code/os下的Makefile进行构建
    - 以00-bootstrap目录为例，运行默认目标`all`，该目标依赖于目标`os.elf`
      - 该目标又依赖于`OBJS`中的内容，这些内容是把.S和.c文件替换成.o，这些操作都在下面的静态规则中指定
    - `os.elf`目标自身是类似于_first目录中的操作，这里不再重复。
- 不回显命令执行`echo`，输出文本
