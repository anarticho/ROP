#!/bin/bash

binject -of ovf.bin -ns 40 A
binject -of flg.bin -x64 400690 -x64 601028 -s flag.txt
binject -of mem.bin -if flg.bin -x64 400628
binject -of prm.bin -x64 400693 -x64 601028
binject -of cll.bin -if prm.bin -x64 400510
binject -of ola.bin -if ovf.bin -if mem.bin -if cll.bin
