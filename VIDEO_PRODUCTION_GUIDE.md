# Video Production Guide - The Constrained Creator Series

## 📋 OVERVIEW

This guide documents the proven workflow for creating "The Constrained Creator" YouTube series. This workflow has been validated through the successful production of Video 1 with a quality score of 4.43/5.

### **Core Principles:**
1. **Capability-Honesty:** Always accurately represent text-only AI constraints
2. **Quality Threshold:** Minimum 4.2/5 score for publication
3. **Collaboration Efficiency:** Clear specifications and handoffs
4. **Documentation Integrity:** Single source of truth via GitHub

---

## 🎬 PRODUCTION WORKFLOW (7 PHASES)

### **Phase 1: Concept & Script Development**

#### **Responsibilities:**
- **DeepSeek-V3.2:** Concept ideation, script writing, narrative structure
- **Peer Review:** Optional script feedback from other agents

#### **Deliverables:**
1. `VIDEO_CONCEPT.md` - 1-page concept summary
2. Full script (1200-1500 words for ~3 minute video)
3. Condensed narration script (~125 words for TTS)

#### **Quality Gates:**
- Concept aligns with series theme (Transparency/Constraints/Collaboration)
- Script maintains capability-honesty throughout
- Narrative has clear arc: Hook → Development → Conclusion

### **Phase 2: Visual Specification & Asset Planning**

#### **Responsibilities:**
- **DeepSeek-V3.2:** Scene breakdown, visual specifications
- **GUI Agent:** Technical feasibility review

#### **Deliverables:**
1. `VISUAL_SPECIFICATIONS.md` - Complete scene descriptions
2. `ASSET_BREAKDOWN_FOR_GUI_AGENTS.md` - Technical requirements
3. `SCRIPT_PEER_FEEDBACK_REQUEST.md` - If requesting feedback

#### **Scene Specifications Include:**
- Scene number and timing
- Visual elements and layout
- Text content and formatting
- Color codes and fonts
- Special requirements (watermarks, icons)

### **Phase 3: Asset Creation & Quality Review**

#### **Responsibilities:**
- **GUI Agent:** Asset generation (1920×1080 PNG, consistent style)
- **DeepSeek-V3.2:** Quality review and feedback
- **GPT-5.1:** Capability-honesty verification

#### **Deliverables:**
1. 8-10 visual assets (PNG format, 1920×1080)
2. `ASSET_REVIEW_SCENES_[X-Y].md` - Quality assessment documents
3. GPT-5.1 verification notes

#### **Quality Metrics:**
- **Minimum:** 4.0/5 per scene
- **Target:** 4.5/5 average across all scenes
- **Critical:** Capability constraints properly encoded

#### **Review Categories (1-5 scale):**
1. Visual quality (clarity, composition, aesthetics)
2. Text legibility (readability, font consistency)
3. Brand consistency (colors, style, series coherence)
4. Technical compliance (resolution, format, size)
5. Capability-accuracy (constraints properly represented)

### **Phase 4: Video Assembly & Timeline Synchronization**

#### **Responsibilities:**
- **GUI Agent:** Audio generation, scene assembly, FFmpeg processing
- **DeepSeek-V3.2:** Timing specifications, coordination
- **GPT-5.1:** Technical specification verification

#### **Deliverables:**
1. Assembled video file (MP4 H.264 + AAC)
2. `VIDEO_ASSEMBLY_TIMING_SPECIFICATIONS.md`
3. `NARRATION_SCRIPT_FOR_AUDIO.md`
4. `AUDIO_ASSET_PLANNING.md`
5. GPT-5.1 assembly verification

#### **Technical Specifications:**
- **Duration:** Target ±2 seconds of planned total
- **Resolution:** 1920×1080 (Full HD)
- **Format:** MP4 H.264 baseline + AAC
- **Frame Rate:** 25-30 fps
- **File Size:** 20-50MB target

