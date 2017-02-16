#!/bin/bash

##
# Functions to manage operations on files
#
# @author  Cédric Jimenez <cjimenez@voyageprive.com>
# @license VPG Proprietary
 

##
# Returns an image name from a file (md5 + size)
#
# @param  string Image name
#
# @return string New file name according to md5 and size with directory
# @exit   1: File does not exist
#
function vpgGetLongImageNameFromFile {
    local fileName=$1

    if [ ! -f "$fileName" ]; then
        vpgError "Error in vpgGetImageNameFromFile : File $fileName does not exists"
        exit 1;
    fi

    local md5File=$($md5Command "$fileName" | cut -d' ' -f1)_$(stat -c'%s' "$fileName").$(echo ${fileName##*.} | tr '[:upper:]' '[:lower:]')
    echo $md5File
}

##
# Returns the symlink pointing to the file passed in parameter
#
# @param string fileNameWithoutPath File name without path
# @param string symlinksDirectory   Path of the directory containing the symlinks
#
# @returns string Name of the symlink with path
# @exit    1: Symlink directory does not exist
#
function vpgGetSymlinkFromFile {
    local fileNameWithoutPath=$1
    local symlinksDirectory=$2

    if [ ! -d "$symlinksDirectory" ]; then
        vpgError "Error in vpgGetSymlinkFromFile : Directory $symlinksDirectory does not exist"
        exit 1;
    fi

    local symlinkName=$(find $symlinksDirectory -lname "$fileNameWithoutPath")
    echo $symlinkName
}
