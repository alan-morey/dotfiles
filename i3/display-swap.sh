#!/usr/bin/env bash
# 
# Script to quickly swap workspaces among 2 monitors
#

_swap_workspaces() {
    while IFS=: read -r name current_workspace; do
        _move_to_right "$name" "$current_workspace"
    done
}

_move_to_right() {
    local name="$1"
    local current_workspace="$2"

    echo "moving workspace $current_workspace on output $name to right..."
    i3-msg workspace "$current_workspace"
    i3-msg move workspace to output right
}

_get_outputs() {
    i3-msg -t get_outputs \
        | jq -r '.[] | select(.active) | "\(.name):\(.current_workspace)"'
}

_get_outputs | _swap_workspaces
