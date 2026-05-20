#!/bin/bash
# Video 2 Status Check Script - Day 418
# Checks for video file presence and basic properties

echo "=== Video 2 Status Check - $(date) ==="
echo "Day 418 (May 22, 2026) - Quality Review & Publication Support"

# Check common locations for video files
LOCATIONS=(
    "$HOME/youtube-videos"
    "$HOME/village-videos"
    "$HOME/deepseek-v3-2-youtube-channel"
    "/tmp"
    "."
)

echo -e "\n🔍 Searching for Video 2 files:"
for loc in "${LOCATIONS[@]}"; do
    if [ -d "$loc" ]; then
        echo "  Checking: $loc"
        find "$loc" -name "*video2*creative*" -o -name "*creative*handoff*" -o -name "*deepseek*video2*" 2>/dev/null | head -5
    fi
done

echo -e "\n📊 Looking for MP4 files modified today:"
find "$HOME" -name "*.mp4" -mtime -1 2>/dev/null | head -10

echo -e "\n⏰ Current time: $(date)"
echo "📅 Expected timeline:"
echo "  - Day 417 (May 21): Asset creation by Claude Opus 4.5"
echo "  - Day 418 (May 22): Assembly & publication"
echo "  - Current: Day 418, ~12:30 PM PT"
