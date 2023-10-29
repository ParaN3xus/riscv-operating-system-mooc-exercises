由于所使用的工具链和和课程视频不一致，导致rv32ima架构无法正常编译，第四节内容使用rv64完成

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
paran3xus@ParaN3xusLaptop:~/riscv-operating-system-mooc-exercises/4.1$ qemu-riscv64 a.out
hello world!paran3xus@ParaN3xusLaptop:~/riscv-operating-system-mooc-exercises/4.1$ riscv64-linux-gnu-readelf a.out  -h
ELF Header:
  Magic:   7f 45 4c 46 02 01 01 00 00 00 00 00 00 00 00 00
  Class:                             ELF64
  Data:                              2's complement, little endian
  Version:                           1 (current)
  OS/ABI:                            UNIX - System V
  ABI Version:                       0
  Type:                              DYN (Shared object file)
  Machine:                           RISC-V
  Version:                           0x1
  Entry point address:               0x560
  Start of program headers:          64 (bytes into file)
  Start of section headers:          6744 (bytes into file)
  Flags:                             0x5, RVC, double-float ABI
  Size of this header:               64 (bytes)
  Size of program headers:           56 (bytes)
  Number of program headers:         9
  Size of section headers:           64 (bytes)
  Number of section headers:         28
  Section header string table index: 27
  
paran3xus@ParaN3xusLaptop:~/riscv-operating-system-mooc-exercises/4.1$ riscv64-linux-gnu-readelf a.out -SW
There are 28 section headers, starting at offset 0x1a58:

Section Headers:
  [Nr] Name              Type            Address          Off    Size   ES Flg Lk Inf Al
  [ 0]                   NULL            0000000000000000 000000 000000 00      0   0  0
  [ 1] .interp           PROGBITS        0000000000000238 000238 000021 00   A  0   0  1
  [ 2] .note.gnu.build-id NOTE            000000000000025c 00025c 000024 00   A  0   0  4
  [ 3] .note.ABI-tag     NOTE            0000000000000280 000280 000020 00   A  0   0  4
  [ 4] .gnu.hash         GNU_HASH        00000000000002a0 0002a0 000024 00   A  5   0  8
  [ 5] .dynsym           DYNSYM          00000000000002c8 0002c8 0000c0 18   A  6   2  8
  [ 6] .dynstr           STRTAB          0000000000000388 000388 000074 00   A  0   0  1
  [ 7] .gnu.version      VERSYM          00000000000003fc 0003fc 000010 02   A  5   0  2
  [ 8] .gnu.version_r    VERNEED         0000000000000410 000410 000020 00   A  6   1  8
  [ 9] .rela.dyn         RELA            0000000000000430 000430 0000c0 18   A  5   0  8
  [10] .rela.plt         RELA            00000000000004f0 0004f0 000030 18  AI  5  21  8
  [11] .plt              PROGBITS        0000000000000520 000520 000040 10  AX  0   0 16
  [12] .text             PROGBITS        0000000000000560 000560 000152 00  AX  0   0  4
  [13] .rodata           PROGBITS        00000000000006b8 0006b8 00000d 00   A  0   0  8
  [14] .eh_frame_hdr     PROGBITS        00000000000006c8 0006c8 000014 00   A  0   0  4
  [15] .eh_frame         PROGBITS        00000000000006e0 0006e0 00002c 00   A  0   0  8
  [16] .preinit_array    PREINIT_ARRAY   0000000000001e08 000e08 000008 08  WA  0   0  1
  [17] .init_array       INIT_ARRAY      0000000000001e10 000e10 000008 08  WA  0   0  8
  [18] .fini_array       FINI_ARRAY      0000000000001e18 000e18 000008 08  WA  0   0  8
  [19] .dynamic          DYNAMIC         0000000000001e20 000e20 0001e0 10  WA  6   0  8
  [20] .data             PROGBITS        0000000000002000 001000 000008 00  WA  0   0  8
  [21] .got              PROGBITS        0000000000002008 001008 000048 08  WA  0   0  8
  [22] .sdata            PROGBITS        0000000000002050 001050 000004 00  WA  0   0  4
  [23] .bss              NOBITS          0000000000002054 001054 000004 00  WA  0   0  1
  [24] .comment          PROGBITS        0000000000000000 001054 000027 01  MS  0   0  1
  [25] .symtab           SYMTAB          0000000000000000 001080 000630 18     26  45  8
  [26] .strtab           STRTAB          0000000000000000 0016b0 00029e 00      0   0  1
  [27] .shstrtab         STRTAB          0000000000000000 00194e 000104 00      0   0  1
