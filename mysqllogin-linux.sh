#!/bin/bash

# This is a script to programmatically fetch the IP address of the active interface for your device (Ethernet/Wireless), plug it into the command to connect to the mysql instance hosted there, and login.  Author: Coty McKinney

# get the IP address of the Ethernet or Wi-Fi network adapter
eth_ip_address=$(ip addr show dev eth0 | grep 'inet ' | awk '{print $2}' | cut -d '/' -f 1)
wifi_ip_address=$(ip addr show dev wlan0 | grep 'inet ' | awk '{print $2}' | cut -d '/' -f 1)

if [[ $eth_ip_address != 169.254.* ]]; then
  ip_address=$eth_ip_address
else
  ip_address=$wifi_ip_address
fi

# connect to MySQL using the IP address of the Ethernet or Wi-Fi network adapter
/usr/bin/mysql -h $ip_address -u admin -p

