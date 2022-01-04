# oh-my-zsh stuff
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="simple"

plugins=(
	brew
	docker
	fzf
	git-auto-fetch
	gitfast
	mix
	nvm
	npm
	macos
	wd
)

export PATH=/usr/local/opt/node@14/bin:/usr/local/sbin:/usr/local/opt/flex/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/kamil/dev/libs:/Users/kamil/.dotnet/tools

export BUILD_XML=~/dev/projects/ant/sf-ant/build.xml
export BUILD_PROP_DIR=~/dev/projects/salesforce/.settings
export ANT_SF_HOME=/Users/kamil/dev/libs/ant-salesforce.jar
export LC_ALL=en_US.UTF-8
export FUNCTIONS_CORE_TOOLS_TELEMETRY_OPTOUT=1

fpath=($fpath)

source $HOME/dotfiles/zsh/aliases.zsh
source $HOME/dotfiles/zsh/functions.zsh
source $HOME/dotfiles/zsh/fzf_config.zsh
source $HOME/dotfiles/zsh/variables.zsh
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
autoload bashcompinit && bashcompinit
source /usr/local/etc/bash_completion.d/az

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
                
#auto_set_profile_based_on_time
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

SFDX_AC_ZSH_SETUP_PATH=/Users/kamil/Library/Caches/sfdx/autocomplete/zsh_setup && test -f $SFDX_AC_ZSH_SETUP_PATH && source $SFDX_AC_ZSH_SETUP_PATH; # sfdx autocomplete setup
