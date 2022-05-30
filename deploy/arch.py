"""
deploys/arch.py
Ian Kollipara
2022.05.30

Arch PyInfra Configuration
"""

from pyinfra.operations import pacman, git, files, server

# Initial Packages
# These packages must exist already for anything after to work
pacman.packages([
    "emacs",
    "fd",
    "ripgrep",
    "git"
], _sudo=True)

# Creating File Structure
server.shell("mkdir Documents Downloads Pictures")

# Setting up Doom Emacs
# I use Doom Emacs for my default Editor, so
# getting Doom Setup is vital for my editing experience
server.shell("git clone --depth 1 https://github.com/doomemacs/doomemacs .config/emacs && .config/emacs/bin/doom install")

# Installing and Setting up Aura
# Aura is a AUR Helper written in Haskell
# Arch has awful Haskell support, so Aura must be
# built locally against GHCup's Static Haskell Libraries

server.shell("curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh")
server.shell("source .zshrc")
git.repo("https://github.com/fosskers/aura.git", "Downloads/aura")
server.shell("stack install -- Downloads/aura")

# Installing Roswell
# Roswell is a CL Environment Manager, and an important tool
# Roswell is only available in the AUR for Arch

server.shell("sudo aura -A roswell")
