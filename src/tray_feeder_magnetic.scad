// Tray Feeder with Magnetic Holders for MicroSMT v3
// Designed to hold IC trays and component trays
// Compatible with MicroSMT v3 magnetic mounting system

/* [Main Parameters] */
// Tray type
tray_type = "IC"; // [IC:IC Tray, Component:Component Tray, Custom:Custom Size]

// Tray dimensions (mm)
tray_length = 100;
tray_width = 80;
tray_depth = 15;

// Number of rows and columns for IC trays
ic_rows = 5;
ic_cols = 8;
ic_pocket_size = 10;
ic_pocket_depth = 12;

/* [Base Parameters] */
// Base dimensions
base_length = 120;
base_width = 100;
base_height = 5;

// Magnetic holder mounting
magnet_diameter = 6;
magnet_depth = 3;
magnet_spacing = 30; // Distance between magnet centers

/* [Advanced Settings] */
// Wall thickness
wall_thickness = 2.5;

// Corner radius
corner_radius = 2;

// Tolerance
tolerance = 0.5;

// Show magnets (for visualization)
show_magnets = false;

/* [Hidden] */
$fn = 64;

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
    // Four corner magnets for stable mounting
    positions = [
        [wall_thickness + 10, wall_thickness + 10],
        [base_width - wall_thickness - 10, wall_thickness + 10],
        [wall_thickness + 10, base_length - wall_thickness - 10],
        [base_width - wall_thickness - 10, base_length - wall_thickness - 10]
    ];
    
    for (pos = positions) {
        translate([pos[0], pos[1], base_height - magnet_depth])
            magnet_hole();
    }
}

module ic_pocket() {
    translate([0, 0, -0.1])
        rounded_cube([ic_pocket_size - tolerance, ic_pocket_size - tolerance, ic_pocket_depth + 0.1], 1);
}

module ic_tray_pockets() {
    // Calculate spacing
    x_spacing = (tray_width - (ic_cols * ic_pocket_size)) / (ic_cols + 1);
    y_spacing = (tray_length - (ic_rows * ic_pocket_size)) / (ic_rows + 1);
    
    for (row = [0:ic_rows-1]) {
        for (col = [0:ic_cols-1]) {
            x_pos = (base_width - tray_width)/2 + x_spacing + col * (ic_pocket_size + x_spacing);
            y_pos = (base_length - tray_length)/2 + y_spacing + row * (ic_pocket_size + y_spacing);
            
            translate([x_pos, y_pos, base_height - ic_pocket_depth])
                ic_pocket();
        }
    }
}

module component_tray_cavity() {
    // Large cavity for component tray
    cavity_width = tray_width - wall_thickness;
    cavity_length = tray_length - wall_thickness;
    
    translate([(base_width - cavity_width)/2, (base_length - cavity_length)/2, base_height - tray_depth])
        rounded_cube([cavity_width, cavity_length, tray_depth + 0.1], corner_radius);
}

module custom_tray_cavity() {
    // Customizable cavity
    translate([(base_width - tray_width)/2, (base_length - tray_length)/2, base_height - tray_depth])
        rounded_cube([tray_width, tray_length, tray_depth + 0.1], corner_radius);
}

module tray_feeder() {
    difference() {
        // Main base
        rounded_cube([base_width, base_length, base_height], corner_radius);
        
        // Tray cavity based on type
        if (tray_type == "IC") {
            ic_tray_pockets();
        } else if (tray_type == "Component") {
            component_tray_cavity();
        } else {
            custom_tray_cavity();
        }
        
        // Magnet holes
        magnet_holes_array();
        
        // Mounting holes at corners
        for (x = [10, base_width - 10]) {
            for (y = [10, base_length - 10]) {
                translate([x, y, -0.1])
                    cylinder(d=3, h=base_height + 0.2);
            }
        }
    }
    
    // Visual magnets (for reference)
    if (show_magnets) {
        color("silver", 0.8) {
            positions = [
                [wall_thickness + 10, wall_thickness + 10],
                [base_width - wall_thickness - 10, wall_thickness + 10],
                [wall_thickness + 10, base_length - wall_thickness - 10],
                [base_width - wall_thickness - 10, base_length - wall_thickness - 10]
            ];
            
            for (pos = positions) {
                translate([pos[0], pos[1], base_height - magnet_depth])
                    cylinder(d=magnet_diameter, h=magnet_depth);
            }
        }
    }
}

// Main render
tray_feeder();

// Information
echo(str("Tray Feeder Configuration:"));
echo(str("  Tray Type: ", tray_type));
echo(str("  Base Size: ", base_width, "x", base_length, "x", base_height, "mm"));
if (tray_type == "IC") {
    echo(str("  IC Pockets: ", ic_rows, "x", ic_cols, " (", ic_pocket_size, "mm each)"));
} else {
    echo(str("  Tray Size: ", tray_width, "x", tray_length, "x", tray_depth, "mm"));
}
echo(str("  Magnet Diameter: ", magnet_diameter, "mm"));
echo(str("  Magnet Depth: ", magnet_depth, "mm"));
