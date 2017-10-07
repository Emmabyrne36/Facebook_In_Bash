#!/bin/bash

if [ -z "$1" ]; then
	echo "Usage $0 mutex-name" >&1
	exit 1
else
#the link (ln) system call is supposed to be atomic on a local file system
	while ! ln "$0" "$1" 2>/dev/null; do
		sleep 1
	done

	exit 0
fi
next 2830
next 2860
next 2866
next 2907
next 2907
next 2907
next 2906
next 2906
next 2906
next 2938
