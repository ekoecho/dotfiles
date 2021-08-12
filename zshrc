#zmodload zsh/zprof
setopt nonomatch
source ~/zgen/zgen.zsh
export TERM="xterm-256color"
export HISTFILE=~/.zsh_history
if ! zgen saved; then

  # completions
  #zgen load zsh-users/zsh-completions src


    # save all to init script
    zgen save
fi
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey    "^[[3~"          delete-char
bindkey    "^[3;5~"         delete-char


export GOPATH=~/go
export PATH=/home/gee/.local/share/coursier/bin:/home/linuxbrew/.linuxbrew/bin:$HOME/bin:$HOME/.tfenv/bin:$HOME/.tgenv/bin:$HOME/.krew/bin:/home/graham/anaconda3/bin:$HOME/.cargo/bin:$PATH:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$GOPATH/bin:$HOME/scripts:$HOME/.tmux_scripts:/usr/local/go/bin:$HOME/Programs/sdk/platform-tools:$HOME/.composer/vendor/bin

#export TERM=xterm-256color
#export TERM=screen-256color
alias tmux="tmux -2"
alias tmls="tmux list-sessions"
alias tmks="tmux kill-session -t "

alias ap="ansible-playbook"
alias av="ansible-vault"
alias avv="ansible-vault view"

alias serve="python -m SimpleHTTPServer"

alias gotest='go test -v . | sed /PASS/s//$(printf "\033[32mPASS\033[0m")/ | sed /FAIL/s//$(printf "\033[31mFAIL\033[0m")/'

alias mkd-on='eval $(minikube docker-env)'
alias mkd-off='eval $(minikube docker-env -u)'
alias watch='watch '
alias k='kubectl'
alias kgp='kubectl get pods'
alias klo='kubectl logs'
alias kga='kubectl get all'
alias kgn='kubectl get namespaces'
alias k2='kubectl --kubeconfig ~/.kube/alt_config'
alias kbb='k run -i --tty --rm busybox --image=busybox --restart=Never -- sh'

alias ll='ls -lpah'


setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt correct

alias history='history 1'

zstyle -e ':completion::*:*:*:hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

autoload bashcompinit && bashcompinit
complete -C '/usr/local/bin/aws_completer' aws

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
alias preview="fzf --preview 'bat --color \"always\" {}'"
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(vim {})+abort'"
case `uname` in
  Darwin)
    # commands for OS X go here
    alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'
    alias updatedb='sudo /usr/libexec/locate.updatedb'
alias gitb="git branch | grep '^\*' | cut -d' ' -f2 | pbcopy"
  ;;
  Linux)
    # commands for Linux go here
alias gitb="git branch | grep '^\*' | cut -d' ' -f2 | xclip"
  ;;
  FreeBSD)
    # commands for FreeBSD go here
  ;;
esac
source ~/.profile

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export DOCKER_BUILDKIT=1

run_ranger () {
    echo
    ranger --choosedir=$HOME/.rangerdir < $TTY
    LASTDIR=`cat $HOME/.rangerdir`
    cd "$LASTDIR"
    zle reset-prompt
}
zle -N run_ranger
bindkey '^f' run_ranger

run_kubectx () {
    kubectx < $TTY
    zle reset-prompt
}
zle -N run_kubectx
bindkey '^k' run_kubectx

run_kubens () {
    kubens < $TTY
    zle reset-prompt
}
zle -N run_kubens
bindkey '^j' run_kubens



#source <(helm completion zsh)
source <(kubectl completion zsh)

# This is the same functionality as fzf's ctrl-t, except that the file or
# directory selected is now automatically cd'ed or opened, respectively.
fzf-open-file-or-dir() {
  local cmd="command find -L . \
    \\( -path '*/\\.*' -o -fstype 'dev' -o -fstype 'proc' \\) -prune \
    -o -type f -print \
    -o -type d -print \
    -o -type l -print 2> /dev/null | sed 1d | cut -b3-"
  local out=$(eval $cmd | fzf --preview="bat --color=always {}"  --exit-0)

  if [ -f "$out" ]; then
    vim "$out" < $TTY
  elif [ -d "$out" ]; then
    cd "$out"
    zle clear-screen
  fi
  zle reset-prompt
}
zle     -N   fzf-open-file-or-dir
bindkey '^P' fzf-open-file-or-dir

## History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000

## History command configuration
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history # share command history data

##eval "$(pyenv init -)"
#
#export PATH="/home/gee/.pyenv/bin:$PATH"
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"

#zgen load zsh-users/zsh-syntax-highlighting
#zprof

export GOPATH="$HOME/go"; export PATH="$GOPATH/bin:$PATH"; # g-install: do NOT edit, see https://github.com/stefanmaric/g

export PATH="$PATH:/usr/local/protobuf/bin"
eval "$(starship init zsh)"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"


fpath+=${ZDOTDIR:-~}/.zsh_functions

source /Users/Graham/.config/broot/launcher/bash/br
