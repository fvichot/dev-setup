#!/bin/bash

# Make a failed command and unset variables stop this script
# Also disable filename expansions and fail on subcommands error in a pipe
set -euf -o pipefail

ln -sf $PWD/user_bashrc ~/.user_bashrc
ln -sf $PWD/inputrc ~/.inputrc
if [[ ! -f ~/.bashrc || -z $(grep user_bashrc ~/.bashrc) ]]; then
  echo -e "\nsource ~/.user_bashrc" >> ~/.bashrc
  echo "Added sourcing to bashrc"
else
  echo "Sourcing already active"
fi
