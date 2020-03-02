# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export PATH=/opt/openshift:/Users/hcl/.local/lib/aws/bin:$PATH
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"
#PS1="\[\033[32m\]\t \u@\h\[\033[00m\]:\[$txtblu\]\[\033[01;34m\]\w\[\033[00m\]\[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
PS1="\[\033[31m\]\A \u@\h\[\033[00m\]:\[$txtblu\]\w\[\033[00m\]\[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

#enable color support of ls and also add handy aliases
#if [ -x /usr/bin/dircolors ]; then
    #test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    #alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

#fi
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias 7zr="docker run --rm -v $PWD:/data msamano/7zip 7zr"

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000

export CLICOLOR=1
# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
#source <(kubectl completion bash)
#alias kubeauth="kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep admin-user | awk '{print $1}') | grep token: | sed -e \"s/token:\ \ \ \ \ \ //\" | pbcopy"
