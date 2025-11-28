function up
    echo -e "\e[32m################# System packages #################\e[0m"
    apt list --upgradable
    echo -e "\e[32m################# Flatpak packages #################\e[0m"
    flatpak remote-ls --updates

    bash -c 'read -p $\'\\e[33m\################# Press any key to continue #################\\e[0m\''

    echo -e "\e[32m################# Updating system #################\e[0m"
    echo ""
    sudo apt upgrade -y
    echo ""
    echo -e "\e[32m################# Updating flatpak #################\e[0m"
    echo ""
    flatpak update -y
    echo ""
    echo -e "\e[32m################# Updating spice #################\e[0m"
    echo ""
    echo -e "\e[32m################# Cleaning #################\e[0m"
    aptcl
end
