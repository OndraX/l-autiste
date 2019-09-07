setxkbmap -layout cz,us -variant qwerty -option caps:hyper -print | sed -e '/xkb_symbols/s/"[[:space:]]/+local&/' | xkbcomp -I${HOME}/.config/xkb - ${DISPLAY} &
(xcape -e "Hyper_L=Escape" notify-send "running" -a "xcape") &
echo "keyboard settings reloaded" > /tmp/lifesaver.log
