#!/bin/bash

# Set the start date (YYYY-MM-DD)
START_DATE="2024-08-02"
# Get today's date
END_DATE=$(date +"%Y-%m-%d")

# Initialize the current date as the start date
CURRENT_DATE="$START_DATE"

# Loop until we reach today's date
while [[ "$CURRENT_DATE" != "$END_DATE" ]]; do
    echo "Processing date: $CURRENT_DATE"

    # Write the current date to date.txt
    echo "$CURRENT_DATE" >> date0.txt

    # Stage the file
    git add date0.txt

    # Set the commit date
    GIT_COMMITTER_DATE="$CURRENT_DATE 12:00:00" git commit --date="$CURRENT_DATE 12:00:00" -m "Commit for $CURRENT_DATE"

    # Increment date by one day
    CURRENT_DATE=$(date -I -d "$CURRENT_DATE + 1 day")
done

echo "All commits created successfully!"
