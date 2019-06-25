#!/usr/bin/env bash
bgImg=/tmp/screen_locked.png
lockImg=$HOME/.config/i3/lock.png

scrot $bgImg
convert $bgImg -blur 2x2  -charcoal 1 -colorize 70%  $bgImg 
convert $bgImg -blur 1x1  -implode 1 -colorize 20%   $bgImg
convert $bgImg -scale 20% -scale 500%  $bgImg 
convert $bgImg $lockImg -gravity center -composite -matte $bgImg 
if ! i3lock -d -i $bgImg; then
    return 1
fi
