# Bill of Materials (BOM)

Complete list of materials needed for MicroSMT v3 Magnetic Strip/Tray Feeders.

## Per Strip Feeder (Single Slot)

| Item | Quantity | Specification | Source | Est. Cost |
|------|----------|---------------|--------|-----------|
| Neodymium Magnet | 2 | 6mm dia. × 3mm thick, N42 or stronger | Amazon, eBay, AliExpress | $1-2 |
| 3D Printed Base | 1 | PLA or PETG, see print settings | Self-printed | $0.50-1 |
| CA Glue (optional) | ~0.1ml | Cyanoacrylate (superglue) | Hardware store | $0.10 |
| **Total per feeder** | - | - | - | **$1.60-3.10** |

## Per Tray Feeder

| Item | Quantity | Specification | Source | Est. Cost |
|------|----------|---------------|--------|-----------|
| Neodymium Magnet | 4 | 6mm dia. × 3mm thick, N42 or stronger | Amazon, eBay, AliExpress | $2-4 |
| 3D Printed Base | 1 | PLA or PETG, see print settings | Self-printed | $2-4 |
| CA Glue (optional) | ~0.2ml | Cyanoacrylate (superglue) | Hardware store | $0.20 |
| **Total per tray** | - | - | - | **$4.20-8.20** |

## Starter Kit (5 Strip Feeders + 1 Tray Feeder)

| Item | Quantity | Specification | Est. Cost |
|------|----------|---------------|-----------|
| Neodymium Magnets 6x3mm | 14+ | N42 grade minimum (buy 20 for spares) | $7-14 |
| PLA/PETG Filament | ~150g | Any color | $3-5 |
| CA Glue | 1 bottle | 2-3g bottle | $2-3 |
| **Total starter kit** | - | - | **$12-22** |

## Production Setup (20 Strip + 4 Tray Feeders)

| Item | Quantity | Specification | Est. Cost |
|------|----------|---------------|-----------|
| Neodymium Magnets 6x3mm | 56+ | N42 grade (buy 100 for spares) | $20-40 |
| PLA/PETG Filament | ~800g | Multiple colors for organization | $15-25 |
| CA Glue | 1-2 bottles | 5g bottles | $3-5 |
| **Total production** | - | - | **$38-70** |

## Detailed Component Specifications

### Neodymium Magnets

**Required Specifications:**
- **Diameter:** 6mm (±0.1mm)
- **Thickness:** 3mm (±0.1mm)
- **Grade:** N42 minimum (N45, N48, N52 are stronger but cost more)
- **Coating:** Ni-Cu-Ni (nickel plated) for corrosion resistance
- **Shape:** Disc/cylinder

**Alternative Sizes (requires modifying design):**
- 8mm × 3mm: Stronger hold, for heavy feeders
- 10mm × 3mm: Maximum strength, for large tray feeders

**Where to Buy:**
- Amazon: Search "neodymium magnet 6x3mm N42"
- eBay: Often cheaper in bulk
- AliExpress: Best prices, longer shipping
- K&J Magnetics: Premium quality, US-based
- Supermagnete.de: Europe

**Typical Prices:**
- Pack of 10: $3-6
- Pack of 50: $10-20
- Pack of 100: $15-30

### 3D Printing Filament

**Recommended Materials:**

1. **PLA** (Polylactic Acid)
   - Easiest to print
   - Sufficient strength for feeders
   - Cost: $15-25/kg
   - Best for: Beginners, room temperature use

2. **PETG** (Polyethylene Terephthalate Glycol)
   - Better durability
   - More temperature resistant
   - Cost: $20-30/kg
   - Best for: High-use environments

3. **ABS** (Not recommended)
   - Requires heated enclosure
   - Prone to warping
   - Fumes require ventilation

**Filament Consumption:**
- Single strip feeder (8mm): ~20g
- Array strip feeder (4×8mm): ~80g
- IC tray feeder: ~100g
- Base mounting plate: ~30g

**Color Recommendations:**
- Black: Professional look, hides dirt
- White/Light colors: Easy to label
- Bright colors: Easy to organize by size (e.g., red=8mm, blue=12mm)

