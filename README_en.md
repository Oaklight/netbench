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

- **iperf3_test.sh**: This script performs iperf3 tests to measure bandwidth. It runs the tests 3 times by default, with up to 40 parallel connections. The default port used for iperf3 is 80. The script logs the results to a file in the `./logs/iperf3` directory.

- **ping_test.sh**: This script performs ping tests to measure latency. It runs the tests 3 times for each of the following ping counts: 10, 50, and 100. The script logs the results to a file in the `./logs/ping` directory.

### Installation and Usage

#### iperf3 Installation

To install iperf3 on a system, you can use the package manager for your operating system:

- For Debian/Ubuntu (apt):
  ```bash
  sudo apt-get update
  sudo apt-get install iperf3
  ```

- For CentOS/RedHat (yum):
  ```bash
  sudo yum install iperf3
  ```

### Important Notes

- Ensure that the necessary port (80 by default for iperf3) is open on the firewall to allow the tests to run successfully.
- The scripts assume that the `hosts` file is in the same directory as the scripts and contains the list of hosts to test.

