##
# Dotfiles Application
#
# @file
# @version 0.1

arch:
	sudo pacman -S --no-confirm python-pip
	python3 -m pip install --user pipx
	python3 -m pipx ensurepath
	pipx install pyinfra

	ln -s doom $HOME/.config/doom
	ln -s zshrc $HOME/.zshrc
	ln -s starship.toml $HOME/.config/starship.toml
	mkdir $HOME/.config/stumpwm
	ln -s stump_config.lisp $HOME/.config/stumpwm/config

	pyinfra @local deploys/arch.py
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
