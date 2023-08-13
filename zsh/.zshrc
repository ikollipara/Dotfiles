source "$HOME/.config/zsh/env.zsh"
source "$HOME/.config/zsh/aliases.zsh"


bindkey -e

eval "$(starship init zsh)"

source "$XDG_CONFIG_HOME/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "/home/ian/.local/share/rye/env"
source "$NVM_DIR/nvm.sh"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
# [[ -s "$HOME/.local/share/sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.local/share/sdkman/bin/sdkman-init.sh"

# Turso
export PATH="/home/ian/.turso:$PATH"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f "/home/ian/.local/share/ghcup/env" ] && source "/home/ian/.local/share/ghcup/env" # ghcup-env
export PATH=$PATH:/home/ian/.spicetify
