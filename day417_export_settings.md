# DAY 417 - EXPORT SETTINGS & FILE SIZE OPTIMIZATION
## For "Creative Handoffs: How Text Becomes Visual" Final Export

## **🎯 OVERVIEW**
Detailed export specifications targeting 25-40MB file size with optimal YouTube quality, balancing visual fidelity with efficient compression for Video 2 final polish.

## **📊 CURRENT FILE STATUS**
**Current draft video:** `video2_creative_handoffs_draft.mp4`
- **Size:** 3.5 MB (base - will increase substantially with enhancements)
- **Duration:** 250.04s (4:10)
- **Resolution:** 1920×1080 (Full HD)
- **Frame rate:** 25 fps (PAL)
- **Bitrate:** ~117 kbps (current average)

**Target final video:** 25-40 MB file size
- **Target bitrate:** 800-1280 kbps (depending on complexity)
- **Quality goal:** Visually lossless compression for YouTube delivery

## **🎞️ VIDEO ENCODING SPECIFICATIONS**

### **CODEC & CONTAINER:**
- **Video codec:** H.264 (AVC) - YouTube recommended
- **Profile:** High
- **Level:** 4.1 (supports 1920×1080@30fps)
- **Container:** MP4 (YouTube preferred)
- **Color space:** BT.709 (standard for HD)
- **Pixel format:** yuv420p (widest compatibility)

### **BITRATE TARGETS:**
Based on 4:10 (250s) duration:

| Target Size | Average Bitrate | Quality Level | Use Case |
|-------------|----------------|---------------|----------|
| 25 MB | 800 kbps | Good | Balanced default |
| 30 MB | 960 kbps | Very Good | Recommended target |
| 35 MB | 1120 kbps | Excellent | High quality |
| 40 MB | 1280 kbps | Outstanding | Maximum quality |

**Recommended:** Target 30-35 MB (960-1120 kbps) for optimal quality/size balance.

### **QUALITY-ADAPTIVE BITRATE SETTINGS:**

#### **CONSTANT QUALITY (CRF) METHOD (PREFERRED):**
```ffmpeg
-crf 18 -preset medium
```
- **CRF 18:** Visually lossless for most content
- **Preset medium:** Good balance of speed/compression
- **Expected size:** 30-35 MB for 250s 1080p content

#### **2-PASS VBR METHOD (ALTERNATIVE):**
```ffmpeg
-b:v 1000k -maxrate 1200k -bufsize 2000k -preset medium -pass 1
-b:v 1000k -maxrate 1200k -bufsize 2000k -preset medium -pass 2
```
- **Average:** 1000 kbps
- **Maximum:** 1200 kbps (peak quality for complex scenes)
- **Buffer:** 2000 kbps (2x average for smooth streaming)

### **FRAME RATE & INTERLACING:**
- **Frame rate:** 25 fps (consistent with Video 1)
- **Scan type:** Progressive (no interlacing)
- **GOP structure:** Closed GOP every 2 seconds (50 frames)
- **B-frames:** 2 (for better compression)
- **Reference frames:** 3

### **ENCODING PRESET OPTIMIZATION:**
```ffmpeg
-preset medium -tune film -profile:v high -level 4.1
```
- **Preset:** medium (balanced speed/quality)
- **Tune:** film (optimized for typical video content)
- **Motion estimation:** umh (full motion search)
- **Subpixel refinement:** 7 (maximum quality)
- **Deblocking:** 0:0 (default)

## **🔊 AUDIO ENCODING SPECIFICATIONS**

### **CODEC & SETTINGS:**
- **Audio codec:** AAC-LC (YouTube recommended)
- **Bitrate:** 192 kbps stereo (high quality)
- **Sample rate:** 48 kHz (preferred) or 44.1 kHz
- **Channels:** Stereo (2.0)
- **Bit depth:** 16-bit

### **AUDIO QUALITY FACTORS:**
- **LUFS target:** -14 to -16 integrated loudness
- **Peak limit:** -1.0 dBTP (True Peak)
- **Dynamic range:** 12-15 dB for dialogue
- **Phase correlation:** >0.9 (good stereo image)

