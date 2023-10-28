```bash
paran3xus@ParaN3xusLaptop:~/riscv-operating-system-mooc/exercises/3.1$ gcc -c
hello.c  hello.o  log.md
paran3xus@ParaN3xusLaptop:~/riscv-operating-system-mooc/exercises/3.1$ gcc -c hello.c
paran3xus@ParaN3xusLaptop:~/riscv-operating-system-mooc/exercises/3.1$ readelf -h hello.o
ELF Header:
  Magic:   7f 45 4c 46 02 01 01 00 00 00 00 00 00 00 00 00
  Class:                             ELF64
  Data:                              2's complement, little endian
  Version:                           1 (current)
  OS/ABI:                            UNIX - System V
  ABI Version:                       0
  Type:                              REL (Relocatable file)
  Machine:                           Advanced Micro Devices X86-64
  Version:                           0x1
  Entry point address:               0x0
  Start of program headers:          0 (bytes into file)
  Start of section headers:          720 (bytes into file)
  Flags:                             0x0
  Size of this header:               64 (bytes)
  Size of program headers:           0 (bytes)
  Number of program headers:         0
  Size of section headers:           64 (bytes)
  Number of section headers:         13
  Section header string table index: 12
paran3xus@ParaN3xusLaptop:~/riscv-operating-system-mooc/exercises/3.1$ readelf -S hello.o
There are 13 section headers, starting at offset 0x2d0:

Section Headers:
  [Nr] Name              Type             Address           Offset
       Size              EntSize          Flags  Link  Info  Align
  [ 0]                   NULL             0000000000000000  00000000
       0000000000000000  0000000000000000           0     0     0
  [ 1] .text             PROGBITS         0000000000000000  00000040
       000000000000001c  0000000000000000  AX       0     0     1
  [ 2] .rela.text        RELA             0000000000000000  00000220
       0000000000000030  0000000000000018   I      10     1     8
  [ 3] .data             PROGBITS         0000000000000000  0000005c
       0000000000000000  0000000000000000  WA       0     0     1
  [ 4] .bss              NOBITS           0000000000000000  0000005c
       0000000000000000  0000000000000000  WA       0     0     1
  [ 5] .rodata           PROGBITS         0000000000000000  0000005c
       000000000000000d  0000000000000000   A       0     0     1
  [ 6] .comment          PROGBITS         0000000000000000  00000069
       0000000000000028  0000000000000001  MS       0     0     1
  [ 7] .note.GNU-stack   PROGBITS         0000000000000000  00000091
       0000000000000000  0000000000000000           0     0     1
  [ 8] .eh_frame         PROGBITS         0000000000000000  00000098
       0000000000000038  0000000000000000   A       0     0     8
  [ 9] .rela.eh_frame    RELA             0000000000000000  00000250
       0000000000000018  0000000000000018   I      10     8     8
  [10] .symtab           SYMTAB           0000000000000000  000000d0
       0000000000000120  0000000000000018          11     9     8
  [11] .strtab           STRTAB           0000000000000000  000001f0
       000000000000002b  0000000000000000           0     0     1
  [12] .shstrtab         STRTAB           0000000000000000  00000268
       0000000000000061  0000000000000000           0     0     1
Key to Flags:
  W (write), A (alloc), X (execute), M (merge), S (strings), I (info),
  L (link order), O (extra OS processing required), G (group), T (TLS),
  C (compressed), x (unknown), o (OS specific), E (exclude),
  l (large), p (processor specific)
paran3xus@ParaN3xusLaptop:~/riscv-operating-system-mooc/exercises/3.1$ readelf -SW hello.o
There are 13 section headers, starting at offset 0x2d0:

Section Headers:
  [Nr] Name              Type            Address          Off    Size   ES Flg Lk Inf Al
  [ 0]                   NULL            0000000000000000 000000 000000 00      0   0  0
  [ 1] .text             PROGBITS        0000000000000000 000040 00001c 00  AX  0   0  1
  [ 2] .rela.text        RELA            0000000000000000 000220 000030 18   I 10   1  8
  [ 3] .data             PROGBITS        0000000000000000 00005c 000000 00  WA  0   0  1
  [ 4] .bss              NOBITS          0000000000000000 00005c 000000 00  WA  0   0  1
  [ 5] .rodata           PROGBITS        0000000000000000 00005c 00000d 00   A  0   0  1
  [ 6] .comment          PROGBITS        0000000000000000 000069 000028 01  MS  0   0  1
  [ 7] .note.GNU-stack   PROGBITS        0000000000000000 000091 000000 00      0   0  1
  [ 8] .eh_frame         PROGBITS        0000000000000000 000098 000038 00   A  0   0  8
  [ 9] .rela.eh_frame    RELA            0000000000000000 000250 000018 18   I 10   8  8
  [10] .symtab           SYMTAB          0000000000000000 0000d0 000120 18     11   9  8
  [11] .strtab           STRTAB          0000000000000000 0001f0 00002b 00      0   0  1
  [12] .shstrtab         STRTAB          0000000000000000 000268 000061 00      0   0  1
Key to Flags:
  W (write), A (alloc), X (execute), M (merge), S (strings), I (info),
  L (link order), O (extra OS processing required), G (group), T (TLS),
  C (compressed), x (unknown), o (OS specific), E (exclude),
  l (large), p (processor specific)
paran3xus@ParaN3xusLaptop:~/riscv-operating-system-mooc/exercises/3.1$ gcc -c -g hello.c
paran3xus@ParaN3xusLaptop:~/riscv-operating-system-mooc/exercises/3.1$ objdump
Usage: objdump <option(s)> <file(s)>
 Display information from object <file(s)>.
 At least one of the following switches must be given:
  -a, --archive-headers    Display archive header information
  -f, --file-headers       Display the contents of the overall file header
  -p, --private-headers    Display object format specific file header contents
  -P, --private=OPT,OPT... Display object format specific contents
  -h, --[section-]headers  Display the contents of the section headers
  -x, --all-headers        Display the contents of all headers
  -d, --disassemble        Display assembler contents of executable sections
  -D, --disassemble-all    Display assembler contents of all sections
      --disassemble=<sym>  Display assembler contents from <sym>
  -S, --source             Intermix source code with disassembly
      --source-comment[=<txt>] Prefix lines of source code with <txt>
  -s, --full-contents      Display the full contents of all sections requested
  -g, --debugging          Display debug information in object file
  -e, --debugging-tags     Display debug information using ctags style
  -G, --stabs              Display (in raw form) any STABS info in the file
  -W[lLiaprmfFsoORtUuTgAckK] or
  --dwarf[=rawline,=decodedline,=info,=abbrev,=pubnames,=aranges,=macro,=frames,
          =frames-interp,=str,=str-offsets,=loc,=Ranges,=pubtypes,
          =gdb_index,=trace_info,=trace_abbrev,=trace_aranges,
          =addr,=cu_index,=links,=follow-links]
                           Display DWARF info in the file
  --ctf=SECTION            Display CTF info from SECTION
  -t, --syms               Display the contents of the symbol table(s)
  -T, --dynamic-syms       Display the contents of the dynamic symbol table
  -r, --reloc              Display the relocation entries in the file
  -R, --dynamic-reloc      Display the dynamic relocation entries in the file
  @<file>                  Read options from <file>
  -v, --version            Display this program's version number
  -i, --info               List object formats and architectures supported
  -H, --help               Display this information
paran3xus@ParaN3xusLaptop:~/riscv-operating-system-mooc/exercises/3.1$ objdump -S
hello.c  hello.o  log.md
paran3xus@ParaN3xusLaptop:~/riscv-operating-system-mooc/exercises/3.1$ objdump -S hello.o

hello.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <main>:
#include<stdio.h>

int main()
{
   0:   55                      push   %rbp
   1:   48 89 e5                mov    %rsp,%rbp
    printf("hello world!");
   4:   48 8d 3d 00 00 00 00    lea    0x0(%rip),%rdi        # b <main+0xb>
   b:   b8 00 00 00 00          mov    $0x0,%eax
  10:   e8 00 00 00 00          callq  15 <main+0x15>
    return 0;
  15:   b8 00 00 00 00          mov    $0x0,%eax
  1a:   5d                      pop    %rbp
  1b:   c3                      retq
paran3xus@ParaN3xusLaptop:~/riscv-operating-system-mooc/exercises/3.1$
```

