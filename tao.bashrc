# -*- shell-script -*- 

_custom_usr="${HOME}/.tao"

# ------------------------------------------------------------------------------
# Exports
# ------------------------------------------------------------------------------

## Editors
export EDITOR="emacs --no-window-system"

## Language
export LC_ALL=en_US.utf8
export LANG=en_US.utf8

## History                                                                                                          
export HISTIGNORE="&:ls:cd:[bf]g:rm *:rm -rf *:rm -f *:exit"

## PS1
# Git
GIT_PS1_SHOWDIRTYSTATE='y'
GIT_PS1_SHOWSTASHSTATE='y'
GIT_PS1_SHOWUNTRACKEDFILES='y'
GIT_PS1_DESCRIBE_STYLE='contains'
GIT_PS1_SHOWUPSTREAM='auto'

PS1='\[\033[01;34m\][\[\033[01;35m\]\u@\h\[\033[01;34m\] \W]$(__git_ps1 "\[\033[01;34m\][\[\033[01;33m\]%s\[\033[01;34m\]]")[\[\033[01;31m\]\j\[\033[01;34m\]]\$\[\033[00m\] '

## PATH
export PATH="${HOME}/bin:${_custom_usr}/bin:${PATH}"

# ------------------------------------------------------------------------------
# Aliases
# ------------------------------------------------------------------------------

# Git
alias gst='git status'
alias gbr='git checkout -b'
alias gdi='git diff'
alias gp="git stash; git pull; git pop"

# bashrc
alias vibashrc="emacs ${_custom_usr}/tao.bashrc && . ${HOME}/.bashrc"

# Better defaults
alias emacs='emacs --no-window-system'
alias rm='rm -i'
alias grep='grep --color'
alias ls='ls --color=auto'
alias dmesg='dmesg --human --nopager'

# Utils
alias trash='\rm -vf *~; true'

mkcd() {
  mkdir -p "$1" && cd "$1"
}
