#!/bin/bash

display_menu() {
    echo "Select a language:"
    echo "1) English"
    echo "2) Hindi (हिन्दी)"
    echo "3) Portuguese (Português)"
    echo "4) Exit"
    read -p "Enter your choice: " choice
}

apply_customization() {
    local lang_message=$1
    local exit_message=$2

    pkg install figlet nano -y

    echo "$lang_message"
    read name
    figlet "$name" > ~/.banner

    echo "PS1='\e[1;32m\u@\h:\e[1;34m\w\$\e[0m '" >> ~/.bashrc
    echo "cat ~/.banner" >> ~/.bashrc
    echo "alias exit='echo $exit_message'" >> ~/.bashrc

    source ~/.bashrc

    echo "Customization complete! Restart Termux to see the changes."
}

display_menu

case $choice in
    1) apply_customization "Enter a name to customize the terminal:" "Exit blocked!" ;;
    2) apply_customization "टर्मिनल को अनुकूलित करने के लिए एक नाम दर्ज करें:" "बाहर निकलना अवरुद्ध!" ;;
    3) apply_customization "Digite um nome para personalizar o terminal:" "Saída bloqueada!" ;;
    4) echo "Exiting..."; exit ;;
    *) echo "Invalid choice! Please run the script again." ;;
esac
