#!/bin/bash

which dofyon.sh >/dev/null 2>&1
test $? -eq 0 || (echo dofyon.sh is not in PATH && exit)

dofyon.sh t Testing 123
sleep 1
dofyon.sh s DONE

dofyon.sh t Checking hostname: $(hostname)
dofyon.sh s d

dofyon.sh t Testing existence of "'doesnotexist' exec"
which doesnotexist >/dev/null 2>&1
dofyon.sh s dof?

dofyon.sh t Testing a custom state
dofyon.sh s CUSTOM

dofyon.sh t Testing a custom state with a custom color
dofyon.sh e '\033[0;35m''YELLOW'

dofyon.sh t Is there a yes/no option
dofyon.sh s y

dofyon.sh t Can you also show the no option
sleep 2
dofyon.sh s n

dofyon.sh t "Ok so I ask again, does 'doesnotexist' exist?"
which doesnotexist >/dev/null 2>&1
dofyon.sh s yon?
