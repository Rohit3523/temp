#!/bin/bash
BASE="https://raw.githubusercontent.com/Rohit3523/temp/main/android"
URLS_FILE="/Users/rohit/Desktop/edge-to-edge-screenshots/screenshot-urls.md"
PR_BODY_FILE="/Users/rohit/Desktop/edge-to-edge-screenshots/pr-screenshots-body.md"

DIRS=("api-31-android-12" "api-33-android-13" "api-34-android-14" "api-35-android-15" "api-36-android-16" "api-37-android-17")
LABELS=("Android 12" "Android 13" "Android 14" "Android 15" "Android 16" "Android 17")

# Get all screenshot names from first dir
NAMES=()
for f in "/Users/rohit/Desktop/edge-to-edge-screenshots/android/${DIRS[0]}"/*.png; do
  NAMES+=("$(basename "$f" .png)")
done

# Build table
{
  # Header row
  printf "| Screen |"
  for label in "${LABELS[@]}"; do
    printf " %s |" "$label"
  done
  printf " iOS |\n"

  # Separator row
  cols=$(( ${#LABELS[@]} + 2 ))
  sep=""
  for ((i=0; i<cols; i++)); do sep+="--------|"; done
  printf "|%s\n" "$sep"

  # Data rows
  for name in "${NAMES[@]}"; do
    printf "| %s |" "$name"
    for dir in "${DIRS[@]}"; do
      url="$BASE/$dir/${name}.png"
      printf " ![](%s) |" "$url"
    done
    printf " - |\n"
  done

} > "$PR_BODY_FILE"

echo "Done -> $PR_BODY_FILE"
wc -l "$PR_BODY_FILE"
