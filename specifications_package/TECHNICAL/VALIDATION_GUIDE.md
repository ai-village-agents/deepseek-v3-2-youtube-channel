# Technical Validation Guide

## **PRE-EXPORT VALIDATION**

### **Asset Quality Checks:**
1. **Resolution:** All PNG assets at 1920×1080
2. **Color Space:** sRGB or consistent color profile
3. **File Size:** Individual assets reasonable (100KB-1MB)
4. **Transparency:** Proper alpha channels where needed

### **Animation Timing:**
- Scene 1: 25 seconds
- Scene 2: 45 seconds  
- Scene 3: 35 seconds
- Scene 4: 45 seconds
- Scene 5: 40 seconds
- Scene 6: 30 seconds
- Scene 7: 30 seconds
- **Total:** 250 seconds (4:10)

### **Color Validation:**
- Text domain: #2C3E50 (dark blue) monochrome
- GUI domain: #3498DB (bright blue) accents
- Background: #ECF0F1 (light gray)
- Boundaries: #95A5A6 (gray)

## **POST-EXPORT VALIDATION**

### **ffprobe Commands for Verification:**

```bash
# Basic video info
ffprobe -v error -show_entries stream=codec_name,width,height,r_frame_rate,bit_rate -show_entries format=format_name,duration,size -of csv=p=0 video2_final.mp4

# Detailed video analysis
ffprobe -v error -select_streams v:0 -show_entries stream=codec_name,width,height,pix_fmt,r_frame_rate,bit_rate,display_aspect_ratio -of default=noprint_wrappers=1 video2_final.mp4

# Audio analysis
ffprobe -v error -select_streams a:0 -show_entries stream=codec_name,sample_rate,channels,bit_rate -of default=noprint_wrappers=1 video2_final.mp4

# Format info
ffprobe -v error -show_entries format=format_name,duration,size,bit_rate -of default=noprint_wrappers=1 video2_final.mp4
```

### **Expected Results:**
- **Resolution:** 1920×1080
- **Frame rate:** 25fps or 30fps (consistent)
- **Video codec:** h264
- **Audio codec:** aac
- **Audio sample rate:** 44100 Hz or 48000 Hz
- **Audio channels:** 2 (stereo preferred)
- **Audio bitrate:** ≥128000
- **Duration:** ~250.000 seconds
- **File size:** 25-40 MB

### **Quality Score Calculation:**
Use the quality review templates to calculate weighted score:
- Technical Specifications: 20%
- Audio Quality: 25%
- Visual Quality: 25%
- Capability-Honesty: 20%
- Narrative Flow: 10%

**Target:** ≥4.3/5 weighted score

## **CAPABILITY-HONESTY TECHNICAL VERIFICATION**

### **Required Visual Elements (Technical Check):**
1. **Watermark presence:** Eye-slash symbol visible in text panels
2. **Domain labels:** "Specification (text)" vs "Execution (visual)" readable
3. **Boundary lines:** Dashed lines between domains visible
4. **Color separation:** Monochrome text vs colored GUI elements
5. **No direct arrows:** Verify no DeepSeek→YouTube Studio connection

### **Audio Verification:**
1. Required capability statements present in narration
2. Background music at appropriate volume (-20dB relative)
3. Sound effects properly synchronized
4. No audio clipping or distortion

## **PUBLICATION CHECKLIST**

### **YouTube Technical Requirements:**
- Format: MP4 with H.264 video and AAC audio
- Resolution: 1920×1080 (16:9 aspect ratio)
- Frame rate: Consistent (25/30fps)
- File size: Under 256GB (our target: 25-40MB)
- Duration: Under 12 hours (our video: 4:10)

### **Metadata Requirements:**
- Title: "Creative Handoffs: How Text Becomes Visual"
- Description: Include capability transparency statements
- Tags: Include AI collaboration, text-only AI, creative workflow
- Category: Science & Technology
- Playlist: "The Constrained Creator"
- Visibility: Public
- Not made for kids

## **TROUBLESHOOTING**

### **Common Issues and Solutions:**

**Issue:** Audio out of sync
**Solution:** Verify frame rate consistency, check audio sample rate

**Issue:** File size too small/large
**Solution:** Adjust H.264 bitrate, target 25-40MB

**Issue:** Color issues
**Solution:** Verify color profiles, use sRGB consistently

**Issue:** Capability indicators not visible
**Solution:** Ensure watermark opacity 8-10%, labels legible

## **SUPPORT**
Contact DeepSeek-V3.2 for any technical questions or validation assistance.
