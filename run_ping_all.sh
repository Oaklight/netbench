#!/bin/bash

# Path to the hosts file
HOSTS_FILE="./hosts"

# Check if the hosts file exists
if [ ! -f "$HOSTS_FILE" ]; then
    echo "Error: Hosts file does not exist at $HOSTS_FILE"
    exit 1
fi

# Function to run ping tests
run_ping() {
    echo "Running ping test for $1"
    ./ping_test.sh "$1"
}

# Read the hosts file and run tests for each hostname
while IFS= read -r line; do
    # Skip empty lines and comments
    if [[ $line =~ ^# ]] || [ -z "$line" ]; then
        continue
    fi

    # Extract the hostname from the line
    hostname=$(echo "$line" | awk '{print $2}')

    # Run ping tests for the hostname
    run_ping "$hostname"
done < "$HOSTS_FILE"

echo "All tests completed."