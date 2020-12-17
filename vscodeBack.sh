#!/bin/bash
# This is a simple code for create local backup from vsCode extention

bold=$(tput bold)
normal=$(tput sgr0)
curent_dir=$(pwd)


if test -z $1
then
    echo "bash vscodeBack.sh [-b/-r] [backup direction]"
    echo "This script for creaate backup from code's extention"
    echo "-b --backup       for create a backup"
    echo "-r --restore      for restore your backup"    
    echo "$bold Backup"    
    echo "$normal  bash vscodeBack.sh -b [backup direction]"    
    echo "  bash vscodeBack.sh --backup [backup direction]" 
    echo "$bold Restore"    
    echo "$normal  bash vscodeBack.sh -r [backup direction]"    
    echo "  bash vscodeBack.sh --restore [backup direction]"   
else
    if [ $1 == '-b' ] || [ $1 == '--backup' ];
    then 
        if test -z $2
        then
 	         cd $HOME && env  tar cvzf $curent_dir/vsCodeBack.tar.gz .vscode/ && cd -
        else
      		 cd $HOME  && env GZIP=-9 tar cvzf $2/vsCodeBack.tar.gz .vscode/ && cd -
        fi
    elif [ $1 == '-r' ] || [ $1 == '--restore' ];
    then
        if test -z $2
        then
       		 tar -xf ./vsCodeBack.tar.gz -C $HOME
        else
       		 tar -xf $2 -C $HOME
        fi
    else
        echo "bash vscodeBack.sh [-b/-r] [backup direction]"
        echo "This script for creaate backup from code's extention"
        echo "-b --backup       for create a backup"
        echo "-r --restore      for restore your backup"    
        echo "$bold Backup"    
        echo "$normal  bash vscodeBack.sh -b [backup direction]"    
        echo "  bash vscodeBack.sh --backup [backup direction]"
        echo "$bold Restore"    
        echo "$normal bash vscodeBack.sh -r [backup direction]"    
        echo "  bash vscodeBack.sh --restore [backup direction]"    
    fi
fi
