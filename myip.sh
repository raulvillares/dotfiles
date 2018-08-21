#!/bin/bash
private_ip=$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')
echo "My private IP address is: $private_ip"
public_ip=$(curl -s https://api.ipify.org)
echo "My public  IP address is: $public_ip"
