#!/usr/bin/env bash

set -e

ln --symbolic --force --no-dereference $(pwd)/.config/i3 ${HOME}/.config/
ln --symbolic --force --no-dereference $(pwd)/.config/i3status ${HOME}/.config/
ln --symbolic --force --no-dereference $(pwd)/.config/nvim ${HOME}/.config/
ln --symbolic --force --no-dereference $(pwd)/.config/wallpapers ${HOME}/.config/
ln --symbolic --force --no-dereference $(pwd)/.config/compton.conf ${HOME}/.config/
ln --symbolic --force --no-dereference $(pwd)/.vimrc ${HOME}/.vimrc
ln --symbolic --force --no-dereference $(pwd)/.tmux.conf ${HOME}/.tmux.conf
ln --symbolic --force --no-dereference $(pwd)/.XResources ${HOME}/
