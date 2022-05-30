##
# Dotfiles Application
#
# @file
# @version 0.1

arch:
	sudo pacman -S --noconfirm python-pip
	python3 -m pip install --user pipx
	python3 -m pipx ensurepath
	$(HOME)/.local/bin/pipx install pyinfra

	mkdir $(HOME)/.config

	ln -s doom $(HOME)/.config/doom
	ln -s zshrc $(HOME)/.zshrc
	ln -s starship.toml $(HOME)/.config/starship.toml
	mkdir $(HOME)/.config/stumpwm
	ln -s stump_config.lisp $(HOME)/.config/stumpwm/config


	zsh git clone --depth 1 https://github.com/doomemacs/doomemacs $(HOME)/.config/emacs
	$(HOME)/.config/emacs/bin/doom install

	curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | zsh
	source .zshrc

	zsh pyinfra @local deploys/arch.py
	chsh -s /bin/zsh


fedora:
	sudo dnf install -y python-pip
	python3 -m pip install --user pipx
	python3 -m pipx ensurepath
	pipx install pyinfra

	ln -s doom $HOME/.config/doom
	ln -s zshrc $HOME/.zshrc
	ln -s starship.toml $HOME/.config/starship.toml
	mkdir $HOME/.config/stumpwm
	ln -s stump_config.lisp $HOME/.config/stumpwm/config

	pyinfra @local deploys/fedora.py

# end
