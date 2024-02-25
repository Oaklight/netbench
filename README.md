# 网络性能测试脚本
[English version](./README_en.md)

本仓库包含一组用于执行网络性能测试的 shell 脚本，使用 iperf3 和 ping 工具来测量本地机器与指定远程主机之间的带宽和延迟。

### 内容

- `run_iperf3_all.sh`: 一个脚本，用于在 hosts 文件中列出的所有主机上运行 iperf3 测试。
- `run_ping_all.sh`: 一个脚本，用于在 hosts 文件中列出的所有主机上运行 ping 测试。
- `iperf3_test.sh`: 一个脚本，用于对单个主机执行 iperf3 测试并记录结果。
- `ping_test.sh`: 一个脚本，用于对单个主机执行 ping 测试并记录结果。
- `hosts`: 包含要测试的主机列表的文件。
- `./logs`: 用于记录测试结果的目录。

### 使用方法

在运行脚本之前，请确保您的系统上安装了 Bash shell。脚本假设 `iperf3` 和 `ping` 工具也已安装并可在系统的 PATH 中访问。

1. 将脚本放置在一个目录中，并创建一个 `hosts` 文件，格式如下：

   ```
   1.1.1.1 example.machine
   ```

2. 使用 Bash 解释器运行脚本：

   ```bash
   bash run_iperf3_all.sh
   bash run_ping_all.sh
   ```

### 脚本详情

- **run_iperf3_all.sh**: 该脚本逐行读取 hosts 文件，跳过注释和空行，并为每个主机名调用 `iperf3_test.sh` 脚本。

- **run_ping_all.sh**: 类似于 `run_iperf3_all.sh`，但用于运行 ping 测试。

- **iperf3_test.sh**: 该脚本执行 iperf3 测试以测量带宽。默认情况下，它运行 3 次测试，最多并行连接数为 40。iperf3 默认使用的端口是 80。脚本将结果记录到 `./logs/iperf3` 目录下的文件中。

- **ping_test.sh**: 该脚本执行 ping 测试以测量延迟。它为以下每个 ping 计数运行 3 次测试：10、50 和 100。脚本将结果记录到 `./logs/ping` 目录下的文件中。

### 安装和使用

#### iperf3 安装

要在系统上安装 iperf3，您可以使用操作系统的包管理器：

- 对于 Debian/Ubuntu (apt)：
  ```bash
  sudo apt-get update
  sudo apt-get install iperf3
  ```

- 对于 CentOS/RedHat (yum)：
  ```bash
  sudo yum install iperf3
  ```

### 重要注意事项

- 确保防火墙上必要的端口（iperf3 默认为 80）已打开，以允许测试成功运行。
- 脚本假设 `hosts.txt` 文件与脚本位于同一目录，并包含要测试的主机列表。