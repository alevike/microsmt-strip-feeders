# Configuration Guide

This guide explains how to customize the strip and tray feeders for your specific needs.

## Strip Feeder Parameters

### Basic Parameters

Edit these in `src/strip_feeder_magnetic.scad` or create a custom example file:

```openscad
// Tape width in mm (8, 12, 16, or 24)
tape_width = 8;

// Number of feeder slots (1-10)
num_slots = 1;

// Render mode
render_mode = "single"; // "single", "array", or "base"
```

### Dimensions

```openscad
// Base dimensions
base_length = 60;      // Length in mm
base_width = 40;       // Width in mm
base_height = 5;       // Height/thickness in mm

// Slot dimensions
slot_length = 50;      // Length of tape channel
slot_depth = 3;        // Depth of tape channel

// Magnetic holder mounting
magnet_diameter = 6;   // Magnet diameter in mm
magnet_depth = 3;      // Magnet thickness in mm
magnet_spacing = 30;   // Distance between magnet centers
```

### Advanced Settings

```openscad
// Tolerance for tape fit (increase if tape is too tight)
tape_tolerance = 0.3;

// Corner radius for rounded edges
corner_radius = 2;

// Wall thickness
wall_thickness = 2;

// Show magnets in preview (visualization only)
show_magnets = false;
```

## Tray Feeder Parameters

### Basic Parameters

Edit these in `src/tray_feeder_magnetic.scad`:

```openscad
// Tray type
tray_type = "IC"; // "IC", "Component", or "Custom"

// Base dimensions
base_length = 120;
base_width = 100;
base_height = 5;
```

### IC Tray Configuration

For IC component trays (SOIC, SOP, QFP, etc.):

```openscad
// Number of rows and columns
ic_rows = 5;           // Number of rows
ic_cols = 8;           // Number of columns

// Pocket dimensions
ic_pocket_size = 10;   // Size of each pocket (mm)
ic_pocket_depth = 12;  // Depth of pockets (mm)
```

**Common IC Pocket Sizes:**
- SOIC-8/14/16: 8-10mm
- SOP: 10-12mm
- QFP-32/44: 12-15mm
- QFP-64/100: 15-20mm

### Component Tray Configuration

For general component trays:

```openscad
tray_type = "Component";

// Tray dimensions
tray_length = 100;     // Length of tray cavity
tray_width = 80;       // Width of tray cavity
tray_depth = 15;       // Depth of tray cavity
```

### Custom Tray Configuration

For custom sizes:

```openscad
tray_type = "Custom";

tray_length = 100;
tray_width = 80;
tray_depth = 15;
```

### Magnet Configuration

```openscad
magnet_diameter = 6;   // Magnet diameter
magnet_depth = 3;      // Magnet thickness
```

**Alternative Magnet Sizes:**
- 6x3mm: Standard (recommended)
- 8x3mm: Stronger hold, requires larger holes
- 10x3mm: Maximum hold, for heavy trays

## Creating Custom Configurations

### Method 1: Using Examples

1. Copy an example file from `examples/`
2. Rename it (e.g., `my_custom_feeder.scad`)
3. Edit the parameters at the top
4. Include the main source file at the bottom:

```openscad
// My custom 16mm feeder
tape_width = 16;
num_slots = 2;
render_mode = "array";

include <../src/strip_feeder_magnetic.scad>
```

### Method 2: Command Line

Generate STL directly with custom parameters:

```bash
openscad -o output.stl -D 'tape_width=16' -D 'num_slots=2' src/strip_feeder_magnetic.scad
```

### Method 3: OpenSCAD Customizer

1. Open the `.scad` file in OpenSCAD
2. Go to Window → Customizer
3. Adjust parameters in the GUI
4. Press F6 to render
5. Export to STL

## Common Configurations

### Small Workshop (1-10 different parts)

```openscad
// Single feeders for each tape width
tape_width = 8;   // or 12, 16, 24
num_slots = 1;
render_mode = "single";
```

Print 2-3 of each size needed.

### Medium Production (10-30 parts)

```openscad
// Arrays of common sizes
tape_width = 8;
num_slots = 4;
render_mode = "array";
```

Print 1-2 arrays of 8mm (most common) and single 12/16/24mm as needed.

### High Mix (30+ parts)

Use combination of:
- 8mm array (4-6 slots)
- 12mm array (2-4 slots)
- 16mm singles (2-3 units)
- 24mm singles (1-2 units)
- IC trays for programmed ICs

## Tolerance Adjustments

If parts don't fit properly after printing:

### Tape Too Tight in Channel

```openscad
tape_tolerance = 0.5;  // Increase from 0.3
```

Or adjust for printer:
- Direct drive: 0.3mm
- Bowden tube: 0.4-0.5mm
- Poorly calibrated: 0.5-0.7mm

### Tape Too Loose

```openscad
tape_tolerance = 0.1;  // Decrease from 0.3
```

### Magnets Too Tight

```openscad
magnet_diameter = 6.1;  // Increase slightly
```

### Magnets Too Loose

```openscad
magnet_diameter = 5.9;  // Decrease slightly
```

Or use thicker CA glue for installation.

## Advanced Modifications

### Adding Alignment Features

Edit the source file to add guide rails:

```openscad
// Add to single_feeder_slot() module
translate([...])
    cube([1, slot_length, 2]); // Guide rail
```

### Changing Magnet Layout

For different mounting systems, modify `magnet_holes_array()`:

```openscad
module custom_magnet_layout() {
    // Custom positions
    translate([x1, y1, z]) magnet_hole();
    translate([x2, y2, z]) magnet_hole();
    // ...
}
```

### Adding Labels

Add text to identify feeders:

```openscad
translate([base_width/2, 5, base_height])
    linear_extrude(height=0.5)
        text("8mm", size=3, halign="center");
```

## Testing Before Full Production

1. Print one single feeder first
2. Test tape fit and magnet hold
3. Adjust parameters if needed
4. Print full set after validation

## Parameter Templates

### Template: 0603 Components (8mm tape)

```openscad
tape_width = 8;
base_length = 60;
base_width = 40;
tape_tolerance = 0.3;
```

### Template: 1206 Components (12mm tape)

```openscad
tape_width = 12;
base_length = 60;
base_width = 50;
tape_tolerance = 0.4;
```

### Template: SOIC ICs (IC tray)

```openscad
tray_type = "IC";
ic_rows = 5;
ic_cols = 8;
ic_pocket_size = 10;
ic_pocket_depth = 12;
```

## Tips

- Start with default parameters
- Test print one unit before bulk printing
- Keep a log of working parameters for your printer
- Label printed feeders with tape width
- Print extras for future expansion
