# TODO: configure xcape to make caps act as modifier when pressed together with xyz
# TODO: compose key
# setxkbmap -print | sed -e '/xkb_symbols/s/"[[:space:]]/+local&/' | xkbcomp -I${HOME}/.config/xkb - ${DISPLAY}
stty -ixon
# tabcomplete wildcards
set show-all-if-ambiguous on

# colourful ls yaaay
alias ls='ls --color=auto'
# show number of running jobs if nonzero (to prevent their accidental murder) 
PS1='\u@\h:\w $([ \j -gt 0 ] && echo [\j])\$ '
# PS1='[\u@\h \W]\$ '


#export VIMINIT=":so $HOME/.vimrc"
export EDITOR=vim
export READER=zathura
export OPENER=rifle
export BROWSER=qutebrowser
export EXPLORER=lf

PACKAGE_MANAGER="yay -S"
PACKAGE_SEARCH="yay -Ss"
PACKAGE_REMOVE="sudo pacman -R"
alias "i"="$PACKAGE_MANAGER"
alias "update"="$PACKAGE_MANAGER -uv"
alias "?"="$PACKAGE_SEARCH"
alias "d"="$PACKAGE_REMOVE"

alias "o"="$OPENER"
alias "r"="read_pdf"

alias "uw"='PYTHONENCODING="UTF-8" urlwatch'
shopt -s globstar
shopt -s expand_aliases

function search_for(){
	grep "$*" -nri .
}
alias s=search_for

alias "tday"="date '+%H-%M_%d-%m-%y'"

# Common aliases
alias "la"="ls -a"
alias "ll"="ls -l"
alias "lr"="ls -R"
alias ":q"="exit"
alias "edb"="$EDITOR ~/.bashrc"
alias "sob"="source ~/.bashrc"
alias ".."="cd .."
alias "..."="cd ../.."
alias "...."="cd ../../.."
alias "....."="cd ../../../.."
# alias "lf"="lf.sh"

# get current directory into clipboard - for faster internet upload
alias "yy"="echo \$PWD | xclip -i"


alias "v"="$EDITOR"
alias "avim"="vim -u ~/.altvim/.vimrc"
alias "fvim"="$HOME/.bin/scripts/scr.pl & vim -c 'hi Normal NONE' && kill $!"
alias "vimrc"="$EDITOR ~/.vimrc"
# TODO: rename (apparently nim is another thing)
alias "bim"="vim -u NONE"

# TEMPORARY
# add last executed line to steps.md 
alias "writesteps"="fc -ln -1 | cat >> ~/pers/sys/steps.md"
alias "ws"="fc -ln -1 | cat >> ~/pers/sys/steps.md"

# Configure different parts of the system
# TODO: outsource to parsed file


alias "cfi"="$EDITOR ~/.config/i3/config"
alias "cfp"="$EDITOR ~/.config/polybar/config"
alias "cfq"="$EDITOR ~/.config/qutebrowser/config.py"
alias "cfc"="$EDITOR ~/.config/compton/compton.conf"
alias "cfs"="$EDITOR ~/.config/sxhkd/sxhkdrc"
alias "cfb"="$EDITOR ~/.config/bspwm/bspwmrc"
alias "cfl"="$EDITOR ~/.config/lf/lfrc"
alias "cfr"="$EDITOR ~/.config/ranger/rifle.conf"
alias "cfe"="$EDITOR ~/.config/emmet-vim/snippets.json"

alias "cg"="pushd /srv/http/grav/"


# Family of functions to facilitate bookmarking of folders within filesystem (duh)

LINKS="$HOME/.links"

mkdir -p "$LINKS"

function _make_bookmark_completion(){
	subdirlist=$(cd $LINKS && find -L . -maxdepth 2 -printf "%h/%f " | sed -e "s/\.\///g")
	# echo $subdirlist
	complete -W "$subdirlist" ul
	complete -W "$subdirlist" e
	complete -W "$subdirlist" gt
}

function ul(){
	#Unlinks Link to current directory or by name specified in argument 1
	unlink "$LINKS/${1:-$(basename $PWD)}"

}
function ml(){
	#Makes Link to current directory with name of link as optional
	mkdir -p "$LINKS"
	ln -s $PWD "$LINKS/${1:-$(basename $PWD)}"
}
function e(){
	#Echos target of link by name
	dirto="$LINKS/$1"
	readlink -f "$dirto"
}
function to(){
	#Goes To link with name given by parameter or to link directory
	mkdir -p "$LINKS"
	dirto="$LINKS/$1"
	cd -P "$dirto"
}

_make_bookmark_completion

# End link functions

# Allow npm global use without sudo
NPM_PACKAGES="${HOME}/.npm"
PATH="$NPM_PACKAGES/bin:$PATH"

# execute local npm packages
function npm-do { (PATH=$(npm bin):$PATH; eval $@;) }

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
PATH="/opt:$PATH"
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# disable flow-control keys <c-q> and <c-s> (we want to use them in mappings)
stty -ixon

# to be used in i3_shell for opening terminal in cwd
export PROMPT_COMMAND="pwd > /tmp/whichdir"

# very large bash history and across multiple terminals -- as per SO https://unix.stackexchange.com/a/48116

HISTSIZE=90000
HISTFILESIZE=$HISTSIZE
HISTCONTROL=ignorespace:ignoredups

_bash_history_sync() {
builtin history -a         #1
HISTFILESIZE=$HISTSIZE     #2
builtin history -c         #3
builtin history -r         #4
}

history() {                  #5
	_bash_history_sync
	builtin history "$@"
}

PROMPT_COMMAND="_bash_history_sync; $PROMPT_COMMAND" # If the CDTO variable is set, change to that directory
# this is for a terminal-agnostic ability to open new term
# in any directory i choose; TODO: make this solution
# not dependent on interaction of two files (window manager
# config and bashrc, also figure out better way to send this info
# than an entirely random variable)
[ ! -z $CDTO ] && cd $CDTO

# container() {
# 	pid=$$
# 	while true; do
# 		pid=$(ps -h -o ppid -p $pid 2>/dev/null)
# 		case $(ps -h -o comm -p $pid 2>/dev/null) in
# 			(gnome-terminal) echo "Running in gnome terminal";return;;
# 			(xterm) echo "Running in xterm";return;;
# 			(rxvt) echo "Running in rxvt";return;;
# 			(python) if [ ! -z "$(ps -h -o args -p $pid 2>/dev/null | grep guake)" ]; then echo "Running in Guake"; return; fi ;;
# 			* ) echo $(ps -h -o comm -p $pid 2>/dev/null) return ;;
# 		esac
# 		[[ $(echo $pid) == 1 ]] && break
# 	done
# }

# make term colors according to powerline-shell 
alias "ps"="encfs /home/arch/bezpredmetnosti/untenable_vow/ /home/arch/aca/form/"
alias "pq"="sudo fusermount -u /home/arch/aca/form/"

# {{{ fzf config
export FZF_DEFAULT_COMMAND="fd --absolute-path --type file --color=always --follow --search-path /home/arch --search-path /home/arch/.config --search-path /home/arch/.bin"
export FZF_DEFAULT_OPTS="--ansi"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# }}}
