# Shell Scripting

## Task: System Information Script

This script takes the user's name as input and displays basic system information such as the date, hostname, username, disk usage, and running processes.

It also creates a directory and a file, and stores the running process information in the file using `>`.

## Script

```bash
#!/bin/bash

read -p "Enter your name: " name

date=$(date)
host=$(hostname)
user=$(whoami)

echo "Hello $name"
echo "Date: $date"
echo "Hostname: $host"
echo "Username: $user"

echo "Disk Usage:"
df -h

echo "Running Processes:"
ps

mkdir -p system_info
touch system_info/processes.txt
ps > system_info/processes.txt
````

## Output

```text
Enter your name: Kavya
Hello Kavya
Date: Thu Sep  3 20:18:41 IST 2026
Hostname: kavyas-MacBook-Air.local
Username: kavya

Disk Usage:
Filesystem        Size    Used   Avail Capacity iused ifree %iused  Mounted on
/dev/disk3s1s1   460Gi    16Gi   298Gi     6%    459k  3.1G    0%   /
devfs            211Ki   211Ki     0Bi   100%     730     0  100%   /dev
/dev/disk3s6     460Gi    20Ki   298Gi     1%       0  3.1G    0%   /System/Volumes/VM
/dev/disk3s2     460Gi    17Gi   298Gi     6%    2.2k  3.1G    0%   /System/Volumes/Preboot
/dev/disk3s4     460Gi   885Mi   298Gi     1%     529  3.1G    0%   /System/Volumes/Update
/dev/disk1s2     550Mi   6.0Mi   528Mi     2%       1  5.4M    0%   /System/Volumes/xarts
/dev/disk1s1     550Mi   5.8Mi   528Mi     2%      38  5.4M    0%   /System/Volumes/iSCPreboot
/dev/disk1s3     550Mi   5.7Mi   528Mi     1%     898  3.1G    0%   /System/Volumes/Hardware
/dev/disk3s5     460Gi   125Gi   298Gi    30%    1.7M  3.1G    0%   /System/Volumes/Data

Running Processes:
  PID TTY           TIME CMD
16839 ttys017    0:00.05 /bin/zsh -il
17129 ttys021    0:00.08 /bin/zsh -il
18080 ttys023    0:00.07 /bin/zsh -il
18938 ttys023    0:00.01 /bin/bash ./system_info.sh
```

## Commands Used

* `mkdir` - creates a directory
* `touch` - creates a file
* `echo` - prints text
* `df` - shows disk usage
* `ps` - shows running processes
* `read -p` - takes input from the user
* Variables - store and reuse values
* `>` - redirects output into a file

## Process Output File

The running process information was also stored in:

```text
system_info/processes.txt
```

using:

```bash
ps > system_info/processes.txt
```

The file was checked using:

```bash
cat system_info/processes.txt
```

Output:

```text
  PID TTY           TIME CMD
16839 ttys017    0:00.05 /bin/zsh -il
17129 ttys021    0:00.08 /bin/zsh -il
18080 ttys023    0:00.07 /bin/zsh -il
18938 ttys023    0:00.01 /bin/bash ./system_info.sh
```

