#!/bin/bash


COLOR_NC='\033[0m' # No Color
COLOR_RED='\033[0;31m'
COLOR_BLACK='\033[0;30m'
COLOR_GREEN='\033[0;32m'
COLOR_YELLOW='\033[0;33m'
COLOR_BLUE='\033[0;34m'
COLOR_PURPLE='\033[0;35m'
COLOR_CYAN='\033[0;36m'
COLOR_WHITE='\033[0;37m'


# Write an error message
#
# @param string $1 Message to write
function vpgError {
    vpgLog 'ERROR' "$1"
}

# Write an info message
#
# @param string $1 Message to write
function vpgInfo {
    vpgLog 'INFO' "$1"
}

# Write a warning message
#
# @param string $1 Message to write
function vpgWarning {
    vpgLog 'WARNING' "$1"
}

# This function write beautiful logs in stdout
#
# @param string $1 Type of log : error, info
# @param string $2 Message to write
function vpgLog {

    local messageType=$1
    local message=$2

    # COLOUR according to log type
    local colour=$COLOR_NC
    case "$1" in
            ERROR)
                colour=$COLOR_RED
                ;;
            INFO)
                colour=$COLOR_GREEN
                ;;
            WARNING)
                colour=$COLOR_YELLOW
                ;;
    esac

    echo -e `date +"%Y-%m-%d:%k:%M:%S"` "${colour}${messageType}${COLOR_NC} ${message}"
    #
}
