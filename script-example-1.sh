#!/bin/bash
source dofyon.sh

dy-title Testing 123
sleep 1
dy-status DONE

dy-title Checking hostname: $(hostname)
dy-status d

dy-title Testing existence of "'doesnotexist' exec"
which doesnotexist >/dev/null 2>&1
dy-status dof?

dy-title Testing a custom state
dy-status CUSTOM

dy-title Testing a custom state with a custom color
dy-echo '\033[0;35m' YELLOW

DY_LINECHAR=":"
dy-title "Changing linechar to '='"
sleep 2
dy-status FAILED

DY_LINECHAR="."
dy-title "Changing linechar to '.'"
dy-status DONE

dy-title Is there a yes/no option
dy-status y

dy-title Can you also show the no option
dy-status n

dy-title "Ok so I ask again, does 'doesnotexist' exist?"
which doesnotexist >/dev/null 2>&1
dy-status yon?
