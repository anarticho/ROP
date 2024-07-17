#!/bin/bash

binject -of ovf.bin -ns 40 A
binject -of arg.bin -x64 40093c -x64 deadbeefdeadbeef -x64 cafebabecafebabe -x64 d00df00dd00df00d
binject -of cm1.bin -if arg.bin -x64 400720
binject -of cm2.bin -if arg.bin -x64 400740
binject -of cm3.bin -if arg.bin -x64 4006f0
binject -of ola.bin -if ovf.bin -if cm1.bin -if cm2.bin -if cm3.bin
