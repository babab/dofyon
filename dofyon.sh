# dofyon
# Bash functions for printing DONE or FAILED and YES or NO  messages

# Copyright (c) 2013 Benjamin Althues <benjamin@babab.nl>
#
# Permission to use, copy, modify, and distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

# Settings ###################################################################
DY_LINECHAR="-"
DY_PADDING_RIGHT=8

# Color codes ################################################################
dy_color_red='\033[0;31m'    # red
dy_color_green='\033[0;32m'  # green

# Functions ############################################################
dy-title ()
{
    # Echo out a string which appends `DY_LINECHAR` up to a fixed number,
    # which is the width of the terminal minus `DY_PADDING_RIGHT`.
    message="$*"
    nchars=$(echo $message | wc -c)
    let "wchars=$(tput cols)-$DY_PADDING_RIGHT-$nchars"

    echo -n "$message"
    echo -n " "
    i=0
    while [ "$i" -lt "$wchars" ]; do
        echo -n "$DY_LINECHAR"
        let "i=$i+1"
    done
    echo -n " "
}
dy-echo ()
{
    # Echo out a colored string
    color=$1
    message=$2

    echo -en "$color"
    echo "$message"
    tput sgr0
    return
}
dy-status ()
{
    case $1 in
        # DONE or FAILED
        "d" | "DONE")
            dy-echo $dy_color_green DONE
            ;;
        "f" | "FAILED")
            dy-echo $dy_color_red FAILED
            ;;
        "dof?")
            if [ $? == 0 ]; then
                dy-echo $dy_color_green DONE
            else
                dy-echo $dy_color_red FAILED
            fi
            ;;
        # YES or NO
        "y" |"YES")
            dy-echo $dy_color_green YES
            ;;
        "n" |"NO")
            dy-echo $dy_color_red NO
            ;;
        "yon?")
            if [ $? == 0 ]; then
                dy-echo $dy_color_green YES
            else
                dy-echo $dy_color_red NO
            fi
            ;;
        # CUSTOM
        *)
            echo "$1"
    esac
}
