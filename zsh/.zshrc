source "$HOME/.config/zsh/env.zsh"
source "$HOME/.config/zsh/aliases.zsh"

eval "$(starship init zsh)"

source "$XDG_CONFIG_HOME/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
# source "/home/ian/.local/share/rye/env"
# source "$NVM_DIR/nvm.sh"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
# [[ -s "$HOME/.local/share/sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.local/share/sdkman/bin/sdkman-init.sh"

# [ -f "/home/ikollipara/.ghcup/env" ] && source "/home/ikollipara/.ghcup/env" # ghcup-env

# Turso
export PATH="/home/ian/.turso:$PATH"
