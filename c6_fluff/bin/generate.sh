#!/bin/bash

binject -of ovf.bin -ns 40 A

binject -of flg.bin -x 7478742e67612d74

binject -of bex.bin -a 40062a -a 4000 -if flg.bin

binject -of xla.bin -a 400628

binject -of rdi.bin -a 4006a3 -a 601038

binject -of sto.bin -a 400639

binject -of fin.bin -if ovf.bin -if bex.bin -if xla.bin -if rdi.bin -if sto.bin
