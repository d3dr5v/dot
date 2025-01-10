#!/bin/bash

export BASH_SILENCE_DEPRECATION_WARNING=1

if [[ $- == *i* ]]; then
    echo "Interactive shell"

    /nix/var/nix/profiles/default/bin/nix-shell --run zsh /Users/.david/nix/default.nix
fi


