platform=`uname`
if [[ $platform == 'Linux' ]]; then
    alias l='ls -lrth --color'
    alias go='gnome-open' 
elif [[ $platform == 'Darwin' ]]; then
    alias l='ls -lrthG'
fi

alias cd..='cd ..'
alias rc='. ~/.zshrc'
alias v='vim'
alias b='vim'
alias vi='vim'
alias v.='vim .'
alias gs='git status'
alias ga='git add'
alias gd='git diff'
alias cdev='cd ~/dev'
alias tma='tmux attach -t'
alias tn='tmux new -s'

xslt() {
	saxon $1 -s:$2 | xmllint --format - > $3
}
