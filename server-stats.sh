#!/bin/bash

###
# Return the CPU usage
###

top -n1 | grep "%Cpu(s)" | awk '{print "CPU usage: ", 100 - $8, "%"}'

###
# Return memory usage
###

top -n1 | grep "MiB Mem" | awk '{print "Free memory:", ($6 / $4) * 100, "%", "|", "Used memory:", ($8 / $4) * 100, "%"}'

###
# Return Disk usage
###

df -h / | grep "/dev/sdd" | awk '{print "Free disk space:", ($4 / $2) * 100, "%", "|", "Used disk space:", ($3 / $2) * 100, "%" }'

###
# Return top 5 processes
###

echo "top 5 processes by memory utilisation:"
top -bn1 -o %MEM | sed -n '8,12p' | awk '{print $12}'

echo "top 5 processes by CPU utilisation:"
top -bn1 -o %CPU | sed -n '8,12p' | awk '{print $12}'
