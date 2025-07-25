#!/bin/bash

# Get yesterday's date
YESTERDAY=$(date -v-1d +%Y-%m-%d)
YESTERDAY_LOG_FILE="daily/$YESTERDAY.md"
YESTERDAY_COMMIT_TIMESTAMP="${YESTERDAY}T23:59:59"

# Check for uncommitted changes in yesterday's log file and commit them
if [ -f "$YESTERDAY_LOG_FILE" ]; then
  if [ -n "$(git status --porcelain "$YESTERDAY_LOG_FILE")" ]; then
    git add "$YESTERDAY_LOG_FILE"
    GIT_COMMITTER_DATE="${YESTERDAY_COMMIT_TIMESTAMP}" git commit --date="${YESTERDAY_COMMIT_TIMESTAMP}" -m "docs: log for $YESTERDAY"
    echo "Committed changes for $YESTERDAY_LOG_FILE"
  fi
fi

# Get the current date
DATE=$(date +%Y-%m-%d)

# Create the directory structure if it doesn't exist
LOG_DIR="daily"
mkdir -p "$LOG_DIR"

# Create the new log file from the template
LOG_FILE="$LOG_DIR/$DATE.md"

if [ ! -f "$LOG_FILE" ]; then
  sed "s/{{DATE}}/$DATE/g" templates/daily.md > "$LOG_FILE"
  echo "Created new log file: $LOG_FILE"
else
  echo "Log file already exists: $LOG_FILE"
fi

# Check if an editor was passed as an argument
if [ -n "$1" ]; then
    case "$1" in
        vscode)
            code "$LOG_FILE"
            ;;
        nano)
            nano "$LOG_FILE"
            ;;
        vim)
            vim "$LOG_FILE"
            ;;
        *)
            echo "Invalid editor: $1"
            ;;
    esac
else
    # Ask the user how to open the file
    PS3="Open file with: "
    select editor in vscode nano vim quit; do
      case $editor in
        vscode)
          code "$LOG_FILE"
          break
          ;;
        nano)
          nano "$LOG_FILE"
          break
          ;;
        vim)
          vim "$LOG_FILE"
          break
          ;;
        quit)
          break
          ;;
      esac
    done
fi
