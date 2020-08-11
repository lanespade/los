# Custom Prompt
autoload -U promptinit; promptinit
prompt spaceship

# Auto Suggestions
source <(curl -sSL https://raw.githubusercontent.com/zsh-users/zsh-autosuggestions/master/zsh-autosuggestions.zsh)

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# FZF
FZF_PREVIEW_DEFAULTS='--bind left:preview-page-up,right:preview-page-down --preview-window up:99%'
export FZF_ALT_C_COMMAND="fd --type d . $HOME"
export FZF_ALT_C_OPTS="$FZF_PREVIEW_DEFAULTS --preview 'tree -C {}'"

export FZF_DEFAULT_COMMAND="fd --type f . $HOME"
export FZF_DEFAULT_OPTS="--layout default --info inline"

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--no-height -m $FZF_PREVIEW_DEFAULTS --preview 'bat --color always --style full --line-range 1: {}'"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Interactive Git (via FZF)
source <(curl -sSL https://raw.githubusercontent.com/wfxr/forgit/master/forgit.plugin.zsh)

# Interactive Aliases
# alias ga='interactive git add selector'
# alias gcf='interactive git checkout <file>'
# alias gclean='interactive git clean selector'
# alias gd='interactive git diff viewer'
# alias gi='interactive .gitignore generator'
# alias glo='interactive git log viewer'
# alias grh='interactive git reset HEAD <file>'
# alias gss='interactive git stash viewer'

# Standard Aliases
alias gcm='git checkout master'
alias gco='git checkout'
alias gc='git commit -m'
alias gl='git pull'
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
