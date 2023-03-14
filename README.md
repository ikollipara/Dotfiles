# Dotfiles

## Introduction
This collection of dotfiles represents much of my default linux experience.
I've moved from Emacs to Neovim for more ergonomic vim usage, I've switched away from vscode
for better window movement. 
I've added tmux for workspace management and better pane switching.

## Neovim
My neovim config is drawn from folke's LazyVim.
I make heavy use of lazy.nvim for lazy-loading packages.
Although my load times are round 35ms compared to 11ish.

I have my environment configured for python, typescript, scala, html, css, and php.
These are my main languages that I am using for development.
However, I do plan to add haskell configuration for it in the future.

There are a few packages that make working with tmux easier in neovim, but most of it
is already handled in the tmux configuration.