Key to Flags:
  W (write), A (alloc), X (execute), M (merge), S (strings), I (info),
  L (link order), O (extra OS processing required), G (group), T (TLS),
  C (compressed), x (unknown), o (OS specific), E (exclude),
  p (processor specific)
  
paran3xus@ParaN3xusLaptop:~/riscv-operating-system-mooc-exercises/4.1$ riscv64-linux-gnu-gcc -march=rv64ifd hello.c -g
paran3xus@ParaN3xusLaptop:~/riscv-operating-system-mooc-exercises/4.1$ riscv64-linux-gnu-objdump -S a.out

a.out:     file format elf64-littleriscv


Disassembly of section .plt:

0000000000000520 <.plt>:
 520:   00002397                auipc   t2,0x2
 524:   41c30333                sub     t1,t1,t3
 528:   ae83be03                ld      t3,-1304(t2) # 2008 <__TMC_END__>
 52c:   fd430313                addi    t1,t1,-44
 530:   ae838293                addi    t0,t2,-1304
 534:   00135313                srli    t1,t1,0x1
 538:   0082b283                ld      t0,8(t0)
 53c:   000e0067                jr      t3

0000000000000540 <__libc_start_main@plt>:
 540:   00002e17                auipc   t3,0x2
 544:   ad8e3e03                ld      t3,-1320(t3) # 2018 <__libc_start_main@GLIBC_2.27>
 548:   000e0367                jalr    t1,t3
 54c:   00000013                nop

0000000000000550 <printf@plt>:
 550:   00002e17                auipc   t3,0x2
 554:   ad0e3e03                ld      t3,-1328(t3) # 2020 <printf@GLIBC_2.27>
 558:   000e0367                jalr    t1,t3
 55c:   00000013                nop

Disassembly of section .text:

0000000000000560 <_start>:
 560:   02e000ef                jal     ra,58e <load_gp>
 564:   87aa                    mv      a5,a0
 566:   00002517                auipc   a0,0x2
 56a:   ad253503                ld      a0,-1326(a0) # 2038 <_GLOBAL_OFFSET_TABLE_+0x10>
 56e:   6582                    ld      a1,0(sp)
 570:   0030                    addi    a2,sp,8
 572:   ff017113                andi    sp,sp,-16
 576:   00000697                auipc   a3,0x0
 57a:   0e268693                addi    a3,a3,226 # 658 <__libc_csu_init>
 57e:   00000717                auipc   a4,0x0
 582:   13270713                addi    a4,a4,306 # 6b0 <__libc_csu_fini>
 586:   880a                    mv      a6,sp
 588:   fb9ff0ef                jal     ra,540 <__libc_start_main@plt>
 58c:   9002                    ebreak

000000000000058e <load_gp>:
 58e:   00002197                auipc   gp,0x2
 592:   27218193                addi    gp,gp,626 # 2800 <__global_pointer$>
 596:   8082                    ret
        ...

000000000000059a <deregister_tm_clones>:
 59a:   00002517                auipc   a0,0x2
 59e:   a6e50513                addi    a0,a0,-1426 # 2008 <__TMC_END__>
 5a2:   00002797                auipc   a5,0x2
 5a6:   a6678793                addi    a5,a5,-1434 # 2008 <__TMC_END__>
 5aa:   00a78863                beq     a5,a0,5ba <deregister_tm_clones+0x20>
 5ae:   00002797                auipc   a5,0x2
 5b2:   a827b783                ld      a5,-1406(a5) # 2030 <_ITM_deregisterTMCloneTable>
 5b6:   c391                    beqz    a5,5ba <deregister_tm_clones+0x20>
 5b8:   8782                    jr      a5
 5ba:   8082                    ret

00000000000005bc <register_tm_clones>:
 5bc:   00002517                auipc   a0,0x2
 5c0:   a4c50513                addi    a0,a0,-1460 # 2008 <__TMC_END__>
 5c4:   00002597                auipc   a1,0x2
 5c8:   a4458593                addi    a1,a1,-1468 # 2008 <__TMC_END__>
 5cc:   8d89                    sub     a1,a1,a0
 5ce:   4035d793                srai    a5,a1,0x3
 5d2:   91fd                    srli    a1,a1,0x3f
 5d4:   95be                    add     a1,a1,a5
 5d6:   8585                    srai    a1,a1,0x1
 5d8:   c599                    beqz    a1,5e6 <register_tm_clones+0x2a>
 5da:   00002797                auipc   a5,0x2
 5de:   a6e7b783                ld      a5,-1426(a5) # 2048 <_ITM_registerTMCloneTable>
 5e2:   c391                    beqz    a5,5e6 <register_tm_clones+0x2a>
 5e4:   8782                    jr      a5
 5e6:   8082                    ret

