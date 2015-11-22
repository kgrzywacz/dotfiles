# oh-my-zsh stuff
export ZSH=/Users/kamil/.oh-my-zsh
ZSH_THEME="agnoster"
plugins=(git zsh-syntax-highlighting)
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
source $ZSH/oh-my-zsh.sh

# want your terminal to support 256 color schemes? I do ...
export TERM="xterm-256color"

# Show contents of directory after cd-ing into it
chpwd() {
  ls -lrthG
}

# Save a ton of history
HISTSIZE=20000
HISTFILE=~/.zsh_history
SAVEHIST=20000

# Enable completion
autoload -U compinit
compinit

# if you do a 'rm *', Zsh will give you a sanity check!
setopt RM_STAR_WAIT

# allows you to type Bash style comments on your command line
# good 'ol Bash
setopt interactivecomments

# Zsh has a spelling corrector
setopt CORRECT

source $HOME/dotfiles/zsh/aliases

export NVM_DIR="/Users/kamil/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
