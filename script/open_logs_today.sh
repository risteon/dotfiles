#!/bin/sh
set -eu
echo "Opening today's logs"

fn="$(date +%y%m%d).txt"
vim -O2 "$HOME/Documents/logs/phd/$fn" "$HOME/Documents/logs/work/$fn"

