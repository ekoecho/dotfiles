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

# Disable dir icons
 POWERLEVEL9K_HOME_ICON=''
 POWERLEVEL9K_HOME_SUB_ICON=''
 POWERLEVEL9K_FOLDER_ICON=''


POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time background_jobs)

POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=4

POWERLEVEL9K_STATUS_VERBOSE=false

POWERLEVEL9K_PROMPT_ON_NEWLINE=true

POWERLEVEL9K_LINUX_ICON="\ue73a"
POWERLEVEL9K_OS_ICON_BACKGROUND="166"
POWERLEVEL9K_DIR_HOME_FOREGROUND="white"
POWERLEVEL9K_DIR_HOME_BACKGROUND="237"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="white"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="237"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="white"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="237"
POWERLEVEL9K_TIME_BACKGROUND="237"
POWERLEVEL9K_TIME_FOREGROUND="white"
POWERLEVEL9K_FAIL_ICON="\uf05e"
#POWERLEVEL9K_FAIL_ICON="\e[1m¯\(ツ)/¯"




POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='235'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='235'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='235'

POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='220'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='220'
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='028'
#POWERLEVEL9K_VCS_STAGED_ICON="%{%F{070}%}\u2517%{%F{default}%}"


zgen load bhilburn/powerlevel9k powerlevel9k



export GOPATH=~/go
export PATH=/home/graham/anaconda3/bin:$HOME/.cargo/bin:$PATH:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$GOPATH/bin:$HOME/scripts:$HOME/.tmux_scripts:/usr/local/go/bin:$HOME/Programs/sdk/platform-tools:$HOME/.composer/vendor/bin

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
alias skynet='firefox skynet.novamedia.com/#/login'
alias vra='google-chrome https://serviceportal.novamedia.com/vcac/org/novamedia/#'
alias vsphere='google-chrome https://prvmvc001024.infra.novamedia.com:9443/vsphere-client/#'
alias awsst='firefox https://signin.aws.amazon.com/switchrole?account=107538011926\&roleName=rol-identity-admin\&displayName=st\ admin'
alias awsat='firefox https://signin.aws.amazon.com/switchrole?account=113268170478\&roleName=rol-identity-admin\&displayName=at\ admin'
alias awspr='firefox https://signin.aws.amazon.com/switchrole?account=163568250066\&roleName=rol-identity-admin\&displayName=pr\ admin'
alias awsst='firefox https://signin.aws.amazon.com/switchrole?account=107538011926\&roleName=rol-identity-admin\&displayName=T-admin'

#ppl-sw-logging  aws.sw.logging@postcodelottery.co.uk    515951999644    Created on 6/9/2017
#Sandbox         aws.sandbox@postcodelottery.co.uk       744770992125    Created on 6/7/2017
#ppl-sw-dv       aws.sw.dv@postcodelottery.co.uk         854680800964    Created on 6/9/2017


setopt EXTENDED_HISTORY
setopt correct

zstyle -e ':completion::*:*:*:hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'


export NVM_DIR="/home/pluk.eeghlan.net/graham.clark/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source /home/pluk.eeghlan.net/graham.clark/anaconda3/bin/aws_zsh_completer.sh
# added by Anaconda3 installer
export PATH="/home/pluk.eeghlan.net/graham.clark/anaconda3/bin:$PATH"
export ANSIBLE_VAULT_PASSWORD_FILE=$HOME/.av

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
