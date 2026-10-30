include <nopSCADlib/lib.scad>

include <../global_vars.scad>

module y_rail_mount_right ()
{
  difference() {
    // main block to subtract from
    union() {
      translate([-52 + 13.1,-28.3 / 2,0])
        cube([52, 28.3, 36]);
      translate([-52 + 13.1,-28.3 / 2,-10])
        cube([25.4, 28.3, 10]);
    }

    // 20x20 y rail space
    translate([-52,-10,6.20])
      cube([40,20,20]);

    // deco
    translate([-52 + 3.5 -1,-28.3 / 2,-13.5 - 0.1])
      minkowski()
      {
        cube([20, 28.3, 10]);
        sphere(d = 7 , $fn = resolution);
      }

    // space for y rail mount screws
    for (i = [-20.1, -32.9]) {
      translate([i,0,-20])
        cylinder(r = 2.6, h = 60, $fn = resolution);
    }

    translate([-20.1,0,-11])
      cylinder(r = 5.0, h = 2.0, $fn = resolution);

    for (i = [-20.1, -32.9]) {
      translate([i,0,36 - 1.75])
        cylinder(r = 5.0, h = 2.0, $fn = resolution);
    }

    // the numbers
    // angle adjust
    for (i = [-1, 1]) {
      translate([-13.4 - 2.5, 8 * i, -5])
        rotate([0,90,0])
        cylinder(r = 3.1754, h = 2.5, $fn = 6);
      translate([-15.8 - 10.3, 8 * i, -5])
        rotate([0,90,0])
        cylinder(r = 1.6, h = 10.3, $fn = resolution);
      translate([-26 - 10.3, 8 * i, -5])
        rotate([0,90,0])
        cylinder(r = 3.5, h = 10.3, $fn = resolution);
    }

    // idler space
    translate([lower_belt_idler_x_coordinates[8] - 225,
               lower_belt_idler_y_coordinates[8] + 130 - current_y_position,
               lower_belt_z - 15]) idler_cutout_wip();
    translate([upper_belt_idler_x_coordinates[8] - 225,
               upper_belt_idler_y_coordinates[8] + 130 - current_y_position,
               upper_belt_z - 15]) idler_cutout_wip();

    // idler 3mm stab
    translate([lower_belt_idler_x_coordinates[8] - 225,
               lower_belt_idler_y_coordinates[8] + 130 - current_y_position,
               7]) cylinder(h = 50, d = 3.1, $fn = resolution);
    translate([upper_belt_idler_x_coordinates[8] - 225,
               upper_belt_idler_y_coordinates[8] + 130 - current_y_position,
               18]) cylinder(h = 50, d = 3.1, $fn = resolution);

    // belt space
    translate([15,0,lower_belt_z -4.5])
      cube([10,28.4,21], center = true);
    translate([-225, 130 - current_y_position, 13 + 0.5])
      lower_belt_cutout();
    translate([-225, 130 - current_y_position, 24 + 0.5])
      upper_belt_cutout();

    // inner rail mount
    for (i = [-1,1]) {
      translate([-10,7.5 * i,-0.1])
      cylinder(h = 40, r = 1.6, $fn = resolution);
    }

    // inner rail mount head space
    for (i = [-1,1]) {
      translate([-10,7.5 * i,36.0 - 7.65])
        cylinder(h = 7.7, r = 3.0, $fn = resolution);
    }

    // outer rail mount
    for (i = [-1]) {
      translate([10,7.5 * i,-0.1])
        cylinder(h = 10, r = 1.6, $fn = resolution);
    }

    // space for outer rail mount screw
    for (i = [-1]) {
      hull() {
      translate([10,7.5 * i,4.0])
        cylinder(h = 8, r = 3, $fn = resolution);
      translate([15,7.5 * i,4.0])
        cylinder(h = 10, r = 3, $fn = resolution);
      }
    }
  }
}
