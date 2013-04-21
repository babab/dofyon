#!/bin/bash

which dofyon >/dev/null 2>&1
test $? -eq 0 || echo dofyon is not in PATH

dofyon t Testing 123
sleep 1
dofyon s DONE

dofyon t Checking hostname: $(hostname)
dofyon s d

dofyon t Testing existence of "'doesnotexist' exec"
which doesnotexist >/dev/null 2>&1
dofyon s dof?

dofyon t Testing a custom state
dofyon s CUSTOM

dofyon t Testing a custom state with a custom color
dofyon e '\033[0;35m''YELLOW'

dofyon t Is there a yes/no option
dofyon s y

dofyon t Can you also show the no option
sleep 2
dofyon s n

dofyon t "Ok so I ask again, does 'doesnotexist' exist?"
which doesnotexist >/dev/null 2>&1
dofyon s yon?
