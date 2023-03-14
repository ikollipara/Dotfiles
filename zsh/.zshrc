source "$HOME/.config/zsh/env.zsh"
source "$HOME/.config/zsh/aliases.zsh"

eval "$(starship init zsh)"
eval "$(pyenv init -)"

source "$XDG_CONFIG_HOME/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$NVM_DIR/nvm.sh"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
[[ -s "$HOME/.local/share/sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.local/share/sdkman/bin/sdkman-init.sh"

# Created by `pipx` on 2023-03-13 19:02:48
export PATH="$PATH:/home/ikollipara/.local/bin"
