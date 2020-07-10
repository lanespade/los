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
export FZF_ALT_C_OPTS="--preview-window down:99% --preview 'tree -C {}'"

export FZF_DEFAULT_COMMAND="fd --type f . $(project_or_home_dir)"
export FZF_DEFAULT_OPTS="--layout reverse --height 100% --info inline"

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--multi --bind left:preview-page-up,right:preview-page-down --preview-window down:99% --preview 'bat --color always --style numbers,changes --line-range 1: {}'"

function chpwd() {
    # Need to re-run $(project_or_home_dir) upon directory change
    export FZF_DEFAULT_COMMAND="fd --type f . $(project_or_home_dir)"
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
}


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Aliases
alias ga='git add'
alias gcm='git checkout master'
alias gco='git checkout'
alias gd='git diff'
alias gl='git pull'
alias glg='git log'
alias gp='git push'
alias grbm='git rebase master'
alias grh='git reset HEAD'
alias gst='git status'
alias l='ls -lAhG'

# using ripgrep combined with preview
# find-in-file - usage: fif <searchTerm>
fif() {
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  rg --files-with-matches --no-messages "$1" | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}"
}
