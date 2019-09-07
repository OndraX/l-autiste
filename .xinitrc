# shouldn't be necessary -- souce .Xdefaults configsAsdfasdasdfasd
xrdb .Xdefaults &
setxkbmap -layout cz,us -variant qwerty -option caps:hyper -print | sed -e '/xkb_symbols/s/"[[:space:]]/+local&/' | xkbcomp -I${HOME}/.config/xkb - ${DISPLAY} &
# explanation: capslock becomes hyper, hyper becomes escape when pressed on its own, stays hyper otherwise
dunst &
sxhkd -c ~/.config/sxhkd/sxhkdrc -m 2 &
(notify-send "starting" -a "xcape" && xcape -e "Hyper_L=Escape" && notify-send "running" -a "xcape") &
exec bspwm -c ~/.config/bspwm/bspwmrc
# xcape needs to start in a subshell and after a certain timeout on my machine, otherwise does nothing
