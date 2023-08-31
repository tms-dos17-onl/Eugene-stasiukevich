#!/usr/bin/bash
# This script monitors CPU and memory usage


  # Get the current usage of CPU and memory
  cpuUsage=$(top -bn1 | awk '/Cpu/ { print $2}')
  memUsage=$(free -m | awk '/Mem/{print $3}')
  IP=$(ip -4 address | grep /24 )

  # Print the usage
  echo "загруженность: $cpuUsage%"
  echo "память: $memUsage MB"
  echo "мой IP - $IP"


