#!/bin/bash
mkdir GdbPrinters
cd GdbPrinters
svn co svn://gcc.gnu.org/svn/gcc/trunk/libstdc++-v3/python
cd ..
cp gdbinit ../.gdbinit
export PATH=$PATH:$HOME/VIM/lots/