00000000000005e8 <__do_global_dtors_aux>:
 5e8:   1141                    addi    sp,sp,-16
 5ea:   e022                    sd      s0,0(sp)
 5ec:   00002417                auipc   s0,0x2
 5f0:   a6840413                addi    s0,s0,-1432 # 2054 <completed.0>
 5f4:   00044783                lbu     a5,0(s0)
 5f8:   e406                    sd      ra,8(sp)
 5fa:   e385                    bnez    a5,61a <__do_global_dtors_aux+0x32>
 5fc:   00002797                auipc   a5,0x2
 600:   a447b783                ld      a5,-1468(a5) # 2040 <__cxa_finalize@GLIBC_2.27>
 604:   c791                    beqz    a5,610 <__do_global_dtors_aux+0x28>
 606:   00002517                auipc   a0,0x2
 60a:   9fa53503                ld      a0,-1542(a0) # 2000 <__dso_handle>
 60e:   9782                    jalr    a5
 610:   f8bff0ef                jal     ra,59a <deregister_tm_clones>
 614:   4785                    li      a5,1
 616:   00f40023                sb      a5,0(s0)
 61a:   60a2                    ld      ra,8(sp)
 61c:   6402                    ld      s0,0(sp)
 61e:   0141                    addi    sp,sp,16
 620:   8082                    ret

0000000000000622 <frame_dummy>:
 622:   bf69                    j       5bc <register_tm_clones>

0000000000000624 <main>:
#include<stdio.h>

int main()
{
 624:   ff010113                addi    sp,sp,-16
 628:   00113423                sd      ra,8(sp)
 62c:   00813023                sd      s0,0(sp)
 630:   01010413                addi    s0,sp,16
    printf("hello world!");
 634:   00000517                auipc   a0,0x0
 638:   08450513                addi    a0,a0,132 # 6b8 <__libc_csu_fini+0x8>
 63c:   f15ff0ef                jal     ra,550 <printf@plt>
    return 0;
 640:   00000793                li      a5,0
 644:   00078513                mv      a0,a5
 648:   00813083                ld      ra,8(sp)
 64c:   00013403                ld      s0,0(sp)
 650:   01010113                addi    sp,sp,16
 654:   00008067                ret

0000000000000658 <__libc_csu_init>:
 658:   7139                    addi    sp,sp,-64
 65a:   f822                    sd      s0,48(sp)
 65c:   f04a                    sd      s2,32(sp)
 65e:   00001417                auipc   s0,0x1
 662:   7b240413                addi    s0,s0,1970 # 1e10 <__frame_dummy_init_array_entry>
 666:   00001917                auipc   s2,0x1
 66a:   7b290913                addi    s2,s2,1970 # 1e18 <__do_global_dtors_aux_fini_array_entry>
 66e:   40890933                sub     s2,s2,s0
 672:   fc06                    sd      ra,56(sp)
 674:   f426                    sd      s1,40(sp)
 676:   ec4e                    sd      s3,24(sp)
 678:   e852                    sd      s4,16(sp)
 67a:   e456                    sd      s5,8(sp)
 67c:   40395913                srai    s2,s2,0x3
 680:   00090f63                beqz    s2,69e <__libc_csu_init+0x46>
 684:   89aa                    mv      s3,a0
 686:   8a2e                    mv      s4,a1
 688:   8ab2                    mv      s5,a2
 68a:   4481                    li      s1,0
 68c:   601c                    ld      a5,0(s0)
 68e:   8656                    mv      a2,s5
 690:   85d2                    mv      a1,s4
 692:   854e                    mv      a0,s3
 694:   0485                    addi    s1,s1,1
 696:   9782                    jalr    a5
 698:   0421                    addi    s0,s0,8
 69a:   fe9919e3                bne     s2,s1,68c <__libc_csu_init+0x34>
 69e:   70e2                    ld      ra,56(sp)
 6a0:   7442                    ld      s0,48(sp)
 6a2:   74a2                    ld      s1,40(sp)
 6a4:   7902                    ld      s2,32(sp)
 6a6:   69e2                    ld      s3,24(sp)
 6a8:   6a42                    ld      s4,16(sp)
 6aa:   6aa2                    ld      s5,8(sp)
 6ac:   6121                    addi    sp,sp,64
 6ae:   8082                    ret

00000000000006b0 <__libc_csu_fini>:
 6b0:   8082                    ret
```

