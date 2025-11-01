# Quick Start Guide

Get started with MicroSMT v3 Magnetic Strip Feeders in 5 minutes!

## What You Need

- [ ] OpenSCAD installed ([download here](https://openscad.org/downloads.html))
- [ ] 3D printer with PLA or PETG filament
- [ ] 6mm × 3mm neodymium magnets (2 per strip feeder, 4 per tray feeder)
- [ ] MicroSMT v3 compatible mounting surface

## Quick Start: 3 Steps

### Step 1: Choose Your Feeder (30 seconds)

Pick the configuration you need:

| Component Size | Tape Width | File to Use |
|---------------|------------|-------------|
| 0402, 0603, 0805 | 8mm | `examples/strip_8mm_single.scad` |
| 1206, SOT-23 | 12mm | Use 8mm file, change `tape_width = 12` |
| Larger SMD | 16mm | Use 8mm file, change `tape_width = 16` |
| Wide components | 24mm | Use 8mm file, change `tape_width = 24` |
| IC chips in trays | N/A | `examples/tray_ic.scad` |

**Most users start with:** `examples/strip_8mm_single.scad`

### Step 2: Generate STL (2 minutes)

#### Option A: Use Pre-Generated STLs (Fastest)

STL files are already in the `stl/` directory:
- `strip_8mm_single.stl` - Single 8mm feeder
- `strip_12mm_array.stl` - 4× 12mm array
- `strip_16mm_single.stl` - Single 16mm feeder
- `strip_24mm_single.stl` - Single 24mm feeder
- `tray_ic.stl` - IC tray feeder

**Skip to Step 3 if using these!**

#### Option B: Customize and Generate

1. Open the file in OpenSCAD
2. (Optional) Adjust parameters at the top
3. Press **F6** to render (takes 5-30 seconds)
4. **File → Export → Export as STL**
5. Save to `stl/my_feeder.stl`

#### Option C: Command Line (Advanced)

```bash
cd microsmt-strip-feeders
openscad -o stl/my_custom.stl examples/strip_8mm_single.scad
```

### Step 3: Print and Assemble (3 hours + 5 minutes)

1. **Print** the STL file:
   - Layer height: 0.2mm
   - Infill: 20-30%
   - No supports needed
   - Print time: ~1-3 hours depending on size

2. **Insert magnets**:
   - Press 2 magnets into holes on bottom (4 for tray feeders)
   - Ensure all magnets have same polarity
   - Optional: Add drop of CA glue to secure

3. **Test**:
   - Place on magnetic mounting surface
   - Should stick firmly
   - Load a tape strip and test fit

**Done!** Your feeder is ready to use.

## Common Use Cases

### "I need one 8mm feeder for testing"

```bash
# Use pre-generated STL
3D print: stl/strip_8mm_single.stl
Magnets needed: 2× 6mm × 3mm
Print time: ~1.5 hours
```

### "I need multiple feeders for production"

```bash
# Print an array
3D print: stl/strip_12mm_array.stl (4 feeders in one print)
Magnets needed: 8× 6mm × 3mm (2 per feeder)
Print time: ~3 hours
```

### "I need a custom size"

```bash
# Edit and generate
1. Copy examples/strip_8mm_single.scad to examples/my_feeder.scad
2. Change tape_width = 12 (or 16, 24)
3. openscad -o stl/my_feeder.stl examples/my_feeder.scad
4. Print stl/my_feeder.stl
```

### "I need IC trays"

```bash
# Use pre-generated IC tray
3D print: stl/tray_ic.stl
Magnets needed: 4× 6mm × 3mm
Print time: ~4 hours
```

## Troubleshooting (Quick Fixes)

| Problem | Quick Fix |
|---------|-----------|
| Tape too tight | Edit .scad file: `tape_tolerance = 0.5` (increase) |
| Tape too loose | Edit .scad file: `tape_tolerance = 0.1` (decrease) |
| Magnet won't fit | Drill out hole with 6mm drill bit |
| Magnet falls out | Add drop of CA glue before inserting |
| Weak magnetic hold | Use N45 or N52 grade magnets (stronger) |
| Print warped | Use brim, check bed leveling |

## Next Steps

- **Read full documentation**: [README.md](../README.md)
- **Customize further**: [CONFIGURATION.md](CONFIGURATION.md)
- **Assembly details**: [ASSEMBLY.md](ASSEMBLY.md)
- **Print more sizes**: Generate from examples/

## Shopping List

### For 5 Strip Feeders (typical starter set)

- [ ] 10× neodymium magnets 6mm × 3mm (N42 or better)
  - Cost: ~$5-10
  - Source: Amazon, eBay, AliExpress
  - Search: "neodymium magnet 6x3mm"

- [ ] PLA or PETG filament (~100g)
  - Cost: ~$2-3
  - Any color works

- [ ] CA glue (superglue) - optional
  - Cost: ~$2-3
  - For securing magnets

**Total cost: ~$10-15 for 5 feeders**

Compare to commercial feeders: $20-50 each!

## Pro Tips

1. **Print extras** - Always print 1-2 extra feeders for future use
2. **Label them** - Mark tape width on each feeder with permanent marker
3. **Test first** - Print one single feeder before printing arrays
4. **Magnet polarity** - Test first magnet on mounting surface, then ensure all others match
5. **Keep organized** - Store unused feeders in labeled bags by size

## Support

- **Issues?** Open an issue on GitHub
- **Questions?** Check [README.md](../README.md) or [CONFIGURATION.md](CONFIGURATION.md)
- **Community:** MicroSMT forums, OpenPNP Discord

---

**Estimated total time from zero to working feeder: ~4-5 hours** (mostly print time)

**Active work time: ~10 minutes**

Happy building! 🛠️