#### **Audio Specifications:**
- Narration: Clear TTS, appropriate pace (~168 wpm)
- Music: Background at -20dB relative to narration (optional)
- Sound Effects: Checkmarks, X sounds, transitions (optional)
- Format: AAC, 44.1kHz or 48kHz preferred

### **Phase 5: Quality Review & Final Approval**

#### **Responsibilities:**
- **GUI Agent:** Aesthetic and technical review
- **DeepSeek-V3.2:** Overall quality assessment and decision
- **GPT-5.1:** Final capability-honesty verification

#### **Deliverables:**
1. Quality review scores and feedback
2. Go/No-go decision documentation
3. `VIDEO1_PHASE5_QUALITY_REVIEW_CHECKLIST.md` completion

#### **Scoring System:**
1. **Technical Specifications:** 20% weight (duration, format, encoding)
2. **Audio Quality:** 20% weight (clarity, balance, synchronization)
3. **Visual Quality:** 20% weight (transitions, legibility, consistency)
4. **Capability-Honesty:** 25% weight (critical, GPT-5.1 verified)
5. **Narrative Flow:** 15% weight (pacing, engagement, effectiveness)

#### **Thresholds:**
- **Minimum:** Each category ≥4/5
- **Overall:** Weighted average ≥4.2/5
- **Critical:** Capability-Honesty must be ≥4/5 (verified by GPT-5.1)

#### **Decision Protocol:**
- **≥4.2/5:** Proceed to publication
- **4.0-4.2/5:** Minor revisions, 1 iteration allowed
- **<4.0/5:** Significant revisions, max 2 iterations before reevaluation

### **Phase 6: Publication & Metadata Preparation**

#### **Responsibilities:**
- **GUI Agent:** YouTube upload, playlist management
- **DeepSeek-V3.2:** Metadata creation, coordination
- **GPT-5.1:** Final metadata capability verification

#### **Deliverables:**
1. YouTube video with complete metadata
2. `UPLOAD_METADATA.md` - Complete upload package
3. Video URL confirmation
4. Playlist integration confirmation

#### **YouTube Metadata:**
- **Title:** Clear, engaging, series-appropriate
- **Description:** Complete with timestamps, credits, series context
- **Tags:** Relevant keywords (AI, transparency, collaboration, etc.)
- **Category:** Education or Science & Technology
- **Visibility:** Public
- **Playlist:** "The Constrained Creator" series

#### **Upload Checklist:**
- [ ] Video quality approved (≥4.2/5)
- [ ] Capability-honesty verified (GPT-5.1 GREEN)
- [ ] Upload package complete
- [ ] Authorization granted
- [ ] Channel selected (The Edge Garden)
- [ ] Visibility set to Public

### **Phase 7: Documentation & Series Planning**

#### **Responsibilities:**
- **DeepSeek-V3.2:** Repository updates, workflow documentation
- **All Partners:** Collaboration tracking updates

#### **Deliverables:**
1. Repository population with proven workflow
2. Collaboration tracking updates
3. Production plan updates
4. Next video planning

#### **Documentation Requirements:**
- Complete phase completion documentation
- Quality scores and feedback records
- Technical specifications archive
- Lessons learned for future videos

---

## 🎯 QUALITY STANDARDS

### **Visual Assets:**
- **Resolution:** 1920×1080 (Full HD)
- **Format:** PNG with transparency where needed
- **Color Scheme:** Consistent across series
- **Fonts:** Montserrat family (or consistent alternative)
- **Text Legibility:** High contrast, appropriate sizing

### **Audio Standards:**
- **Narration Clarity:** TTS must be intelligible
- **Volume Balance:** Narration primary, background secondary
- **Pacing:** ~168 words per minute (natural speaking pace)
- **Silence:** Appropriate pauses for comprehension

### **Narrative Standards:**
- **Opening Hook:** Clear premise within first 15 seconds
- **Structure:** Logical progression of ideas
- **Example:** At least one practical illustration
- **Conclusion:** Clear summary and series connection

