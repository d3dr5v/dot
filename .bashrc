#!/bin/bash

export BASH_SILENCE_DEPRECATION_WARNING=1

if [[ $- == *i* ]]; then
    echo "Interactive shell"

    if env | grep -q "NIX"; then
        echo "You are in a Nix shell."
    else
        echo "You are not in a Nix shell."
        /nix/var/nix/profiles/default/bin/nix develop ~/@/nix
    fi
fi

