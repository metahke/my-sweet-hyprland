#!/usr/bin/env bash
# -----------------
# dnsdump.sh - a simple script to display DNS records for a given domain
#
# usage:
#   ./dnsdump.sh <domain> [RECORD_TYPE]
#
# arguments:
#   <domain> - domain name to query
#   [RECORD] - optional DNS record type
#              (e.g., A, MX, NS, TXT)
#
# description:
#   the script checks internet connection,
#   verifies domain existence, and outputs
#   requested DNS records in a formatted table.
#
# author: @metahke
# date: july 6, 2025
# -----------------

# apply bash "strict mode"
set -euo pipefail

# variables
args_num=$#
domain_name=""
chosen_record=""
is_chosen_record_correct=false
columns_separator=$'\t'
new_line=$'\n'
result_header="RECORD_TYPE${columns_separator}VALUE"
result=""
ping_address="1.1.1.1"
current_records=()
record_types=(
    "A"
    "MX"
    "NS"
    "TXT"
)

# check
## if there is internet connection
if ! ping -c 1 -W 2 $ping_address > /dev/null 2>&1; then
    echo "no internet connection"
    exit 1
fi

## if user chose the domain
if [[ $args_num -eq 0 ]]; then
    echo "no domain specified"
    exit 1
else
    domain_name="$1"
fi

## if domain exists
if ! host "$domain_name" > /dev/null 2>&1; then
    echo "domain doesn't exist"
    exit 1
fi

## if args number is not too big
if [[ $args_num -gt 2 ]]; then
    echo "too much arguments"
    exit 1
fi

## if user chose the record
if [[ $args_num -eq 2 ]]; then
    chosen_record="$2"
fi

## if chosen record is correct
if [[ -n "$chosen_record" ]]; then
    for record_type in "${record_types[@]}"; do
        if [[ "$record_type" == "$chosen_record" ]]; then
            is_chosen_record_correct=true
            break
        fi
    done

    if ! $is_chosen_record_correct; then
        echo "chosen record is not correct"
        exit 1
    fi
fi

# update records array
if $is_chosen_record_correct; then
    current_records=("$chosen_record")
else
    current_records=("${record_types[@]}")
fi

# save domain records info
for record_type in "${current_records[@]}"; do
    record_value="$(dig +short "$domain_name" "$record_type")"

    while IFS= read -r line_value; do
        result+="$record_type$columns_separator$line_value$new_line"
    done <<< "$record_value"
done

# print domain records
{ echo "$result_header"; echo "$result"; } | column -t -s "$columns_separator"

# end program
exit 0;
