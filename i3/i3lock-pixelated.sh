#!/usr/bin/env bash 
icon=$HOME/.config/i3/lock.png
background=/tmp/screen.png

_icon_offset_x() {
    local iconWidth=$(identify -format "%w" $icon)
    local backgroundWidth=$(identify -format "%w" $background)

    echo $(((backgroundWidth / 4) - (iconWidth / 2)))
}

scrot $background
convert $background -scale 10% -scale 1000% $background

offsetX=$(_icon_offset_x)
convert $background $icon -gravity west -geometry +${offsetX}+0 -composite -matte $background
convert $background $icon -gravity east -geometry +${offsetX}+0 -composite -matte $background

i3lock -e -i $background

rm $background
