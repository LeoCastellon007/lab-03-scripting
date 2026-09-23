#!/bin/bash
set -euo pipefail

# Download the archive
curl -s -O https://s3.amazonaws.com/ds2002-resources/labs/lab3-bundle.tar.gz

# Extract it (produces lab3_data.tsv)
tar -xzf lab3-bundle.tar.gz

# Remove blank / whitespace-only lines
awk '!/^[[:space:]]*$/' lab3_data.tsv > cleaned.tsv

# Convert tabs to commas
tr '\t' ',' < cleaned.tsv > cleaned.csv

# Count data rows (all lines minus the header row)
ROWS=$(( $(wc -l < cleaned.csv) - 1 ))
echo "Data rows remaining: $ROWS"

# Package the cleaned CSV into a new archive
tar -czf converted-archive.tar.gz cleaned.csv