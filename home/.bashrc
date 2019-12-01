# ffuszthaler's .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '

# My Prompt
PS1='\e[1m\] \033[32m\]\W \033[39m\]\$ \[\e[0m\]'

# Aliases
# alias v='nvim'
alias v='VIMRUNTIME=~/code/neovim/runtime ~/code/neovim/build/bin/nvim'
alias vi='vim'
alias et='emacs -nw'
alias es='emacs --daemon=dev'
alias ecx='emacsclient -c -s dev'
alias ect='emacsclient -t -s dev'
alias tm='tmux'
alias cdc='cd ~/code'
alias r='ranger'
alias gts='git status'
alias nv='nvim'
alias wttr='curl -4 http://wttr.in/noppendorf'
alias moon='curl -4 http://wttr.in/moon'
alias el='exa -l -h --git'
alias nf='neofetch'
alias uf='ufetch'
alias work='cd ~/code/web/giphy_clone'
alias clock='tty-clock -c -s'

# Pywal
# (cat ~/.cache/wal/sequences &)

# FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
