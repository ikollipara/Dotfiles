##
# Dotfiles Application
#
# @file
# @version 0.1

arch:
	zsh
	sudo pacman -S --noconfirm python-pip fd ripgrep cmake libvterm starship zsh-syntax-highlighting

	mkdir $(HOME)/{.config,Downloads,Documents,Pictures}

	ln -s $(HOME)/.dotfiles/doom $(HOME)/.config/doom
	ln -s $(HOME)/.dotfiles/zshrc $(HOME)/.zshrc
	ln -s $(HOME)/.dotfiles/starship.toml $(HOME)/.config/starship.toml
	mkdir $(HOME)/.config/stumpwm
	ln -s $(HOME)/.dotfiles/stump_config.lisp $(HOME)/.config/stumpwm/config


	git clone --depth 1 https://github.com/doomemacs/doomemacs $(HOME)/.config/emacs
	$(HOME)/.config/emacs/bin/doom install

	curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | zsh
	source $(HOME)/.zshrc

	chsh -s /bin/zsh

	git clone https://github.com/fosskers/aura.git $(HOME)/Downloads/aura
	stack install -- $(HOME)/Downloads/aura


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

	pyinfra @local deploy/fedora.py

# end
