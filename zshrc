# oh-my-zsh stuff
export ZSH=/Users/kamil/.oh-my-zsh

ZSH_THEME="apple"

plugins=(git brew zsh zsh-syntax-highlighting osx npm tmuxinator)

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/kamil/Library/Android/sdk/platform-tools:/Users/kamil/dev/tools


source $HOME/dotfiles/zsh/aliases
source $HOME/dotfiles/zsh/functions
source $ZSH/oh-my-zsh.sh

# want your terminal to support 256 color schemes? I do ...
export TERM="screen-256color"
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

export VISUAL=vim
export EDITOR="$VISUAL"
export NVM_DIR="/Users/kamil/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
#auto_set_profile_based_on_time
