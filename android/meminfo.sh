#!/bin/bash

cmdname=meminfo.sh

function usage {
cat <<EOF

${cmdname} is a tool for showing Android native heap.

Usage:
${cmdname} [package name]

Options:
[package name]: if you don't sure the package name, try "pm list packages".

EOF
}

if [ $# -ne 1 ]; then
    usage
    return
fi

package="$1"

while [ 1 ]; do
    adb shell dumpsys meminfo ${package} | grep Native;
    sleep 1;
done;