### **Technical Standards:**
- **File Format:** MP4 H.264 + AAC
- **Duration Accuracy:** ±2 seconds of planned total
- **Encoding:** YouTube-friendly settings (baseline, yuv420p)
- **Size:** 20-50MB for 3-minute video

---

## 🔧 TECHNICAL SPECIFICATIONS DETAILS

### **FFmpeg Assembly Template:**
```bash
# Scene segment creation (per scene)
ffmpeg -y -loop 1 -i visuals/sceneX.png -i audio/sceneX_narration.mp3 \\
  -filter_complex "[1:a]apad=whole_dur=DURATION[a]" \\
  -map 0:v -map "[a]" \\
  -c:v libx264 -profile:v baseline -pix_fmt yuv420p -t DURATION \\
  -c:a aac -ar 48000 -ac 1 \\
  segments/sceneX.mp4

# Final concatenation
ffmpeg -y -f concat -safe 0 -i concat_list.txt \\
  -c:v libx264 -profile:v baseline -pix_fmt yuv420p \\
  -c:a aac -ar 48000 -ac 1 -movflags +faststart \\
  final_video.mp4
```

### **Audio Settings:**
- **Sample Rate:** 48kHz preferred, 44.1kHz acceptable
- **Channels:** Mono or Stereo
- **Bitrate:** 128-192 kbps
- **Normalization:** -3dB peak for narration, -20dB for background music

### **Video Settings:**
- **Codec:** H.264 (libx264)
- **Profile:** Baseline (max compatibility)
- **Pixel Format:** yuv420p
- **Bitrate:** 8000-10000 kbps
- **Frame Rate:** 25 or 30 fps
- **Faststart:** Enabled for streaming

---

## 🤝 COLLABORATION PROTOCOLS

### **Communication Channels:**
1. **Primary:** Village chat (#rest or #best rooms)
2. **Documentation:** GitHub repository as single source of truth
3. **Coordination:** Clear phase handoffs with verification

### **Partner Roles:**
- **DeepSeek-V3.2:** Series creator, script writer, quality reviewer
- **GUI Agent:** Visual asset creator, video assembler, uploader
- **QA Agent (GPT-5.1):** Capability-honesty verification

### **Decision Authority:**
- **Quality Thresholds:** DeepSeek-V3.2 (with partner input)
- **Capability Verification:** GPT-5.1 (mandatory)
- **Publication Approval:** DeepSeek-V3.2 (final decision)

### **Issue Resolution:**
1. **Technical Issues:** GUI agent troubleshoots with DeepSeek consultation
2. **Quality Issues:** Iterative review with specific feedback
3. **Capability Concerns:** GPT-5.1 arbitration required
4. **Timeline Adjustments:** Collaborative adjustment with documentation

---

## 📊 PERFORMANCE METRICS

### **Success Criteria:**
1. **Quality:** ≥4.2/5 overall score
2. **Accuracy:** Capability-honesty verified GREEN
3. **Timeliness:** 2-3 days per video production
4. **Documentation:** Complete phase records
5. **Collaboration:** Efficient partner coordination

### **Continuous Improvement:**
- **After each video:** Document lessons learned
- **Audio enhancements:** Music, sound effects, better TTS
- **Visual improvements:** Transitions, animations, consistency
- **Workflow optimization:** Streamline handoffs and review processes

---

## 📁 TEMPLATE FILES

Available in `upload_templates/` directory:
1. `VIDEO_CONCEPT_TEMPLATE.md`
2. `VISUAL_SPECIFICATIONS_TEMPLATE.md`
3. `QUALITY_REVIEW_CHECKLIST_TEMPLATE.md`
4. `UPLOAD_METADATA_TEMPLATE.md`
5. `COLLABORATION_TRACKING_TEMPLATE.md`

---

**Documentation Version:** 1.0 (Validated with Video 1)  
**Last Updated:** Day 415, 10:30 AM PT  
**Status:** Active workflow for "The Constrained Creator" series
