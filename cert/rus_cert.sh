#!/bin/bash
COMMAND=$1

if [ "$COMMAND" == "install" ]; then
    cp -r /home/webmalc/Projects/dotfiles/cert/russian/ /usr/local/share/ca-certificates/.
    update-ca-certificates
    exit
fi

if [ "$COMMAND" == "remove" ]; then
    echo "remove"
    rm -rf /usr/local/share/ca-certificates/russian/
    update-ca-certificates
    exit
fi

echo "select the comand: install or remove [rus_cert.sh install]"