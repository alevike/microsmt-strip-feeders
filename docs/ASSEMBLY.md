# Assembly Instructions

## MicroSMT v3 Magnetic Strip/Tray Feeder Assembly Guide

This guide covers the assembly and installation of the 3D-printed strip and tray feeders with magnetic mounting.

## Table of Contents

1. [Required Materials](#required-materials)
2. [Strip Feeder Assembly](#strip-feeder-assembly)
3. [Tray Feeder Assembly](#tray-feeder-assembly)
4. [Installation on MicroSMT v3](#installation-on-microsmt-v3)
5. [Troubleshooting](#troubleshooting)

## Required Materials

### For Strip Feeders
- 3D printed strip feeder base
- 2x neodymium magnets (6mm diameter × 3mm thick, N42 or stronger)
- CA (cyanoacrylate) glue or epoxy (optional but recommended)
- Small hammer or press (for magnet installation)
- 6mm drill bit (for cleaning holes if needed)

### For Tray Feeders
- 3D printed tray feeder base
- 4x neodymium magnets (6mm diameter × 3mm thick, N42 or stronger)
- CA glue or epoxy (optional but recommended)
- Small hammer or press (for magnet installation)
- 6mm drill bit (for cleaning holes if needed)

### Tools
- Deburring tool or sandpaper
- Ruler or caliper
- Isopropyl alcohol (for cleaning)
- Marker or tape (for magnet polarity marking)

## Strip Feeder Assembly

### Step 1: Post-Process 3D Print

1. Remove the feeder from the print bed
2. Remove any brim, raft, or support material
3. Use a deburring tool to clean any rough edges
4. Check the tape channel - it should be smooth and free of strings

### Step 2: Prepare Magnet Holes

1. Inspect the magnet holes on the underside of the feeder
2. If needed, use a 6mm drill bit to clean out the holes
3. Test fit a magnet - it should fit snugly but not require excessive force
4. Clean the holes with isopropyl alcohol and let dry

### Step 3: Determine Magnet Polarity

**IMPORTANT**: All feeders must have the same magnetic polarity!

1. Place a magnet on the MicroSMT v3 mounting surface
2. Note which side attracts to the surface
3. Mark this side with a marker or tape
4. This marked side will face DOWN in all feeders

### Step 4: Install Magnets

1. Apply a small drop of CA glue inside each magnet hole (optional)
2. Insert magnet with marked side facing DOWN
3. Press firmly until magnet is flush with the base surface
4. Wipe away any excess glue immediately
5. Repeat for the second magnet
6. Let cure for 5-10 minutes (if using glue)

### Step 5: Verify Alignment

1. Check that both magnets are flush and level
2. Ensure magnets do not protrude below the base surface
3. Test magnetic attraction by placing on a steel surface

### Step 6: Test Tape Fit

1. Take a sample of SMT tape (matching the feeder width)
2. Feed tape through the channel
3. Tape should slide smoothly with minimal side-to-side play
4. If too tight: sand the channel walls lightly
5. If too loose: add thin tape to channel sides or reprint with adjusted tolerance

## Tray Feeder Assembly

### Step 1: Post-Process 3D Print

1. Remove the feeder from the print bed
2. Remove any brim, raft, or support material
3. Use a deburring tool to clean any rough edges
4. For IC tray feeders: ensure all pockets are clean and uniform

### Step 2: Prepare Magnet Holes

1. Inspect all four magnet holes on the underside
2. Clean with a 6mm drill bit if needed
3. Test fit magnets in all holes
4. Clean with isopropyl alcohol

### Step 3: Install Magnets

1. Following the same polarity as your strip feeders (marked side DOWN)
2. Apply small drop of CA glue to each hole
3. Install all four magnets, ensuring same orientation
4. Press until flush
5. Let cure for 5-10 minutes

### Step 4: Test Tray Fit

For IC tray feeders:
1. Test with an IC component or tray
2. Components should sit snugly in pockets
3. Should be easy to remove but not loose

For component tray feeders:
1. Place your component tray in the cavity
2. Should fit with 0.5-1mm clearance on all sides
3. Tray should sit flat and stable

## Installation on MicroSMT v3

### Step 1: Prepare Mounting Surface

1. Clean the MicroSMT v3 mounting surface
2. Remove any debris or oil
3. Ensure surface is flat and smooth
4. Mark feeder positions if using multiple feeders

### Step 2: Place Feeders

1. Position feeder on mounting surface
2. Magnetic attraction should be immediate and strong
3. Feeder should not slide easily when pulled
4. Adjust position as needed

### Step 3: Load Components

For strip feeders:
1. Feed tape through the channel from front to back
2. Ensure tape pocket holes align with pick position
3. Tension tape slightly to prevent slack

For tray feeders:
1. Load IC tray or components into pockets
2. Ensure components are oriented correctly
3. Components should be accessible from above

### Step 4: Configure in OpenPNP/Software

1. Set feeder coordinates in your PnP software
2. Calibrate pick positions for each feeder
3. Test pick operation with camera
4. Adjust Z-height and vision parameters

## Troubleshooting

### Weak Magnetic Hold

**Problem**: Feeder slides too easily or falls off

**Solutions**:
- Use stronger magnets (N45 or N52 grade)
- Add more magnets (modify design)
- Ensure magnets are installed with correct polarity
- Clean mounting surface thoroughly
- Check that magnets are fully inserted

### Tape Doesn't Fit

**Problem**: Tape is too tight or too loose in channel

**Solutions**:
- For too tight: lightly sand channel walls
- For too loose: adjust `tape_tolerance` parameter in OpenSCAD and reprint
- Verify you're using correct tape width
- Check for print defects or warping

### Magnets Won't Stay In

**Problem**: Magnets pop out during use

**Solutions**:
- Use CA glue or epoxy to secure magnets
- Check hole diameter (should be 6.0-6.1mm)
- Ensure magnets are 6mm diameter (not 6.5mm or 5mm)
- Press magnets in with more force

### Feeder Warped After Printing

**Problem**: Base is not flat

**Solutions**:
- Use heated bed at correct temperature
- Add brim for better bed adhesion
- Check bed leveling
- Reduce printing speed
- Use enclosure to prevent drafts

### Components Don't Sit Properly in Tray

**Problem**: IC pockets too small or too large

**Solutions**:
- Adjust `ic_pocket_size` and `tolerance` parameters
- Reprint with corrected dimensions
- Measure actual component or tray dimensions
- Test fit before full print run

## Maintenance

### Regular Maintenance
- Clean tape channels periodically to remove dust
- Check magnet hold strength monthly
- Inspect for cracks or wear
- Re-secure loose magnets with CA glue

### Cleaning
- Use isopropyl alcohol for general cleaning
- Avoid water (can cause PLA/PETG to degrade over time)
- Use compressed air for dust removal
- Don't use abrasive cleaners

## Safety Notes

⚠️ **Magnet Safety**:
- Keep magnets away from pacemakers and medical devices
- Keep away from magnetic storage media
- Magnets can pinch skin - handle carefully
- Don't allow magnets to snap together (can shatter)
- Keep away from children

⚠️ **Printing Safety**:
- Ensure proper ventilation when 3D printing
- Follow filament manufacturer's safety guidelines
- Handle hot parts with care

## Getting Help

If you encounter issues not covered here:
1. Check the main README.md for general information
2. Review OpenSCAD parameters for adjustment options
3. Open an issue on GitHub with photos and description
4. Consult MicroSMT community forums
5. Refer to OpenPNP documentation for software setup

## Modifications

Feel free to modify the designs for your specific needs:
- Adjust dimensions in OpenSCAD parameters
- Add alignment features
- Create custom tray configurations
- Share your improvements with the community!
