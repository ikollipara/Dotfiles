export EDITOR="nvim"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export SDKMAN_DIR="$XDG_DATA_HOME/sdkman"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export NVM_DIR="$XDG_CONFIG_HOME/nvm"
export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
export DENO_INSTALL="$XDG_DATA_HOME/deno"
export CABAL_CONFIG="$XDG_CONFIG_HOME/cabal/config"
export CABAL_DIR="$XDG_DATA_HOME/cabal/"
export GHCUP_USE_XDG_DIRS=true
export GOPATH="$XDG_DATA_HOME/go"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
export DOTNET_ROOT=$HOME/.local/share/dotnet
export RYE_HOME="$HOME/.local/share/rye"
export PATH="$PATH:/home/ikollipara/.local/share/coursier/bin:$HOME/Documents/Scripts:$PYENV_ROOT/bin:$HOME/.local/bin:$HOME/.local/share/npm/bin:$HOME/go/bin:$DENO_INSTALL/bin:$DOTNET_ROOT:$DOTNET_ROOT/tools:$HOME/.config/tmux/plugins/t-smart-tmux-session-manager/bin:$PATH"
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
export STACK_XDG=1
export STACK_ROOT="$XDG_DATA_HOME"/stack                                                                          
export ZK_NOTEBOOK_DIR="$HOME/Documents/Docs/"
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
