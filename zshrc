# oh-my-zsh stuff
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="simple"

plugins=(
	git
	brew
	osx
	npm
	fzf
	gitfast
	mix
)

export PATH=/usr/local/sbin:/usr/local/opt/flex/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/kamil/dev/libs

export BUILD_XML=~/dev/projects/ant/sf-ant/build.xml
export BUILD_PROP_DIR=~/dev/projects/salesforce/.settings
export ANT_SF_HOME=/Users/kamil/dev/libs/ant-salesforce.jar
export LC_ALL=en_US.UTF-8

fpath=($fpath)

source $HOME/dotfiles/zsh/aliases.zsh
source $HOME/dotfiles/zsh/functions.zsh
source $HOME/dotfiles/zsh/fzf_config.zsh
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
autoload -U compinit && compinit

# if you do a 'rm *', Zsh will give you a sanity check!
setopt RM_STAR_WAIT

# allows you to type Bash style comments on your command line
# good 'ol Bash
setopt interactivecomments

# Zsh has a spelling corrector
setopt CORRECT

set -o ignoreeof

export VISUAL=vim
export EDITOR="$VISUAL"
export NVM_DIR="/Users/kamil/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
#auto_set_profile_based_on_time

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
