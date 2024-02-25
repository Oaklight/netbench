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

- **iperf3_test.sh**: 对指定的主机执行 iperf3 测试，记录测试结果，并计算平均吞吐量。

- **ping_test.sh**: 对指定的主机执行 ping 测试，记录测试结果，并计算平均响应时间。
