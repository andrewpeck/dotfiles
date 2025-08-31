#if status is-interactive
#    # Commands to run in interactive sessions can go here
#    pyenv init - | source
#end
alias vim="nvim"
alias rmi="rm -i"
alias e='emacsclient -nc -a emacs $argv'
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
fish_add_path ~/.config/emacs/bin

source ~/.nix-profile/etc/profile.d/nix.fish

setenv BROWSER firefox
setenv EDITOR vim
setenv LESSOPEN "|lesspipe.sh %s" # https://github.com/wofr06/lesspipe

abbr --add venv 'uv venv --python 3.12 && source .venv/bin/activate.fish'
abbr --add gco 'git checkout'
abbr --add gct 'git checkout -t'
abbr --add gg  'git status'
abbr --add gba 'git branch -a'

abbr --add sai 'sudo apt install'
abbr --add sar 'sudo apt remove'
abbr --add sau 'sudo apt update && sudo apt upgrade'
abbr --add gl 'git log --reverse'

abbr --add jpl 'uv run --with jupyter jupyter lab'
abbr --add pipq 'pip install -e . --no-deps --no-build-isolation'

# https://github.com/akermu/emacs-libvterm
if test "$INSIDE_EMACS" = "vterm" \
    -a -n "$EMACS_VTERM_PATH" \
    -a -f "$EMACS_VTERM_PATH/etc/emacs-vterm.fish"
    source "$EMACS_VTERM_PATH/etc/emacs-vterm.fish"
end

bind \cy 'set file "$(fd . ~/Pictures | fzf --height 40% --preview "preview {}")" && [ -f "$file" ] && xdg-open "$file"'
bind \co 'set file "$(fd . ~/ | fzf --height 40% --preview "preview {}")" && [ -f "$file" ] && xdg-open "$file"'
