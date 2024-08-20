#!/bin/bash
mkdir -p /home/lemon/HNURE/laba1/logs

current_date=$(date)
echo "DATE: $current_date"

users=$(cat /etc/passwd)
echo "List of users:"
echo "$users"

uptime_info=$(uptime)
echo "Uptime system: $uptime_info"

output_file="/home/lemon/HNURE/laba1/logs/system_info.log"
{
    echo "DATE: $current_date"
    echo "List of users:"
    echo "$users"
    echo "Uptime system: $uptime_info"
} > "$output_file"

echo "info saved in $output_file"