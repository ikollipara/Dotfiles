alias h="cd"
alias cls="clear"
alias b="cd .."
bindkey -v
alias ls="exa"
alias doom="$HOME/.config/emacs/bin/doom"
if [[ $(uname -n) -eq "fedora" ]] then
   source "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
else
    source "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi
eval "$(starship init zsh)"
