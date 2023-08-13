alias h="cd"
alias ls="exa --icons"
alias ll="exa -l --icons -h"
alias b="cd .."
# alias cdg="gum choose $HOME/Projects/CPT $HOME/Projects/UNL $HOME/Projects/Work $HOME/Projects/Personal"
alias np="tmux"
alias lg="lazygit"

cdg ()
{
	cd $(gum choose $HOME/Projects/CPT $HOME/Projects/UNL $HOME/Projects/Work $HOME/Projects/Personal)
}

spice-update ()
{
	sudo chmod a+wr /var/lib/flatpak/app/com.spotify.Client/x86_64/stable/active/files/extra/share/spotify
	sudo chmod a+wr -R /var/lib/flatpak/app/com.spotify.Client/x86_64/stable/active/files/extra/share/spotify/Apps
}