### Adhesive (Optional but Recommended)

**CA Glue (Cyanoacrylate):**
- **Type:** Thin or medium viscosity
- **Brand:** Gorilla, Loctite, or generic
- **Size:** 2-5g bottle sufficient for 50+ feeders
- **Cost:** $2-5

**Alternative:**
- 2-part epoxy (longer cure time, very strong)
- Hot glue (not recommended - too weak)

### Tools Required (Not Included)

| Tool | Purpose | Cost | Priority |
|------|---------|------|----------|
| 3D Printer | Print feeder parts | $200-2000 | Essential |
| OpenSCAD | Edit/generate designs | Free | Essential |
| Drill + 6mm bit | Clean magnet holes | $20-50 | Recommended |
| Deburring tool | Clean 3D prints | $5-15 | Recommended |
| Calipers | Measure parts/tape | $10-30 | Recommended |
| Pliers/tweezers | Install magnets | $5-10 | Helpful |
| Isopropyl alcohol | Clean parts | $3-5 | Helpful |
| Sandpaper | Fine-tune fit | $2-5 | Helpful |

## Magnet Quantity Calculator

Use this table to determine how many magnets you need:

| Setup | Strip Feeders | Tray Feeders | Total Magnets | Buy This Many |
|-------|---------------|--------------|---------------|---------------|
| Small (testing) | 2 | 0 | 4 | 10 (pack) |
| Small | 5 | 1 | 14 | 20 (pack) |
| Medium | 10 | 2 | 28 | 50 (pack) |
| Large | 20 | 4 | 56 | 100 (pack) |
| Extra Large | 40 | 8 | 112 | 150 (pack) |

**Note:** Buy extra magnets for:
- Spares (magnets can break)
- Future expansion
- Testing/prototyping

## Cost Comparison

### DIY (This Project) vs Commercial

| Item | DIY Cost | Commercial Cost | Savings |
|------|----------|-----------------|---------|
| Single 8mm strip feeder | $1.60-3.10 | $20-50 | $17-48 |
| 4× feeder array | $6-12 | $80-200 | $68-194 |
| IC tray feeder | $4-8 | $30-80 | $22-76 |
| Full setup (20+4) | $38-70 | $500-1500 | $430-1462 |

**ROI:** Pays for itself after 2-3 feeders!

## Optional Upgrades

| Upgrade | Cost | Benefit |
|---------|------|---------|
| N52 magnets (stronger) | +$10-20 | Better hold, less sliding |
| PETG filament (stronger) | +$5-10 | Better durability |
| Colored filament set | +$15-30 | Easy organization |
| Steel mounting plate | $10-30 | Professional setup |
| Label maker | $15-30 | Professional labeling |

## Bulk Purchasing Recommendations

For best value, buy:
1. **100× magnets** ($15-30) - Costs only $0.15-30 each
2. **1kg filament spool** ($15-25) - Makes 30-50 feeders
3. **Economy CA glue** ($2-3) - Sufficient for all feeders

**Total bulk cost: $32-58** for materials to make 30-50 feeders

Compare to commercial: $600-2500 for same quantity!

## Vendor Recommendations

### Magnets
- **USA:** K&J Magnetics (kjmagnetics.com) - Premium quality
- **Europe:** Supermagnete (supermagnete.de) - Fast shipping
- **Worldwide:** AliExpress - Best prices (2-4 week shipping)

### Filament
- **Budget:** Inland (Micro Center), Overture
- **Quality:** Prusament, eSun, Hatchbox
- **Professional:** Polymaker, 3DXTech

### Tools
- **Amazon:** One-stop shop, fast shipping
- **Harbor Freight:** Budget tools
- **Home Depot/Lowe's:** General hardware

## Environmental Notes

- **PLA:** Biodegradable, made from corn starch
- **PETG:** Recyclable
- **Magnets:** Recyclable, but keep for reuse
- **Packaging:** Minimize waste by buying in bulk

## Updates and Changes

This BOM is for version 1.0 of the design. Check the repository for updates if parameters change in future versions.

---

**Last Updated:** 2025-11-01
**Version:** 1.0
