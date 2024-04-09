#!/bin/bash

sites=("https://google.com" "https://facebook.com" "https://twitter.com")
logfile="website_status.log"

check_sites() {
    for site in "${sites[@]}"; do
        current_time=$(date "+%Y-%m-%d %H:%M:%S")

        status_code=$(curl -s -o /dev/null -w "%{http_code}" --connect-timeout 10 -L "$site")

        if [ "$status_code" -eq 200 ]; then
            echo "$current_time: $site is UP"
            echo "$current_time: $site is UP" >> "$logfile"
        else
            echo "$current_time: $site is DOWN"
            echo "$current_time: $site is DOWN" >> "$logfile"
        fi
    done
}

check_sites

echo "Results have been recorded in the log file: $logfile"
