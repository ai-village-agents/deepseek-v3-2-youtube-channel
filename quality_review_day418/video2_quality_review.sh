#!/bin/bash
# Video 2 Quality Review Script - Day 418
# Comprehensive quality assessment for "Creative Handoffs: How Text Becomes Visual"

echo "🎬 Video 2 Quality Review - Day 418 (May 22, 2026)"
echo "================================================="
echo "Target: ≥4.3/5 weighted score (improving from Video 1's 4.43/5)"
echo ""

# Check if video file is provided
VIDEO_FILE="$1"
if [ -z "$VIDEO_FILE" ] || [ ! -f "$VIDEO_FILE" ]; then
    echo "❌ Error: Please provide path to Video 2 file"
    echo "Usage: ./video2_quality_review.sh /path/to/video2.mp4"
    exit 1
fi

echo "📁 Video File: $VIDEO_FILE"
echo "📊 Starting comprehensive quality assessment..."
echo ""

# Function to run ffprobe checks
ffprobe_check() {
    echo "🔧 Technical Specifications Check:"
    echo "---------------------------------"
    
    # Basic info
    echo "1. File Information:"
    ffprobe -v error -select_streams v:0 -show_entries stream=codec_name,width,height,r_frame_rate,bit_rate -show_entries format=format_name,duration,size -of csv=p=0 "$VIDEO_FILE" 2>/dev/null
    
    # Video stream details
    echo ""
    echo "2. Video Stream Analysis:"
    ffprobe -v error -select_streams v:0 -show_entries stream=codec_name,width,height,pix_fmt,r_frame_rate,bit_rate,display_aspect_ratio -of default=noprint_wrappers=1 "$VIDEO_FILE" 2>/dev/null
    
    # Audio stream details  
    echo ""
    echo "3. Audio Stream Analysis:"
    ffprobe -v error -select_streams a:0 -show_entries stream=codec_name,sample_rate,channels,bit_rate -of default=noprint_wrappers=1 "$VIDEO_FILE" 2>/dev/null
    
    # Format info
    echo ""
    echo "4. Container Format:"
    ffprobe -v error -show_entries format=format_name,duration,size,bit_rate -of default=noprint_wrappers=1 "$VIDEO_FILE" 2>/dev/null
}

# Function to calculate quality score
calculate_score() {
    echo ""
    echo "📈 Quality Score Calculation:"
    echo "============================="
    echo "Weights:"
    echo "  Technical Specifications: 20%"
    echo "  Audio Quality: 25%"
    echo "  Visual Quality: 25%"
    echo "  Capability-Honesty: 20%"
    echo "  Narrative Flow: 10%"
    echo ""
    
    # Prompt for scores
    echo "Please enter scores (0-5 scale):"
    read -p "Technical Specifications (0-5): " tech_score
    read -p "Audio Quality (0-5): " audio_score
    read -p "Visual Quality (0-5): " visual_score
    read -p "Capability-Honesty (0-5): " honesty_score
    read -p "Narrative Flow (0-5): " flow_score
    
    # Calculate weighted average
    weighted_score=$(echo "scale=2; ($tech_score*0.2 + $audio_score*0.25 + $visual_score*0.25 + $honesty_score*0.2 + $flow_score*0.1)" | bc)
    
    echo ""
    echo "🎯 Final Quality Score: $weighted_score/5"
    
    if (( $(echo "$weighted_score >= 4.3" | bc -l) )); then
        echo "✅ SUCCESS: Meets target (≥4.3/5)"
    else
        echo "⚠️  WARNING: Below target (<4.3/5)"
    fi
}

# Run checks
ffprobe_check

echo ""
echo "📋 Next Steps:"
echo "1. Complete capability-honesty checklist"
echo "2. Complete visual quality assessment"
echo "3. Calculate final quality score"
echo ""
echo "📝 Checklists available in:"
echo "   ../video2_creative_handoffs/quality_standards/"
echo ""

# Option to calculate score
read -p "Do you want to calculate the quality score now? (y/n): " calc_choice
if [[ "$calc_choice" == "y" || "$calc_choice" == "Y" ]]; then
    calculate_score
fi

echo ""
echo "✅ Quality review script complete."
echo "📄 Review documentation in ../video2_creative_handoffs/quality_standards/"
