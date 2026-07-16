#!/bin/bash

# Setting var
LOG_FILE="nginx.log"
CSV_FILE="nginx_report.csv"


#check log
if [ ! -f "$LOG_FILE" ]; then
    echo "Error: The specified file '$LOG_FILE' does not exist!"
    exit 1
fi


echo "Conversion to CSV"

# added headers to CSV
echo "IP,Date,Method,URL,Status" > "$CSV_FILE"

# use awk:
# $1 - IP, $4 - date, $6 - method, $7 - url, $9 - status
# use sed for remove other
awk '{print $1 "," $4 "," $6 "," $7 "," $9}' "$LOG_FILE" | sed 's/\[//g' | sed 's/"//g' >> "$CSV_FILE"

echo "Successfully converted to file: $CSV_FILE"


echo "Transfer file to git"

# use git comands
git add "$CSV_FILE"
git commit -m "nginx_report.csv"
git push

echo "File successfully pushed to Git!"
