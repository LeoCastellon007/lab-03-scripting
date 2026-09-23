#!/bin/bash
set -euo pipefail

# Command-line arguments: the word to search for and the output file
SEARCH_PATTERN="$1"
OUTPUT="$2"

# Download the novel
curl -s -o mobydick.txt https://gist.githubusercontent.com/StevenClontz/4445774/raw/1722a289b665d940495645a5eaaad4da8e3ad4c7/mobydick.txt

# Count matches: grep -o prints each match on its own line, wc -l counts the lines
OCCURRENCES=$(grep -o "$SEARCH_PATTERN" mobydick.txt | wc -l | tr -d ' ')

# Write the report
echo "The search pattern $SEARCH_PATTERN was found $OCCURRENCES time(s)." > "$OUTPUT"