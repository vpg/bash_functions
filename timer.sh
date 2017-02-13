#!/bin/bash

# Start a new timer
function vpgStartTimer {
    START_TIMER=$(date +%s)
}

# Returns durations in seconds since timer started
#
# Usage : vpgStartTimer when you want
#         DURATION=$(vpgEndTimer) to stop the timer and get the results in seconds
#
# @return integer
function vpgEndTimer {
    END_TIMER=$(date +%s)
    DIFF=$(( $END_TIMER - $START_TIMER ))
    echo "$DIFF"
}