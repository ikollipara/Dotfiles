
alias h="cd"
alias cls="clear"
alias b="cd .."
bindkey -v
alias ls="exa"
alias doom="$HOME/.config/emacs/bin/doom"
export PATH="$PATH:$HOME/.local/bin:$HOME/.ghcup/env"
source "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
eval "$(starship init zsh)"
