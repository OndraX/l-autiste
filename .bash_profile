#!/bin/sh
# NVM and NPM
# Set up Node Version Manager
export NVM_DIR="$HOME/.nvm"                            # You can change this if you want.
export NVM_SOURCE="/usr/share/nvm"                     # The AUR package installs it to here.
[ -s "$NVM_SOURCE/nvm.sh" ] && . "$NVM_SOURCE/nvm.sh"  # Load NVM

PATH="$HOME/.bin/:$HOME/.bin/scripts/:$HOME/.node_modules/bin:/opt/texlive/2019/bin/x86_64-linux:$PATH"
MANPATH="/opt/texlive/2019/texmf-dist/doc/man:$MANPATH"
INFOPATH="/opt/texlive/2019/texmf-dist/doc/info:$MANPATH"
export npm_config_prefix=~/.node_modules

startx
