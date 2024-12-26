#if status is-interactive
#    # Commands to run in interactive sessions can go here
#    pyenv init - | source
#end
alias rmi="rm -i"
alias e='emacsclient -nc -a emacs $argv'
alias pytest='python -m pytest'
alias log='journalctl -x -e'
alias ytdl='youtube-dl -x --audio-format mp3'
alias glog='git log --pretty=format:"%h%x09%an%x09%ad%x09%s"'
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
alias git_undo_unstaged_whitespace='git diff -U0 -w --no-color | git apply --cached --ignore-whitespace --unidiff-zero -'

fish_add_path ~/dotfiles/scripts

setenv EDITOR vim
