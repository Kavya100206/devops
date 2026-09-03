#!/bin/bash

read -p "Enter your name: " name

date=$(date)
host=$(hostname)
user=$(whoami)

echo "Hello $name"
echo "Date: $date"
echo "Hostname: $host"
echo "Username: $user"

echo "Disk Usage:"
df -h

echo "Running Processes:"
ps

mkdir system_info
touch system_info/processes.txt
ps > system_info/processes.txt