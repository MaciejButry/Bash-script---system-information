#!/bin/sh
show_menu(){
    ### Display menu info and takes input from user

    echo "--------------------------------------"
    echo "- 1) Version Info"
    echo "- 2) UDP Connection Info"
    echo "- 3) CPU Info"
    echo "- 4) Meminfo"
    echo "- 5) Currently-Running Processes"
    echo "--------------------------------------"
    echo "Enter a menu option and press enter or type exit to exit."
    read option # let user type something
}

function option_picked() { # function to store user's input
    BOLD_RED_COLOR='\033[01;31m'
}

clear
show_menu
while [ option != '' ] # check if user typed proper numbers to open information
    do
    if [[ $option = "exit" ]]; then
            exit;
    else
        case $option in # case instruction to let user choose specific information
        1) clear;
            option_picked "Option 1 Picked";
            cd /proc;  
            cat version;
            show_menu;
            ;;

        2) clear;
            option_picked "Option 2 Picked";
            cd /proc/net;
            cat udp;
            show_menu;
            ;;

        3) clear;
            option_picked "Option 3 Picked";
            cd /proc;
            cat cpuinfo;
            show_menu;
            ;;

        4) clear;
            option_picked "Option 4 Picked";
            cd /proc;
            cat meminfo;
            show_menu;
            ;;

        5) clear;
            option_picked "Option 5 Picked";
            ps;
            ps -aux;
            show_menu;
            ;;

        \n)exit;
        ;;

        clear)clear;
        option_picked "Pick an option from the menu";
        show_menu;
        ;;
    esac 
fi
done
