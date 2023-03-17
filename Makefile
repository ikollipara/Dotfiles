#-----------------------------------------------------------------------------
#                            Dotfile Install
#-----------------------------------------------------------------------------
#  	    By | Ian Kollipara
#  	  Date | 2023.03.17
#--------------+--------------------------------------------------------------
#  Description | This makefile defines how to install the software for
#  	       | how I use Fedora Linux. This includes:
#  	       | - Setting Up Neovim and Tmux for development
#  	       | - Installing my perferred web browser (Brave)
#  	       | - Setting up my terminal envrionment with starship and zsh
#  	       | - Adding my used Flatpaks (Spotify and Zotero)
#  	       | This does not handle Dropbox setup or gnome extensions yet.
#  	       | That is still in the works.
#-----------------------------------------------------------------------------

packages = exa fd-find neovim tmux libtree-sitter tree-sitter-cli starship brave-browser util-linux-user zsh lazygit
flatpaks = com.spotify.Client org.zotero.Zotero 

all: configure install

install:
	@echo "--- Installation ---"
	@echo "Installing RPMs... "
	sudo dnf install $(packages)
	@echo "Successfully Installed RPMs"
	@echo "Changing Shell... "
	chsh -s /usr/bin/zsh
	@echo "Successfully Changed Shell"
	@echo "Installing Flatpaks... "
	flatpak install $(flatpaks)
	@echo "Successfully Installed Flatpaks"
	@echo "--- Symlinks ---"
	ln -s $(HOME)/Documents/Dotfiles/tmux $(HOME)/.config/tmux
	@echo "Symlinked Tmux"
	ln -s $(HOME)/Documents/Dotfiles/nvim $(HOME)/.config/nvim
	@echo "Symlinked Neovim"
	ln -s $(HOME)/Documents/Dotfiles/starship $(HOME)/.config/starship.toml
	@echo "Symlinked Starship"
	ln -s $(HOME)/Documents/Dotfiles/zsh $(HOME)/.config/zsh
	@echo "Symlinked Zsh"
	@echo "All Finished!"

configure:
	@echo "--- Configuration ---"
	@echo "1. DNF Updates"
	sudo dnf update -y
	@echo "2. Enabling RPM Fusion"
	sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
	@echo "3. Enabling Starship"
	dnf copr enable atim/starship
	@echo "4. Enabling Neovim Nightly"
	sudo dnf copr enable agriffis/neovim-nightly
	@echo "5. Enabling Lazygit"
	sudo dnf copr enable atim/lazygit -y
	@echo "6. Enabling Flathub"
	flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
	@echo "7. Enabling Brave"
	sudo dnf install dnf-plugins-core
	sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
	sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
	@echo "8. Adding ZDOTDIR to zshenv"
	sudo echo "export $ZDOTDIR=\"$HOME/.config/zsh\" >> /etc/zshenv"
	@echo "9. Making Scripts and Projects Directory"
	mkdir $(HOME)/Documents/Scripts $(HOME)/Documents/Projects
	@echo "Finished Configuration!"
