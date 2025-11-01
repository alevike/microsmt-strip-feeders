// Strip Feeder with Magnetic Holders for MicroSMT v3
// Based on the MicroSMT v3 magnetic slot design
// Supports 8mm, 12mm, 16mm, and 24mm tape widths

/* [Main Parameters] */
// Tape width in mm (8, 12, 16, or 24)
tape_width = 8; // [8:4:24]

// Number of feeder slots
num_slots = 1; // [1:1:10]

// Render mode
render_mode = "single"; // [single:Single Slot, array:Array of Slots, base:Base Only]

/* [Dimensions] */
// Base dimensions
base_length = 60;
base_width = 40;
base_height = 5;

// Slot dimensions (adjusted based on tape width)
slot_length = 50;
slot_depth = 3;

// Magnetic holder mounting
magnet_diameter = 6;
magnet_depth = 3;
magnet_spacing = 30; // Distance between magnet centers

// Wall thickness
wall_thickness = 2;

/* [Advanced Settings] */
// Tolerance for tape fit
tape_tolerance = 0.3;

// Corner radius for rounded edges
corner_radius = 2;

// Show magnets (for visualization)
show_magnets = false;

/* [Hidden] */
$fn = 64;

// Calculate slot width based on tape width with tolerance
slot_width = tape_width + tape_tolerance;

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

module magnet_hole() {
    cylinder(d=magnet_diameter, h=magnet_depth + 0.1);
}

module magnet_holes_array() {
    // Front magnet
    translate([base_width/2 - magnet_spacing/2, base_length/2, base_height - magnet_depth])
        magnet_hole();
    // Rear magnet
    translate([base_width/2 + magnet_spacing/2, base_length/2, base_height - magnet_depth])
        magnet_hole();
}

module tape_channel() {
    // Main tape channel
    translate([base_width/2 - slot_width/2, (base_length - slot_length)/2, base_height - slot_depth])
        cube([slot_width, slot_length, slot_depth + 0.1]);
    
    // Entry and exit chamfers
    translate([base_width/2 - slot_width/2 - 1, (base_length - slot_length)/2 - 5, base_height - slot_depth])
        cube([slot_width + 2, 5, slot_depth + 0.1]);
    translate([base_width/2 - slot_width/2 - 1, (base_length - slot_length)/2 + slot_length, base_height - slot_depth])
        cube([slot_width + 2, 5, slot_depth + 0.1]);
}

module single_feeder_slot() {
    difference() {
        // Main base
        rounded_cube([base_width, base_length, base_height], corner_radius);
        
        // Tape channel
        tape_channel();
        
        // Magnet holes
        magnet_holes_array();
    }
    
    // Visual magnets (for reference)
    if (show_magnets) {
        color("silver", 0.8) {
            translate([base_width/2 - magnet_spacing/2, base_length/2, base_height - magnet_depth])
                cylinder(d=magnet_diameter, h=magnet_depth);
            translate([base_width/2 + magnet_spacing/2, base_length/2, base_height - magnet_depth])
                cylinder(d=magnet_diameter, h=magnet_depth);
        }
    }
}

module feeder_array() {
    for (i = [0:num_slots-1]) {
        translate([i * (base_width + 2), 0, 0])
            single_feeder_slot();
    }
}

module base_plate() {
    // Base mounting plate for multiple feeders
    plate_width = num_slots * (base_width + 2) + 10;
    plate_length = base_length + 10;
    plate_height = 3;
    
    difference() {
        rounded_cube([plate_width, plate_length, plate_height], corner_radius);
        
        // Mounting holes at corners
        for (x = [10, plate_width - 10]) {
            for (y = [10, plate_length - 10]) {
                translate([x, y, -0.1])
                    cylinder(d=3.5, h=plate_height + 0.2);
            }
        }
    }
}

// Main render logic
if (render_mode == "single") {
    single_feeder_slot();
} else if (render_mode == "array") {
    feeder_array();
} else if (render_mode == "base") {
    base_plate();
}

// Information
echo(str("Strip Feeder Configuration:"));
echo(str("  Tape Width: ", tape_width, "mm"));
echo(str("  Slot Width: ", slot_width, "mm"));
echo(str("  Number of Slots: ", num_slots));
echo(str("  Magnet Diameter: ", magnet_diameter, "mm"));
echo(str("  Magnet Depth: ", magnet_depth, "mm"));
