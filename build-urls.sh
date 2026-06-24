#!/bin/bash
BASE="https://raw.githubusercontent.com/Rohit3523/temp/main/android"
OUTPUT="/Users/rohit/Desktop/edge-to-edge-screenshots/screenshot-urls.md"

> "$OUTPUT"

for dir in api-31-android-12 api-33-android-13 api-34-android-14 api-35-android-15 api-36-android-16 api-37-android-17; do
  echo "## $dir" >> "$OUTPUT"
  for file in "/Users/rohit/Desktop/edge-to-edge-screenshots/android/$dir"/*.png; do
    name=$(basename "$file")
    url="$BASE/$dir/$name"
    echo "$name = $url" >> "$OUTPUT"
  done
  echo "" >> "$OUTPUT"
done

echo "Done -> $OUTPUT"