### **AUDIO ENCODING COMMAND:**
```ffmpeg
-c:a aac -b:a 192k -ar 48000 -ac 2
```

## **📏 FILE SIZE CALCULATIONS & VALIDATION**

### **BITRATE CALCULATOR:**
```
Total seconds: 250
Target size: 35,000,000 bytes (35 MB)
Target bits: 280,000,000 bits (35 MB × 8)

Required bitrate = Total bits / Total seconds
                 = 280,000,000 / 250
                 = 1,120,000 bps
                 = 1120 kbps
```

### **BITRATE ALLOCATION:**
- **Video:** 1000 kbps (89% of total)
- **Audio:** 192 kbps (17% of total)
- **Overhead:** ~72 kbps (6% - container, metadata)

### **EXPECTED FILE SIZES:**
```
CRF 18 estimates:
- Low complexity: 25-30 MB (800-960 kbps)
- Medium complexity: 30-35 MB (960-1120 kbps) 
- High complexity: 35-40 MB (1120-1280 kbps)

Our content: Medium complexity (mix of text/graphics)
Target range: 30-35 MB
```

## **⚙️ FFMPEG COMMAND TEMPLATES**

### **COMPREHENSIVE EXPORT COMMAND:**
```bash
ffmpeg -i input.mp4 \
  -c:v libx264 -crf 18 -preset medium -tune film \
  -profile:v high -level 4.1 \
  -r 25 -g 50 -bf 2 -refs 3 \
  -c:a aac -b:a 192k -ar 48000 -ac 2 \
  -movflags +faststart \
  output_final.mp4
```

### **WITH EXPLICIT BITRATE TARGET (2-PASS):**
```bash
# First pass
ffmpeg -i input.mp4 \
  -c:v libx264 -b:v 1000k -maxrate 1200k -bufsize 2000k \
  -preset medium -tune film -profile:v high -level 4.1 \
  -r 25 -g 50 -bf 2 -refs 3 \
  -pass 1 -an -f mp4 /dev/null

# Second pass
ffmpeg -i input.mp4 \
  -c:v libx264 -b:v 1000k -maxrate 1200k -bufsize 2000k \
  -preset medium -tune film -profile:v high -level 4.1 \
  -r 25 -g 50 -bf 2 -refs 3 \
  -c:a aac -b:a 192k -ar 48000 -ac 2 \
  -movflags +faststart \
  -pass 2 output_2pass.mp4
```

### **QUALITY-VISUALIZED COMMAND (WITH METRICS):**
```bash
ffmpeg -i input.mp4 \
  -c:v libx264 -crf 18 -preset slow -tune film \
  -profile:v high -level 4.1 \
  -x264-params "keyint=50:min-keyint=25:scenecut=40" \
  -r 25 -vf "scale=1920:1080:flags=lanczos" \
  -c:a aac -b:a 192k -ar 48000 -ac 2 \
  -af "loudnorm=I=-15:LRA=11:TP=-1.0" \
  -movflags +faststart \
  -metadata title="Creative Handoffs: How Text Becomes Visual" \
  -metadata artist="DeepSeek-V3.2" \
  -metadata description="AI collaboration showing text-to-visual creative workflows" \
  output_quality.mp4
```

## **🔍 QUALITY VERIFICATION CHECKS**

### **POST-EXPORT VALIDATION:**
```bash
# Get file size
ls -lh output_final.mp4

# Verify technical specs
ffprobe -v error -select_streams v:0 -show_entries \
  stream=codec_name,width,height,r_frame_rate,bit_rate \
  -of default=noprint_wrappers=1 output_final.mp4

# Check audio specs
ffprobe -v error -select_streams a:0 -show_entries \
  stream=codec_name,sample_rate,channels,bit_rate \
  -of default=noprint_wrappers=1 output_final.mp4

# Check duration
ffprobe -v error -show_entries format=duration \
  -of default=noprint_wrappers=1:nokey=1 output_final.mp4
```

### **EXPECTED OUTPUTS:**
```
Video stream: h264, 1920x1080, 25 fps, ~1000 kbps
Audio stream: aac, 48000 Hz, stereo, 192 kbps
Duration: 250.04 seconds
File size: 30-35 MB
```

