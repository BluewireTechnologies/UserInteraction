#!/bin/env sh

echo 'Log count:'
ls "$@" | wc -l

echo 'Log entry count:'
cat "$@" | jq -s length

echo 'Number of drugs/ttos edited:'
cat "$@" | jq '.["@fields"].log.EntityReference.Id' | jq -s 'unique | length'

echo 'Number of information link clicks:'
cat "$@" | jq 'include "lib"; linkClicks' | jq -s 'include "lib"; sumByKey'

echo 'User count:'
cat "$@" | jq '.["@fields"].loginCode.Username' | jq -s 'unique | length'

echo 'All interactions:'
cat "$@" | jq 'include "lib"; interactions | sumByKey' | jq -s 'include "lib"; sumByKey | totals'
