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
export HISTIGNORE="&:ls:cd:[bf]g:rm *:vrm (.*)*:exit"

## PS1
# Git
GIT_PS1_SHOWDIRTYSTATE='y'
GIT_PS1_SHOWSTASHSTATE='y'
GIT_PS1_SHOWUNTRACKEDFILES='y'
GIT_PS1_DESCRIBE_STYLE='contains'
GIT_PS1_SHOWUPSTREAM='auto'

PS1='$(__git_ps1 "\[\033[01;34m\]┌[\[\033[01;33m\]%s\[\033[01;34m\]]\n└")\[\033[01;34m\][\[\033[01;35m\]\u@\h\[\033[0\
1;34m\] \W][\[\033[01;31m\]\j\[\033[01;34m\]]\$\[\033[00m\] '

## PATH
export PATH="${HOME}/${_custom_usr}/bin:${HOME}/bin:${PATH}"

# ------------------------------------------------------------------------------
# Aliases
# ------------------------------------------------------------------------------

# Git
alias gst='git status'
alias gbr='git checkout -b'
alias gdi='git diff'

# bashrc
alias vibashrc="emacs ${HOME}/${_custom_usr}/bashrc && . ${HOME}/.bashrc"

# Better defaults
alias emacs='emacs -nw'
alias rm='rm -i'
alias grep='grep --color'
alias ls='ls --color=auto'
alias dmesg='dmesg --human --nopager'

# Utils
alias trash='\rm -vf *~; true'

# Lazy
alias f='firefox'
