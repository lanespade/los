# Custom Prompt
autoload -U promptinit; promptinit
prompt spaceship

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# FZF
export FZF_ALT_C_COMMAND="fd --type d . $HOME"
export FZF_ALT_C_OPTS="--preview-window up:99% --preview 'tree -C {}'"

export FZF_DEFAULT_COMMAND="fd --type f . $HOME"
export FZF_DEFAULT_OPTS="--layout default --height 100% --info inline"

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--multi --bind left:preview-page-up,right:preview-page-down --preview-window up:99% --preview 'bat --color always --style full --line-range 1: {}'"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Interactive Git (via FZF)
source <(curl -sSL git.io/forgit)

# Aliases
alias gcm='git checkout master'
alias gco='git checkout'
alias gc='git commit -m'
alias gd='git diff'
alias gl='git pull'
alias glg='git log'
alias gp='git push'
alias grbm='git rebase master'
alias gst='git status'
alias l='ls -lAhG'

# Ctrl-F (Find in Files)
RG_PREFIX='rg --column --line-number --no-heading --color=always --smart-case '
INITIAL_QUERY=''
FZF_DEFAULT_COMMAND="$RG_PREFIX '$INITIAL_QUERY' $HOME"

__fif() {
    fzf --bind "change:reload:$RG_PREFIX {q} $HOME || true" --ansi --phony --query "$INITIAL_QUERY" | cut -d ':' -f1
}

find-in-files() {
  LBUFFER="${LBUFFER}$(__fif)"
  local ret=$?
  zle reset-prompt
  return $ret
}

zle -N find-in-files
bindkey '^f' find-in-files
