#!/bin/bash

#
# Library to manage specific actions on commands
#



# Check if this command exists
#
# @param  string   Command name
#
# @return integer  0 if ok, 1 if ko
function vpgCommandExists {
    local commandName=$1

    if hash ${commandName} 2>/dev/null; then
        return 0
    else
        return 1
    fi
}

# Receive multiple commands and returns th first that exists
#
# @multiple_params string command names
#
# @return first command name that exists
function vpgCommand {
    for parameter in "$@"
    do
        if vpgCommandExists "$parameter"; then
            echo "$parameter"
            exit 0
        fi
    done

    exit 1
}
