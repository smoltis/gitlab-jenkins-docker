#!/usr/bin/env bash
read -p "Jenkins username: " JUSR
read -r -s -p "Jenkins password: " JPWD
echo "Enter 'help' for list of commands."
while true; do
    read -p "command# " JCMD
    if [[ "$JCMD" =~ ^(quit|exit|stop)$ ]]; then
        echo "See you later!"
        break
    fi
    java -jar jenkins-cli.jar -s http://localhost:8880/ -webSocket  -auth $JUSR:$JPWD $JCMD
done