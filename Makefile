##
# Dotfile Makefile
#
# @file
# @version 0.1

packages = git texlive-scheme-full npm nodejs python3-pip

install: zsh-install brave-install github-desktop-install;

zsh-install: doom-install
	sudo dnf install zsh exa zsh-syntax-highlighting starship chsh
	-sh ~/.config/emacs/bin/org-tangle -p $(dot-dir)/Zsh.org > ~/.zshrc
	ln -s $(dot-dir)/starship.toml ~/.config/starship.toml
	chsh -s /usr/bin/zsh
	@echo Reboot machine

doom-install: fedora-setup
	sudo dnf install fd-find ripgrep emacs cmake libvterm
	git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
	ln -s $(dot-dir)/doom ~/.config/doom
	~/.config/emacs/bin/doom install

fedora-setup: rpmfusion-setup
	curl --output-dir ~/Downloads -o "Fira Code Retina Nerd Font Complete.ttf" \
		https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode/Retina/complete/Fira%20Code%20Retina%20Nerd%20Font%20Complete.ttf

	sudo mkdir /usr/share/fonts/fira-code
	sudo mv "~/Downloads/Fira Code Fetina Nerd Font Complete.ttf" /usr/share/fonts/fira-code/FiraCode-Retina-NerdFont.ttf
	fc-cache -f
	sudo dnf install $(packages)

	flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
	flatpak install flathub org.zotero.Zotero
	flatpak install flathub md.obsidian.Obsidian
	flatpak install flathub org.onlyoffice.desktopeditors
	flatpak install flathub com.spotify.Client

	curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -

	sudo dnf install java-latest-openjdk java-latest-openjdk-devel
	curl -O https://download.clojure.org/install/linux-install-1.11.1.1113.sh
	chmod +x linux-install-1.11.1.1113.sh
	sudo ./linux-install-1.11.1.1113.sh

	curl --output-dir ~/.local/bin -O https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
	chmod a+x ~/.local/bin/lein
	lein

	curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

rpmfusion-setup:
	sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

brave-install:
	sudo dnf install -y dnf-plugins-core
	sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
	sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
	sudo dnf install -y brave-browser

github-desktop-install:
	sudo rpm --import https://mirror.mwt.me/ghd/gpgkey
	sudo sh -c 'echo -e "[shiftkey]\nname=GitHub Desktop\nbaseurl=https://mirror.mwt.me/ghd/rpm\nenabled=1\ngpgcheck=0\nrepo_gpgcheck=1\ngpgkey=https://mirror.mwt.me/ghd/gpgkey" > /etc/yum.repos.d/shiftkey-desktop.repo'
	sudo dnf install github-desktop

# end
