# .dotfiles

These are my dotfiles.
You can use them if you want to.

To use pywal without it changing the wallpaper and with custom background color:
```
wal -b <background w/o #> -n -i <path/to/img>
```

Uses GNU Stow - https://www.gnu.org/software/stow/

Usage:
```
cd ~
git clone https://github.com/ffuszthaler/dotfiles.git
cd dotfiles
stow polybar (i3, nvim, ...)
```
