# ffuszthaler's .bashrc

# Change directory without typing cd
shopt -s autocd

# Infinite history
HISTSIZE= HISTSIZEFILE=

# Aliases
alias v="vim"
alias sv="sudo vim"
alias r="ranger"
alias sr="sudo ranger"

# Bash prompt
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

