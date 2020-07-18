#!/bin/sh
(killall conky -q) 2> /dev/null
/home/webmalc/Projects/dotfiles/conky/conky_left.sh
/home/webmalc/Projects/dotfiles/conky/conky_right.sh
