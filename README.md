# MicroSMT Strip Feeders with Magnetic Holders

A collection of 3D-printable strip and tray feeders designed for the MicroSMT v3 pick-and-place machine, featuring magnetic mounting for quick setup and changeover.

## Features

- **Magnetic Mounting System**: Compatible with MicroSMT v3 magnetic holder system for easy installation and removal
- **Parametric Design**: Fully customizable OpenSCAD files for different tape widths and configurations
- **Multiple Tape Widths**: Support for 8mm, 12mm, 16mm, and 24mm SMT tape
- **Array Support**: Create single or multiple feeder slots in one print
- **Tray Feeders**: Dedicated designs for IC trays and component trays
- **Professional Quality**: Based on official MicroSMT v3 specifications

## Supported Tape Widths

- 8mm (0402, 0603, 0805 components)
- 12mm (1206, SOT-23 components)
- 16mm (larger SMD components)
- 24mm (wide components)

## Getting Started

### Quick Links

- **🚀 [Quick Start Guide](docs/QUICK_START.md)** - Get up and running in 5 minutes
- **📋 [Bill of Materials](docs/BOM.md)** - Complete parts list and costs
- **🔧 [Assembly Instructions](docs/ASSEMBLY.md)** - Detailed assembly guide
- **⚙️ [Configuration Guide](docs/CONFIGURATION.md)** - Customize your feeders

### Prerequisites

- OpenSCAD (version 2021.01 or later)
- 3D printer with minimum build volume of 100x100x20mm
- 6x3mm neodymium magnets (for magnetic mounting)
- MicroSMT v3 compatible mounting surface

### File Structure

```
microsmt-strip-feeders/
├── src/
│   ├── strip_feeder_magnetic.scad  # Main strip feeder design
│   ├── tray_feeder_magnetic.scad   # Tray feeder design
│   └── common_lib.scad             # Shared library functions
├── examples/
│   ├── strip_8mm_single.scad       # Single 8mm feeder
│   ├── strip_12mm_array.scad       # 4-slot 12mm array
│   └── tray_ic.scad                # IC tray feeder
├── stl/
│   └── (generated STL files)
└── docs/
    └── ASSEMBLY.md                 # Assembly instructions
```

## Usage

### 1. Strip Feeder

Open `src/strip_feeder_magnetic.scad` in OpenSCAD and customize:

```openscad
// Main parameters
tape_width = 8;        // 8, 12, 16, or 24mm
num_slots = 1;         // Number of feeder slots
render_mode = "single"; // "single", "array", or "base"
```

**Parameters:**
- `tape_width`: Select from 8, 12, 16, or 24mm
- `num_slots`: Number of feeders (1-10)
- `render_mode`: 
  - `"single"`: One feeder slot
  - `"array"`: Multiple slots side-by-side
  - `"base"`: Mounting base plate only

### 2. Tray Feeder

Open `src/tray_feeder_magnetic.scad` in OpenSCAD and customize:

```openscad
// Tray type
tray_type = "IC";      // "IC", "Component", or "Custom"

// For IC trays
ic_rows = 5;
ic_cols = 8;
ic_pocket_size = 10;
ic_pocket_depth = 12;
```

**Tray Types:**
- `"IC"`: Grid of pockets for IC components (SOIC, SOP, etc.)
- `"Component"`: Large cavity for component trays
- `"Custom"`: Customizable dimensions

### 3. Generating STL Files

1. Open the desired `.scad` file in OpenSCAD
2. Press F6 to render (may take 10-30 seconds)
3. Go to File → Export → Export as STL
4. Save to the `stl/` directory

## 3D Printing Guidelines

### Recommended Settings

- **Layer Height**: 0.2mm
- **Infill**: 20-30%
- **Perimeters**: 3-4 walls
- **Support**: Not required for most designs
- **Material**: PLA or PETG
- **Bed Adhesion**: Brim recommended for larger prints

### Post-Processing

1. Remove any brim or support material
2. Clean magnet holes with a 6mm drill bit if needed
3. Test fit magnets (should be snug but not forced)
4. Apply a small drop of superglue to secure magnets if desired

## Assembly

### Required Hardware per Strip Feeder

- 2x 6mm diameter × 3mm thick neodymium magnets (N42 or stronger)
- Optional: 4x M3×8mm screws for base mounting

### Required Hardware per Tray Feeder

- 4x 6mm diameter × 3mm thick neodymium magnets
- Optional: 4x M3×8mm screws for mounting

### Assembly Steps

1. **Insert Magnets**:
   - Press magnets into the holes on the underside of the feeder
   - Ensure polarity is correct (test with mounting surface first)
   - North pole should face down for attraction to steel surface
   - Secure with small drop of CA glue if needed

2. **Test Fit**:
   - Place feeder on MicroSMT v3 magnetic mounting surface
   - Verify strong magnetic hold
   - Feeder should not slide easily when tape is loaded

3. **Load Tape** (Strip Feeders):
   - Feed SMT tape through the channel
   - Tape should slide smoothly with minimal play
   - Adjust tolerance in OpenSCAD if fit is too tight/loose

## Design Philosophy

This design is based on the official MicroSMT v3 strip feeder specification with enhancements for:

- **Ease of Use**: Magnetic mounting eliminates need for screws during changeover
- **Flexibility**: Parametric design allows customization for specific needs
- **Cost-Effective**: 3D printable with minimal hardware requirements
- **Compatibility**: Follows MicroSMT v3 magnetic slot specifications

## Customization

All designs are fully parametric. Key parameters you can adjust:

### Strip Feeder
- Tape width and tolerance
- Number of slots
- Base dimensions
- Magnet size and spacing
- Corner radius

### Tray Feeder
- Tray dimensions
- Pocket size and spacing (IC trays)
- Number of rows and columns
- Base dimensions

Edit the parameter sections at the top of each `.scad` file or use OpenSCAD's Customizer panel.

## Contributing

Contributions are welcome! Please:
1. Fork the repository
2. Create a feature branch
3. Test your changes thoroughly
4. Submit a pull request with description

## License

This project is licensed under the GNU General Public License v3.0 - see the LICENSE file for details.

## Credits

- Based on MicroSMT v3 magnetic slot design by microsmt
- Compatible with the MicroSMT/OpenPNP ecosystem
- Design and OpenSCAD implementation by contributors

## References

- [MicroSMT Official Website](https://www.microsmt.com.cn)
- [MicroSMT GitHub Repository](https://github.com/microsmt/Microsmt-PNP-hardware)
- [OpenPNP Project](https://openpnp.org)

## Support

For issues, questions, or suggestions:
- Open an issue on GitHub
- Refer to the MicroSMT community forums
- Check the OpenPNP wiki for integration tips

## Version History

### v1.0 (Current)
- Initial release
- Strip feeder with magnetic mounting (8/12/16/24mm)
- Tray feeder with IC and component tray support
- Parametric OpenSCAD design
- Example configurations