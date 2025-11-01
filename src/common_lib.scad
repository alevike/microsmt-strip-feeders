// Common library for MicroSMT v3 Magnetic Feeders
// Shared modules and functions

/* [Hidden] */
$fn = 64;

// Standard magnet sizes (diameter x depth in mm)
// Common neodymium magnet sizes
MAGNET_6x3 = [6, 3];   // Default size
MAGNET_8x3 = [8, 3];
MAGNET_10x3 = [10, 3];

// Standard tape widths
TAPE_8MM = 8;
TAPE_12MM = 12;
TAPE_16MM = 16;
TAPE_24MM = 24;

// MicroSMT v3 standard spacing
MICROSMT_MAGNET_SPACING = 30; // Standard spacing between magnet centers

/**
 * Creates a rounded cube with specified corner radius
 * @param size - [width, length, height] dimensions
 * @param radius - corner radius
 */
module rounded_cube(size, radius) {
    hull() {
        translate([radius, radius, 0])
            cylinder(r=radius, h=size[2]);
        translate([size[0]-radius, radius, 0])
            cylinder(r=radius, h=size[2]);
        translate([radius, size[1]-radius, 0])
            cylinder(r=radius, h=size[2]);
        translate([size[0]-radius, size[1]-radius, 0])
            cylinder(r=radius, h=size[2]);
    }
}

/**
 * Creates a magnet mounting hole
 * @param diameter - magnet diameter
 * @param depth - magnet depth
 */
module magnet_hole(diameter, depth) {
    cylinder(d=diameter, h=depth + 0.1);
}

/**
 * Creates a standard countersunk mounting hole
 * @param screw_diameter - diameter of screw shaft
 * @param head_diameter - diameter of screw head
 * @param depth - total depth of hole
 */
module mounting_hole(screw_diameter=3, head_diameter=6, depth=10) {
    union() {
        // Shaft
        cylinder(d=screw_diameter, h=depth);
        // Countersink
        translate([0, 0, depth/2])
            cylinder(d1=screw_diameter, d2=head_diameter, h=depth/2 + 0.1);
    }
}

/**
 * Creates text label (for identification)
 * @param text - text to display
 * @param size - text size
 * @param depth - extrusion depth
 */
module label_text(text, size=4, depth=0.5) {
    linear_extrude(height=depth)
        text(text, size=size, halign="center", valign="center", font="Liberation Sans:style=Bold");
}

/**
 * Adds chamfer to an edge
 * @param length - length of edge
 * @param size - chamfer size
 */
module chamfer(length, size) {
    rotate([0, 90, 0])
        linear_extrude(height=length)
            polygon([[0, 0], [size, 0], [0, size]]);
}

/**
 * Creates a guide rail for tape alignment
 * @param length - rail length
 * @param height - rail height
 * @param width - rail width
 */
module guide_rail(length, height=2, width=1) {
    cube([width, length, height]);
}

/**
 * Standard 2-point magnetic mounting for strip feeders
 * @param spacing - distance between magnet centers
 * @param magnet_spec - [diameter, depth] of magnets
 * @param base_width - width of base for centering
 * @param base_length - length of base for centering
 * @param base_height - height of base for positioning
 */
module standard_2point_magnets(spacing, magnet_spec, base_width, base_length, base_height) {
    magnet_d = magnet_spec[0];
    magnet_h = magnet_spec[1];
    
    // Front magnet
    translate([base_width/2 - spacing/2, base_length/2, base_height - magnet_h])
        magnet_hole(magnet_d, magnet_h);
    
    // Rear magnet
    translate([base_width/2 + spacing/2, base_length/2, base_height - magnet_h])
        magnet_hole(magnet_d, magnet_h);
}

/**
 * Standard 4-point magnetic mounting for tray feeders
 * @param magnet_spec - [diameter, depth] of magnets
 * @param base_width - width of base
 * @param base_length - length of base
 * @param base_height - height of base
 * @param inset - distance from edges
 */
module standard_4point_magnets(magnet_spec, base_width, base_length, base_height, inset=10) {
    magnet_d = magnet_spec[0];
    magnet_h = magnet_spec[1];
    
    positions = [
        [inset, inset],
        [base_width - inset, inset],
        [inset, base_length - inset],
        [base_width - inset, base_length - inset]
    ];
    
    for (pos = positions) {
        translate([pos[0], pos[1], base_height - magnet_h])
            magnet_hole(magnet_d, magnet_h);
    }
}

/**
 * Helper function to validate tape width
 */
function is_valid_tape_width(width) = 
    width == 8 || width == 12 || width == 16 || width == 24;

/**
 * Calculate slot width from tape width with tolerance
 */
function calc_slot_width(tape_width, tolerance=0.3) = 
    tape_width + tolerance;

// Module export information
echo("=================================");
echo("MicroSMT v3 Magnetic Feeder Library");
echo("Version 1.0");
echo("=================================");
