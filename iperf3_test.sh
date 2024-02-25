#!/bin/bash

# Check if the target IP is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <target_ip>"
    exit 1
fi

target_name=$1
target_ip=$(grep $target_name ./hosts | awk '{print $1}')
target_port=80
my_ip=$(curl ifconfig.co)

num_tests=3
num_parallel=40
log_dir="./logs/iperf3"

mkdir -p "$log_dir"

timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
log_file="$log_dir/${target_name}.${timestamp}.log"

echo "iperf3 test..." >>$log_file
echo "FROM: my_ip = $my_ip" >>$log_file
echo "TO: $target_name = $target_ip" >>$log_file

# Function to run iperf3 test and log the results
run_iperf3() {
    echo "Starting iperf3 test..." | tee -a $log_file
    iperf3 -c $target_ip -p $target_port -P $num_parallel >>$log_file
    echo "" >>$log_file
}

# Initialize variables for average calculation
total_iperf3_sender=0
total_iperf3_receiver=0

for ((i = 1; i <= num_tests; i++)); do
    run_iperf3

    # First, get the last three lines, then extract the SUM line
    iperf3_sender=$(tail -n 5 "$log_file" | grep sender | awk '{print $6}')
    iperf3_receiver=$(tail -n 5 "$log_file" | grep receiver | awk '{print $6}')
    total_iperf3_sender=$(echo "$total_iperf3_sender + $iperf3_sender" | bc)
    total_iperf3_receiver=$(echo "$total_iperf3_receiver + $iperf3_receiver" | bc)

    echo "$i/$num_tests completed."
done

# Calculate average iperf3 throughput
average_iperf3_sender=$(echo "scale=2; $total_iperf3_sender / $num_tests" | bc)
average_iperf3_receiver=$(echo "scale=2; $total_iperf3_receiver / $num_tests" | bc)

# Output results
echo "Average iperf3 [sender] throughput: $average_iperf3_sender Mbits/sec"
echo "Average iperf3 [receiver] throughput: $average_iperf3_receiver Mbits/sec"

# Log results
echo "Average iperf3 [receiver] throughput: $average_iperf3_receiver Mbits/sec" | tee -a "$log_file"
echo "Average iperf3 [sender] throughput: $average_iperf3_sender Mbits/sec" | tee -a "$log_file"

echo "All tests completed. Log saved to $log_file"