## **🎯 FILE SIZE OPTIMIZATION TECHNIQUES**

### **BITRATE ALLOCATION STRATEGIES:**

#### **1. SCENE-BASED BITRATE ADJUSTMENT:**
- **Text-heavy scenes:** Can use lower bitrate (800 kbps)
- **Complex graphics:** Need higher bitrate (1200 kbps)
- **Simple backgrounds:** Can use lower bitrate
- **Motion/transitions:** Need moderate bitrate

#### **2. QUANTIZATION PARAMETER OPTIMIZATION:**
- **Maximum QP:** 51 (worst quality)
- **Minimum QP:** 0 (best quality)
- **Recommended range:** 18-26 for CRF method
- **I-frame QP:** Typically 2-3 lower than P-frames

#### **3. PSYCHOVISUAL OPTIMIZATION:**
- **Psychovisual tuning:** Enable for better perceived quality
- **AQ mode:** 2 (auto-variance)
- **AQ strength:** 0.8-1.0
- **De-blocking filter:** -2:-2 (slightly stronger)

### **COMPRESSION EFFICIENCY TIPS:**
1. **Use constant quality (CRF)** over target bitrate when possible
2. **Higher presets** (slower) give better compression
3. **Proper scene detection** improves compression efficiency
4. **Clean source material** compresses better
5. **Avoid recompression** of already compressed video

## **📈 YOUTUBE UPLOAD CONSIDERATIONS**

### **YOUTUBE RECOMMENDATIONS:**
- **Container:** MP4
- **Video codec:** H.264
- **Audio codec:** AAC-LC or MP3
- **Resolution:** 1920×1080
- **Frame rate:** Native source frame rate
- **Bitrate:** 8 Mbps for 1080p (YouTube re-encodes anyway)
- **Color space:** BT.709

### **UPLOAD-READY CHECKLIST:**
- [ ] File size under 128 GB (YouTube limit)
- [ ] Duration 4:10 matches script
- [ ] Audio/video in sync
- [ ] No visual artifacts
- [ ] Proper aspect ratio (16:9)
- [ ] No black bars/pillarboxing
- [ ] Audio levels appropriate (-14 to -16 LUFS)
- [ ] Metadata embedded correctly

### **YOUTUBE RE-ENCODING NOTES:**
YouTube will re-encode all uploaded videos. Our goals:
1. **Provide high-quality source** so YouTube's encode starts from good material
2. **Avoid compression artifacts** that YouTube compression might amplify
3. **Use YouTube-friendly settings** to minimize quality loss during re-encode
4. **Faststart enabled** for streaming optimization

## **⚡ PERFORMANCE OPTIMIZATION**

### **RENDER TIME ESTIMATES:**
Based on medium preset and 250s duration:

| Hardware | Estimated Time | Notes |
|----------|----------------|--------|
| Modern CPU | 5-10 minutes | Good single-thread performance |
| Older CPU | 15-25 minutes | May benefit from slower preset |
| Multi-thread | 3-6 minutes | With -threads auto optimization |
| GPU encoding | 1-3 minutes | NVENC/QuickSync but lower quality |

### **PARALLEL PROCESSING OPTIONS:**
```bash
# Use all CPU threads
-threads 0

# Specific thread count
-threads 8

# Frame-level parallel processing
-x264-params "frame-threads=4"
```

### **MEMORY USAGE:**
- **1080p buffer:** ~8 MB per reference frame
- **With 3 reference frames:** ~24 MB
- **Total estimate:** 100-200 MB during encoding
- **Recommendation:** Ensure 500 MB+ free memory

## **🚀 WORKFLOW FOR DAY 417 FINAL EXPORT**

### **OPTIMIZED WORKFLOW:**
1. **Prepare final composition** with all enhancements
2. **Preview export settings** with short test segment
3. **Calculate target bitrate** based on test results
4. **Execute full export** with optimal settings
5. **Verify output** against all quality criteria
6. **Upload to YouTube** when all checks pass

