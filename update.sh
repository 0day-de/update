#!/bin/bash

clear
toilet -f future "* Updating / Upgrading *" | lolcat -p 1.0
echo -e "\nChoose an option:\n" | lolcat
echo -e "1. Update the system" | lolcat
echo -e "2. Clear Logs & Commands Histroy\n" | lolcat

read -p "Enter your choice (1/2): " choice

case "$choice" in
  1)
    echo ""
    toilet -f future "* System Updating *" | lolcat -p 1.0
    sudo apt-get autoremove -y
    sudo apt-get update -y
    sudo apt-get autoclean -y
    echo -e "\n|| System Update Complete ||\n" | lolcat
    ;;
  2)
    # Clear system logs & history (may require sudo privileges)
    sudo rm /root/.zsh_history
    sudo rm /home/kali/.zsh_history
    sudo truncate -s 0 /var/log/syslog
    sudo truncate -s 0 /var/log/auth.log
    sudo truncate -s 0 /var/log/kern.log
    echo -e "\nSystem Logs and History Deleted\n" | lolcat
    ;;
  *)
    echo -e "\nInvalid choice. No action taken.\n"
    ;;
esac


read -p "What to do next? Upgrade System (u|U), Reboot (r|R), Shutdown (s|S), None (n|N) : " choice

case "$choice" in
  u|U)
    echo ""
    toilet -f future "* System Upgrading *" | lolcat -p 1.0
    sudo apt-get autoremove -y
    sudo apt-get update -y
    sudo apt-get dist-upgrade -y
    sudo apt-get autoremove -y
    sudo apt-get autoclean -y
    echo -e "\n|| System Upgrade Complete ||\n" | lolcat
    ;;
  r|R)
    sudo reboot
    ;;
  s|S)
    sudo shutdown now
    ;;
  n|N)
    echo -e "No action taken."
    ;;
  *)
    echo "No action taken."
    ;;
esac

