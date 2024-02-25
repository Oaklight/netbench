#!/bin/bash

# Check if the target IP is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <target_ip>"
    exit 1
fi

target_name=$1
target_ip=$(grep $target_name ./hosts | awk '{print $1}')
my_ip=$(curl ifconfig.co)

num_tests=3
log_dir="./logs/ping"

mkdir -p "$log_dir"

timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
log_file="$log_dir/${target_name}.${timestamp}.log"

echo "ping test..." >>$log_file
echo "FROM: my_ip = $my_ip" >>$log_file
echo "TO: $target_name = $target_ip" >>$log_file

# Function to run ping test and log the results
run_ping() {
    echo "Starting ping test... [$num_pings] times" | tee -a $log_file
    ping -c $num_pings "$target_ip" >>$log_file
    echo "" >>$log_file
}

total_ping=0

numbers=(10 50 100)
for num_pings in "${numbers[@]}"; do
    run_ping

    # Extract the average ping time from the output
    ping_output=$(tail -n 3 $log_file | grep avg | awk '{print $4}' | awk -F'/' '{print $2}')
    total_ping=$(echo "$total_ping + $ping_output" | bc)
    # Convert the average ping time to a floating point number and add to the total

    echo "$num_pings completed."
done

average_ping=$(echo "scale=2; $total_ping / 3" | bc)

echo "Average ping time for pings: $average_ping ms"
echo "Average ping time for pings: $average_ping ms" | tee -a $log_file
