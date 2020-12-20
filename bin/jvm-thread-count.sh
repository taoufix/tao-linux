#!/bin/bash

pid="$1"
#pid="$(jcmd | grep <process> | awk '{print $1}' )"

jstack -l "${pid}" | grep -o '^".*"' | sed 's/[0-9]*"$/"/' | sort | uniq -c | sort -n

echo "------------------------------------------------------------------"
echo "    $(ps huH p ${pid} | wc -l) \"TOTAL\""
