#!/bin/bash

# Make a failed command and unset variables stop this script
# Also disable filename expansions and fail on subcommands error in a pipe
set -euf -o pipefail

BASHRC='.bashrc'
if [[ $(uname -s) == 'Darwin ' ]]; then
  BASHRC='.bash_profile'
fi

echo "Linking user_bashrc..."
ln -sf $PWD/user_bashrc ~/.user_bashrc

echo "Linking inputrc..."
ln -sf $PWD/inputrc ~/.inputrc

echo "Sourcing user_bashrc in bashrc..."
if [[ ! -f ~/${BASHRC} || -z $(grep 'source ~/.user_bashrc' ~/${BASHRC}) ]]; then
  echo -e "\nsource ~/.user_bashrc" >> ~/${BASHRC}
  echo "Added sourcing to bashrc"
else
  echo "Sourcing already active"
fi
