# Pure Prompt
autoload -U promptinit; promptinit
prompt pure

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# FZF
project_or_home_dir() {
	git rev-parse --show-toplevel 2> /dev/null || echo $HOME
}

export FZF_ALT_C_COMMAND='fd --type d . $HOME'
export FZF_DEFAULT_COMMAND="fd --type f . $(project_or_home_dir)"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

function chpwd() {
    export FZF_DEFAULT_COMMAND="fd --type f . $(project_or_home_dir)"
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
}

export FZF_DEFAULT_OPTS='--layout reverse --height 100% --info inline'
export FZF_CTRL_T_OPTS="--multi --bind left:preview-page-up,right:preview-page-down --preview-window down:99% --preview 'bat --color always --style numbers,changes --line-range 1: {}'"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Aliases
alias l='ls -lAh'
alias gst='git status'
alias gl='git pull'
alias gp='git push'
alias gco='git checkout'
alias gcm='git checkout master'
alias ga='git add'
alias grh='git reset HEAD'
alias grbm='git rebase master'
