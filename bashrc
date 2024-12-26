#!/usr/bin/env bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ $TERM == "dumb" ]] && PS1='$ ' && return

# https://github.com/wofr06/lesspipe
export LESSOPEN="|/usr/bin/lesspipe.sh %s"

# # Change the window title of X terminals
case ${TERM} in
  xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
      PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
      ;;
  screen*)
      PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
      ;;
esac

source "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize
shopt -s expand_aliases

# Enable history appending instead of overwriting.  #139609
shopt -s histappend

# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
#export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# This clears all the history entries kept currently in memory and then re-reads the whole history
# from the history-file. So all the commands you issued since logging into the current shell session
# are forgotten. I find it quite useful in situations when I do a lot of testing (many similar
# commands, but not really duplicates) and then don't want to have my history garbaged by that - so
# I have an alias for it in my .bashrc:
alias hrr='history -c; history -r'

if [[ ${EUID} == 0 ]] ; then
    PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\] '
else
    PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\] '
fi

#########################################################################################
# aliases
#########################################################################################

markdown () {
    pandoc  | lynx -stdin
}

find_dos_lineendings() {
  find . -not -type d -exec file "{}" ";" | grep CRLF
}

function shrink_pdf () {
  gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -dNOPAUSE -dQUIET -dBATCH -sOutputFile="$2" "$1"
}

# aliases for common utils
function uniqq () {
  awk '!x[$0]++' "$1" "$2"

}
alias sshot='import png:- | xclip -selection clipboard -t image/png'
alias log='journalctl -x -e'
alias fjulia='julia  -O0 --compile=min' # julia with fast startup
alias e='emacsclient -nc -a "emacs"'
alias ytdl='youtube-dl -x --audio-format mp3'
alias fixdocker='sudo chmod 666 /var/run/docker.sock'
alias glog='git log --pretty=format:"%h%x09%an%x09%ad%x09%s"'
#alias cp="cp -i"                          # confirm before overwriting something
alias df='df -x"squashfs"' # exclude snaps etc.
alias dus='du -sh ./* | sort -h'   # shallow df
alias free='free -m'                      # show sizes in MB
alias more=less
alias mosh='mosh --no-init'
alias od16='od -Ad -w2 -x --endian=little'
alias od32='od -Ad -w4 -x --endian=little'
alias od8='od -Ad -w1  -x --endian=little'
alias reverse_larry='ssh -R 43022:localhost:22 larry'
alias rs='rsync -a --info=progress2'
alias tclsh='rlwrap tclsh' # tclshell with history
alias xclip="xclip -selection c"
alias xo='xdg-open'
alias xpid='xprop _NET_WM_PID'
alias files='find . -type f | cut -d/ -f2 | sort | uniq -c | sort -h'
alias fdfind='fd'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias git_undo_unstaged_whitespace='git diff -U0 -w --no-color | git apply --cached --ignore-whitespace --unidiff-zero -'

alias makelatex='latexmk -xelatex --shell-escape -pvc -pdf -interaction=nonstopmode'

alias setmonitors='xrandr --output DisplayPort-0 --left-of HDMI-A-O --primary --output DisplayPort-1 --left-of HDMI-A-0 --output eDP --off'

# Add an "alert" function for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

#########################################################################################
# path
#########################################################################################

function add_to_path {
    if [ -d "$1" ] ; then
        export PATH="$1:$PATH"
    fi
}

#########################################################################################
# fzf
#########################################################################################

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#Ctrl+o to open files directly with preferred application.
bind -x '"\C-o": file="$(fzf --height 40% --reverse)" && [ -f "$file" ] && xdg-open "$file"'
#
bind -x '"\C-p": file="$(fzf --preview "bat --color=always --style=numbers --line-range=:500 {}")" && [ -f "$file" ] && xdg-open "$file"'

function fcd() {
    local dir;

    while true; do
    # exit with ^D
    dir="$(ls -a1p | grep '/$' | grep -v '^./$' | fzf --height 40% --reverse --no-multi --preview 'pwd' --preview-window=up,1,border-none --no-info)"
    if [[ -z "${dir}" ]]; then
        break
    else
        cd "${dir}" || exit
    fi
    done
}

#########################################################################################
# Functions
#########################################################################################

function say() {
    if [[ "${1}" =~ -[a-z]{2} ]]; then
        local lang=${1#-};
        local text="${*#$1}";
    else
        local lang=${LANG%_*};
        local text="$*";
    fi;
    mplayer -msglevel all=0 "http://translate.google.com/translate_tts?ie=UTF-8&tl=${lang}&q=${text}" &> /dev/null ;
}

function swap_usage() {
    for file in /proc/*/status ; do awk '/Tgid|VmSwap|Name/{printf $2 " " $3}END{ print ""}' "$file"; done | grep kB | sort -k 3 -n
}

function ztar () {
  tar acvf "$1.tar.zst" "$1"
}

beautify() {
    emacs -batch -l ~/.emacs "$1" -f vhdl-beautify-buffer
}

################################################################################
# Xilinx
################################################################################

function Analyzer() {
    Redbox
    analyzer&
}

function Impact() {
    Redbox
    impact&
}

function ISE() {
    export LD_PRELOAD="/Xilinx/usb-driver/libusb-driver.so"
    source "/Xilinx/14.7/ISE_DS/settings64.sh" >> /dev/null 2>&1
    export DISPLAY=":0"
}

function ISE10() {
    source "/Xilinx/10.1/ISE/settings64.sh"
}

function fixusb() {
    for i in /sys/bus/pci/drivers/[uoex]hci_hcd/*:*; do
        [ -e "$i" ] || continue
        echo "${i##*/}" > "${i%/*}/unbind"
        echo "${i##*/}" > "${i%/*}/bind"
    done
}

#########################################################################################
# misc
#########################################################################################


function killmy() {
  ps aux | grep "$1" | grep $USER | grep -v grep | awk '{print $2}' | xargs kill
}

function killmyfirefox() {
  ps aux | grep firefox | grep $USER | grep -v grep | awk '{print $2}' | xargs kill
}

# expand all tabs for cpp files
#find . -name '*.cpp' -type f -exec bash -c 'expand -t 4 "$0" | sponge "$0"' {} \;
