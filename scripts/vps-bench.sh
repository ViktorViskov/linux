#!/usr/bin/env bash

LOG_FILE="/vps-metrics.tsv"

TIMESTAMP=$(date '+%Y-%m-%dT%H:%M:%S')

# Load averages
LOAD1=$(cut -d ' ' -f1 /proc/loadavg)
LOAD5=$(cut -d ' ' -f2 /proc/loadavg)
LOAD15=$(cut -d ' ' -f3 /proc/loadavg)

# CPU metrics
MPSTAT=$(mpstat 1 1 | awk '/Average:/ && $2 == "all"')

IDLE=$(echo "$MPSTAT" | awk '{print $NF}')
STEAL=$(echo "$MPSTAT" | awk '{print $(NF-2)}')
IOWAIT=$(echo "$MPSTAT" | awk '{print $(NF-5)}')

# Memory
MEM_AVAIL=$(free -m | awk '/Mem:/ {print $7}')
SWAP_USED=$(free -m | awk '/Swap:/ {print $3}')

# Disk util
DISK_UTIL=$(iostat -xz 1 1 | awk '/nvme|sd/ {util=$NF} END {print util}')

# Sysbench CPU
SYSBENCH=$(sysbench cpu --threads=4 --time=5 run 2>/dev/null \
  | awk '/events per second:/ {print $4}')

# FIO disk test
FIO_IOPS=$(fio --name=test \
  --ioengine=libaio \
  --iodepth=4 \
  --rw=randread \
  --bs=4k \
  --direct=1 \
  --size=32M \
  --numjobs=1 \
  --runtime=3 \
  --group_reporting \
  --filename=/tmp/fio.tmp 2>/dev/null \
  | awk -F'IOPS=' '/IOPS=/ {split($2,a,","); print a[1]}' \
  | head -n1)

# Write header once
if [ ! -f "$LOG_FILE" ]; then
  echo -e "timestamp\tload1\tload5\tload15\tidle\tsteal\tiowait\tmem_avail_mb\tswap_used_mb\tdisk_util\tfio_iops\tsysbench_eps" > "$LOG_FILE"
fi

# Append row
echo -e "$TIMESTAMP\t$LOAD1\t$LOAD5\t$LOAD15\t$IDLE\t$STEAL\t$IOWAIT\t$MEM_AVAIL\t$SWAP_USED\t$DISK_UTIL\t$FIO_IOPS\t$SYSBENCH" >> "$LOG_FILE"
