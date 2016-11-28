source ~/zgen/zgen.zsh
export TERM="xterm-256color"
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
#zgen oh-my-zsh themes/sorin
#zgen oh-my-zsh themes/agnoster
#zgen load caiogondim/bullet-train-oh-my-zsh-theme bullet-train

  # completions
    zgen load zsh-users/zsh-completions src


    # save all to init script
    zgen save
fi


POWERLEVEL9K_MODE='awesome-fontconfig'


POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status os_icon dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time background_jobs)

POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=4

POWERLEVEL9K_STATUS_VERBOSE=false

POWERLEVEL9K_PROMPT_ON_NEWLINE=true

zgen load bhilburn/powerlevel9k powerlevel9k



export GOPATH=~/go
export PATH=$HOME/.cargo/bin:$HOME/anaconda3/bin:$PATH:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$GOPATH/bin:$HOME/scripts:$HOME/.tmux_scripts:/usr/local/go/bin:$HOME/Programs/sdk/platform-tools:$HOME/.composer/vendor/bin

#export TERM=xterm-256color
#export TERM=screen-256color
alias tmux="tmux -2"
alias tmls="tmux list-sessions"
alias tmks="tmux kill-session -t "

alias ap="ansible-playbook"

alias serve="python -m SimpleHTTPServer"

alias gotest='go test -v . | sed /PASS/s//$(printf "\033[32mPASS\033[0m")/ | sed /FAIL/s//$(printf "\033[31mFAIL\033[0m")/'


setopt EXTENDED_HISTORY
setopt correct

zstyle -e ':completion::*:*:*:hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'


export NVM_DIR="/home/gclark/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
