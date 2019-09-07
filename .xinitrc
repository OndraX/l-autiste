# shouldn't be necessary -- souce .Xdefaults configsAsdfasdasdfasd
xrdb .Xdefaults &
setxkbmap -layout cz,us -variant qwerty -option caps:hyper -print | sed -e '/xkb_symbols/s/"[[:space:]]/+local&/' | xkbcomp -I${HOME}/.config/xkb - ${DISPLAY} &
# explanation: hyper 
dunst &
sxhkd -c ~/.config/sxhkd/sxhkdrc -m 2 &
(notify-send "starting" -a "xcape" && xcape -e "Hyper_L=Escape" && notify-send "running" -a "xcape") &
exec bspwm -c ~/.config/bspwm/bspwmrc
