include <nopSCADlib/lib.scad>

include <../global_vars.scad>

module y_rail_mount_right ()
{
  difference() {
    // main block to subtract from
    union() {
      translate([-13.1,-28.3 / 2,0])
        cube([52, 28.3, 36]);
      translate([13.5,-28.3 / 2,-10])
        cube([25.4, 28.3, 10]);
    }

    // 20x20 y rail space
    translate([13.50,-10,6.20])
      cube([40,20,20]);

    // deco
    translate([29.5,-28.3 / 2,-13.5])
      minkowski()
      {
        cube([20, 28.3, 10]);
        sphere(d = 7 , $fn = resolution);
      }

    // space for y rail mount screws
    for (i = [20.1, 32.9]) {
      translate([i,0,-20])
        cylinder(r = 2.6, h = 60, $fn = resolution);
    }

    // angle adjust
    for (i = [-1, 1]) {
      translate([13.4, 8 * i, -5])
        rotate([0,90,0])
        cylinder(r = 3.1754, h = 2.5, $fn = 6);
      translate([15.8, 8 * i, -5])
        rotate([0,90,0])
        cylinder(r = 1.6, h = 10.3, $fn = resolution);
      translate([26, 8 * i, -5])
        rotate([0,90,0])
        cylinder(r = 3.5, h = 10.3, $fn = resolution);
    }

    // idler space
    translate([-3 -3.4, -8, lower_belt_z - 15]) idler_cutout_wip();
    translate([-3, 8, upper_belt_z - 15]) idler_cutout_wip();

    // idler 3mm stab
    translate([-3 -3.4,-8,-0.1]) cylinder(h = 50, d = 3.1, $fn = resolution);
    translate([-3 ,8,-0.1]) cylinder(h = 50, d = 3.1, $fn = resolution);

    // belt space
    translate([-13.2 + 27,14.15 - 1.9 - 0.15,upper_belt_z -15 + 5])
      cube([54,4.3,8], center = true);
    translate([-13.2,0,upper_belt_z -15 + 5])
      cube([10,28.4,11.1], center = true);
    translate([-13.2 + 27,-14.15 + 1.9 + 0.15,lower_belt_z -15 + 5])
      cube([54,4.3,8], center = true);
    translate([-13.2,0,lower_belt_z -15 + 5])
      cube([10,28.4,11.1], center = true);

    // inner rail mount
    for (i = [-1,1]) {
      translate([10,7.5 * i,-0.1])
      cylinder(h = 40, r = 1.6, $fn = resolution);
    }
    // outer rail mount
    for (i = [1]) {
      translate([-10,7.5 * i,-0.1])
        cylinder(h = 10, r = 1.6, $fn = resolution);
    }

    // space for outer rail mount screw
    for (i = [1]) {
      hull() {
      translate([-10,7.5 * i,4.0])
        cylinder(h = 10, r = 3, $fn = resolution);
      translate([-15,7.5 * i,4.0])
        cylinder(h = 50, r = 3, $fn = resolution);
      }
    }
  }
}
