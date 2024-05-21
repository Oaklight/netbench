# Network Performance Testing Scripts
[中文版](./README.md)

This repo contains shell scripts for testing network performance using `iperf3` and `ping` to measure bandwidth and latency.

## Contents

- `run_iperf3_all.sh`: Executes `iperf3` on all hosts listed in `hosts` file.
- `run_ping_all.sh`: Executes `ping` on all hosts listed in `hosts` file.
- `iperf3_test.sh`: Performs bandwidth tests on a single host.
- `ping_test.sh`: Measures latency for a single host.
- `hosts`: Text file with hosts to test.
- `./logs`: Directory for test logs.

## Usage

Ensure Bash, `iperf3`, and `ping` are installed on your system.

1. Place scripts in a directory and set up a `hosts` file:
   ```
   1.1.1.1 example.host
   ```
2. Run the scripts:
   ```
   bash run_iperf3_all.sh
   bash run_ping_all.sh
   ```

## Details

- `run_iperf3_all.sh` and `run_ping_all.sh` read `hosts`, ignoring comments and blanks, and run corresponding tests.
- `iperf3_test.sh` runs bandwidth tests 3 times with up to 40 parallel connections on port 80, logging results in `./logs/iperf3`.
- `ping_test.sh` tests latency with 3 repetitions for 10, 50, and 100 pings, logging in `./logs/ping`.

## Install `iperf3`

Install `iperf3` via package manager:

- Debian/Ubuntu:
  ```
  sudo apt-get update && sudo apt-get install iperf3
  ```
- CentOS/RedHat:
  ```
  sudo yum install iperf3
  ```

## Notes

- Open necessary ports in firewall (default `iperf3` port is 80).
- `hosts.txt` should be in the same directory as scripts with the list of hosts to test.
