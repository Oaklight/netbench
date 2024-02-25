# Network Performance Testing Scripts
[中文版](./README.md)

This repository contains a set of shell scripts designed for network performance testing using iperf3 and ping. These scripts are useful for measuring bandwidth and latency between a local machine and specified remote hosts.

### Contents

- `run_iperf3_all.sh`: A script to run iperf3 tests on all hosts listed in the hosts file.
- `run_ping_all.sh`: A script to run ping tests on all hosts listed in the hosts file.
- `iperf3_test.sh`: A script to perform iperf3 tests for a single host and log the results.
- `ping_test.sh`: A script to perform ping tests for a single host and log the results.
- `hosts`: A file containing the list of hosts to be tested.
- `./logs`: A directory to store the logs.

### Usage

Before running the scripts, ensure that you have Bash shell installed on your system. The scripts assume that the `iperf3` and `ping` utilities are also installed and accessible in the system's PATH.

1. Place the scripts in a directory and create a `hosts` file with the following format:

   ```
   1.1.1.1 example.machine
   ```

2. Run the scripts using the Bash interpreter:

   ```bash
   bash run_iperf3_all.sh
   bash run_ping_all.sh
   ```

### Script Details

- **run_iperf3_all.sh**: This script reads the hosts file line by line, skips comments and empty lines, and calls the `iperf3_test.sh` script for each hostname.

- **run_ping_all.sh**: Similar to `run_iperf3_all.sh`, but for running ping tests.

- **iperf3_test.sh**: Executes iperf3 tests for a specified host, logs the results, and calculates the average throughput.

- **ping_test.sh**: Executes ping tests for a specified host, logs the results, and calculates the average response time.
