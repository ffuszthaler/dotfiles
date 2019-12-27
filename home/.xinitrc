#!/usr/bin/env sh

# Xresources
xrdb -merge ~/.Xresources

# Cursor
xsetroot -cursor_name left_ptr

# Wallpaper
# feh --bg-scale /home/flo/Bilder/re-rendered-this-to-fix-artifacts.-2560×1440.jpg
feh --bg-scale /home/flo/Bilder/y_mountain.png
feh --bg-scale /home/flo/Bilder/cyber.jpg
# hsetroot -add "#c79081" -add "#dfa579" -gradient 0
# hsetroot -add "#DAD299" -add "#B0DAB9" -gradient 0
# hsetroot -add "#2193B0" -add "#6DD5ED" -gradient 0
# hsetroot -add "#0F2027" -add "#203A43" -add "#2C5364" -gradient 0
# hsetroot -add "#373B44" -add "#4286F4" -gradient 0
# hsetroot -solid "#c79081"
# hsetroot -solid "#09090D"

# Statusline
if ! pgrep "polybar" > /dev/null 2>&1 ; then
  ~/.config/polybar/launch.sh &
fi

# Compositor
killall -q picom;picom --config ~/.config/picom/picom.conf &

# Notification daemon
killall -q dunst;dunst --config ~/.config/dunst/dunstrc &

# Music daemon
mpd &

# Night mode
redshift &

# Window manager
# exec i3
sxhkd &
exec bspwm
