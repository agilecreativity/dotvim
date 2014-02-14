#!/usr/bin/env bash

# If you enable 'YouCompleteMe' then you may need to uncomment the next line
# ~/.vim/bundle/YouCompleteMe/install.sh

# For ultisnips
# see: https://github.com/SirVer/ultisnips/blob/master/doc/UltiSnips.txt
echo "Post installation for UltiSnips"
rm -rf ~/.vim/ftdetect
mkdir -p ~/.vim/ftdetect/
ln -fs ~/.vim/bundle/ultisnips/ftdetect/* ~/.vim/ftdetect/
