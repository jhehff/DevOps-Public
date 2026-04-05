#!/bin/bash

# Top 5 IP addresses by request count
echo "Top 5 IP addresses with the most requests: "
awk '{count[$1]++} END {for (ip in count) print count[ip], ip}' nginx-logs.txt \
  | sort -nr \
  | head -n 5 \
  | awk '{print $2, "-", $1, "requests"}'

echo "Top 5 Most Requested Paths: "
awk '{count[$7]++} END {for (path in count) print count[path], path}' nginx-logs.txt\
	| sort -nr \
	| head -n 5 \
	| awk '{print $2, "-", $1, "requests"}'

echo "Top 5 Response Codes: "
awk '{count[$9]++} END {for (status in count) print count[status], status}' nginx-logs.txt\
        | sort -nr \
        | head -n 5 \
        | awk '{print $2, "-", $1, "requests"}'

echo "Top 5 user Agents: "
awk '{count[$NF]++} END {for (val in count) print count[val], val}' nginx-logs.txt \
| sort -nr \
| head -n 5 \
| awk '{print $2, "-", $1, "requests"}'
