#!/bin/bash

xsetroot -solid black &

xmodmap ~/.Xmodmap

xbindkeys &

alacritty &

wmctrl -r "Alacritty" -b add,maximized_vert,maximized_horz

wait
