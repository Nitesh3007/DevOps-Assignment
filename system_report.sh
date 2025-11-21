#!/bin/bash

echo "==============================" 
echo "System Report - $(date)" 
echo "------------------------------"

echo "Uptime:"
uptime -p

echo -e "
CPU Usage (%):"
top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8 "%"}'

echo -e "
Memory Usage (%):"
free | awk '/Mem/ {printf("%.2f%%
", $3/$2 * 100)}'

echo -e "
Disk Usage (%):"
df -h / | awk 'NR==2 {print $5}'

echo -e "
Top 3 Processes by CPU:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -4

echo "=============================="
