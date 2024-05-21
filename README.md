# 网络性能测试脚本
[English](./README_en.md)

这个仓库包含了一些用于测试网络性能的 shell 脚本。它们使用 `iperf3` 和 `ping` 来测试带宽和延迟。

## 脚本列表

- `run_iperf3_all.sh`: 在 `hosts` 文件中的所有主机上运行 `iperf3`。
- `run_ping_all.sh`: 在 `hosts` 文件中的所有主机上运行 `ping`。
- `iperf3_test.sh`: 对单个主机进行带宽测试。
- `ping_test.sh`: 对单个主机进行延迟测试。
- `hosts`: 测试目标主机列表。
- `./logs`: 存放测试日志的目录。

## 使用方法

确保你的系统支持 Bash 并且安装了 `iperf3` 和 `ping`。

1. 把脚本放到一个目录下，创建一个 `hosts` 文件，格式如下：
   ```
   1.1.1.1 example.machine
   ```
2. 运行脚本：
   ```
   bash run_iperf3_all.sh
   bash run_ping_all.sh
   ```

## 脚本细节

- `run_iperf3_all.sh` 和 `run_ping_all.sh`: 读取 `hosts` 文件，忽略注释和空行，对每个主机运行相应的测试脚本。
- `iperf3_test.sh`: 运行带宽测试，默认测试 3 次，最大并行连接数 40，使用端口 80，结果记录在 `./logs/iperf3`。
- `ping_test.sh`: 运行延迟测试，分别对 10、50 和 100 个 ping 计数进行 3 次测试，结果记录在 `./logs/ping`。

## 安装 `iperf3`

使用包管理器安装 `iperf3`：

- Debian/Ubuntu:
  ```
  sudo apt-get update && sudo apt-get install iperf3
  ```
- CentOS/RedHat:
  ```
  sudo yum install iperf3
  ```

## 注意事项

- 确保防火墙允许 `iperf3` 使用的端口（默认 80）。
- `hosts.txt` 文件应与脚本同目录，包含要测试的主机列表。