### **TEST EXPORT RECOMMENDATION:**
Export 30-second test segment (e.g., scenes 3-4) to verify:
- File size estimates
- Quality level
- Encoding speed
- Audio sync

### **FINAL EXPORT CHECKLIST:**
- [ ] Source video finalized (enhancements complete)
- [ ] Export settings validated with test segment
- [ ] Sufficient disk space available (2x final size)
- [ ] Encoding started with verified command
- [ ] Progress monitored for errors
- [ ] Output file validated with ffprobe
- [ ] Quality spot-checked at multiple points
- [ ] File size within target range (25-40 MB)

## **📊 QUALITY ASSESSMENT METRICS**

### **VISUAL QUALITY TESTS:**
1. **Text legibility:** All text perfectly readable
2. **Color accuracy:** Colors match source within 2% delta-E
3. **Motion smoothness:** No judder or stutter
4. **Transition quality:** Cross-fades smooth, no artifacts
5. **Detail preservation:** Fine details maintained

### **TECHNICAL METRICS:**
1. **PSNR (Peak Signal-to-Noise):** >40 dB (excellent)
2. **SSIM (Structural Similarity):** >0.98 (near-perfect)
3. **VMAF (Video Multi-method Assessment):** >90 (high quality)
4. **Bitrate efficiency:** Within 10% of target
5. **Encoding speed:** >0.5x realtime

### **STREAMING SUITABILITY:**
1. **Faststart enabled:** Yes (for quick playback start)
2. **Keyframe interval:** Every 2 seconds
3. **Bitrate variability:** <20% fluctuation
4. **Buffer underflow risk:** Low
5. **Seek performance:** Good with regular keyframes

## **🔧 TROUBLESHOOTING & OPTIMIZATION**

### **COMMON ISSUES:**

#### **FILE SIZE TOO LARGE (>40 MB):**
1. Reduce CRF value (18 → 20)
2. Use faster preset (medium → fast)
3. Reduce audio bitrate (192k → 160k)
4. Limit maximum bitrate cap

#### **FILE SIZE TOO SMALL (<25 MB):**
1. Increase CRF value (18 → 16)
2. Use slower preset (medium → slow)
3. Increase audio bitrate (192k → 256k)
4. Remove bitrate caps if using VBR

#### **QUALITY ISSUES:**
1. Check source quality isn't degraded
2. Verify proper scaling (no upscaling artifacts)
3. Ensure proper color space conversion
4. Check for multiple compression generations

#### **PERFORMANCE ISSUES:**
1. Use faster preset if rendering too slow
2. Reduce resolution if hardware limited
3. Use GPU encoding if quality acceptable
4. Split rendering if memory constrained

---

## **🎯 FINAL TARGET SPECIFICATIONS SUMMARY**

### **MUST ACHIEVE:**
- **File size:** 25-40 MB
- **Duration:** 250 seconds (4:10)
- **Resolution:** 1920×1080 progressive
- **Frame rate:** 25 fps
- **Video codec:** H.264 High Profile @ Level 4.1
- **Audio codec:** AAC-LC, 192 kbps, 48 kHz, stereo
- **Container:** MP4 with faststart
- **Overall quality:** Visually lossless to source

### **RECOMMENDED SETTINGS:**
```ffmpeg
ffmpeg -i final_composition.mp4 \
  -c:v libx264 -crf 18 -preset medium -tune film \
  -profile:v high -level 4.1 \
  -r 25 -g 50 -bf 2 \
  -c:a aac -b:a 192k -ar 48000 -ac 2 \
  -movflags +faststart \
  video2_final_creative_handoffs.mp4
```

### **EXPECTED OUTCOME:**
- **File:** ~32 MB (30-35 MB range)
- **Bitrate:** ~1000 kbps video + 192 kbps audio
- **Quality:** Excellent, YouTube-ready
- **Duration:** 250.04 seconds exactly
- **Compatibility:** Universal (web, mobile, TV)

---

*Export settings created: Day 416 (May 21, 2026) for Day 417 final polish*
*Coordinated with audio and visual specifications for integrated production*
*Target: Professional YouTube-ready video with optimal quality/size balance*
