setopt rm_star_wait
setopt interactive_comments
setopt correct
setopt prompt_subst
setopt ignore_eof

autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '%F{red}!'
zstyle ':vcs_info:*' stagedstr '%F{yellow}+'
zstyle ':vcs_info:git:*' formats ' %F{magenta}[%F{green}%b%c%u%f%F{magenta}]'
zstyle ':vcs_info:git:*' actionformats ' %F{magenta}[%F{green}%b%F{red}|%f%a%c%u%f%F{magenta}]'

precmd() {
    vcs_info
    if [[ ! -n ${vcs_info_msg_0_} ]]; then
        PS1="%~%f "
    else
        PS1="%~${vcs_info_msg_0_}%f "
    fi
}

zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        hook_com[unstaged]+='%F{red}*'
    fi
}

chpwd() {
  ls -lrthG
}

export LC_ALL=en_US.UTF-8
export FUNCTIONS_CORE_TOOLS_TELEMETRY_OPTOUT=1
export TERM="screen-256color"
export VISUAL=vim
export EDITOR="$VISUAL"

SECRETS=$HOME/dotfiles/zsh/.secrets.zsh
if [[ -f "$SECRETS" ]]; then
	source $SECRETS
fi

HISTSIZE=20000
HISTFILE=~/.zsh_history
SAVEHIST=20000

autoload -Uz compinit bashcompinit
compinit
bashcompinit

if type brew &>/dev/null ; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source $HOME/dotfiles/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/dotfiles/zsh/aliases.zsh
source $HOME/dotfiles/zsh/functions.zsh
source $HOME/dotfiles/zsh/fzf_config.zsh
