source ~/zgen/zgen.zsh
if ! zgen saved; then

# Load the oh-my-zsh's library.
zgen oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
zgen oh-my-zsh plugins/golang
zgen oh-my-zsh plugins/ssh-agent
zgen oh-my-zsh plugins/docker
zgen oh-my-zsh plugins/command-not-found

zgen load zsh-users/zsh-syntax-highlighting

# Load the theme.
zgen oh-my-zsh themes/sorin

  # completions
    zgen load zsh-users/zsh-completions src


    # save all to init script
    zgen save
fi
export GOPATH=~/go
export PATH=$PATH:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$GOPATH/bin:$HOME/scripts:$HOME/.tmux_scripts:/usr/local/go/bin

export TERM=xterm-256color
#export TERM=screen-256color
alias tmux="tmux -2"
alias tmls="tmux list-sessions"
alias tmks="tmux kill-session -t "

alias serve="python -m SimpleHTTPServer"

setopt EXTENDED_HISTORY
setopt correct

zstyle -e ':completion::*:*:*:hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

