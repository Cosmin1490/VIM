#!/bin/bash
mkdir GdbPrinters
cd GdbPrinters
svn co svn://gcc.gnu.org/svn/gcc/trunk/libstdc++-v3/python
cd ..
cp config/gdbinit ../.gdbinit
cp config/ctags ../.ctags
cp config/vimperatorrc ../.vimperatorrc
cat ../.bash_profile config/bash_profile >>../.bash_profile
