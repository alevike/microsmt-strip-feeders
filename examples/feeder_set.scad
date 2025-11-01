// Example: Complete Feeder Set
// Mix of different tape widths for a typical production setup

// This file demonstrates how to create multiple feeders at once
// Uncomment the configuration you want to render

// Option 1: Single 8mm feeder
//tape_width = 8;
//num_slots = 1;
//render_mode = "single";

// Option 2: Array of 4x 8mm feeders (most common size)
tape_width = 8;
num_slots = 4;
render_mode = "array";

// Option 3: Base mounting plate for multiple feeders
//num_slots = 6;
//render_mode = "base";

include <../src/strip_feeder_magnetic.scad>

// To render multiple sizes, export each separately:
// 1. Set parameters for first size
// 2. Render (F6) and export STL
// 3. Change parameters for next size
// 4. Repeat
