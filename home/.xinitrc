#!/usr/bin/env sh

# Xresources
xrdb -merge ~/.Xresources

# Cursor
xsetroot -cursor_name left_ptr

# Wallpaper
feh --bg-scale /home/flo/Bilder/re-rendered-this-to-fix-artifacts.-2560×1440.jpg

# Statusline
if ! pgrep "polybar" > /dev/null 2>&1 ; then
  ~/.config/polybar/launch.sh &
fi

# Picom
killall -q picom;picom --config ~/.config/picom/picom.conf &

# Dunst
killall -q dunst;dunst --config ~/.config/dunst/dunstrc &

# MPD
mpd &

# WM
sxhkd &
# exec i3
exec bspwm
