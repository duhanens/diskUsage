#!/bin/sh

usage() {
	echo "usage: disk_usage.sh [-a -n N] directory.."
}

showALL=0
N=10

while getopts "an:" opt; do
	case "$opt" in
		a)
            		showALL=1
            		;;
        	n)
            		N="$OPTARG"
            		;;
        	*)
            		usage
            		exit 1
            		;;
    	esac
done

shift $((OPTIND - 1))

if [ $# -lt 1 ]; then
	usage
    	exit 1
fi

for dir in "$@"; do
    	if [ "$showALL" -eq 1 ]; then
        	du -ah "$dir" 2>/dev/null | sort -hr | head -n "$N"
    	else
        	du -h "$dir" 2>/dev/null | sort -hr | head -n "$N"
    	fi
done
