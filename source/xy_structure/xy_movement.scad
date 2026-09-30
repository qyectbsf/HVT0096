include <nopSCADlib/lib.scad>

include <../global_vars.scad>
include <../stl_files/main.scad>

module y_movement()
{
  // 20x20 alu profile
  translate([0, -130, 29.2]) rotate([0,90,0]) extrusion(E2020, 420, cornerHole = true);

  /* translate([0,- 152.15 + 65,19.2]) x_schiene(0); */

  for ( i = [1,-1] ) {
    translate([(30/2 + 420/2)*i, -130 , 0])
      rotate([0,0,90])
      carriage(MGN12C_carriage);
  }

  // y rail mount blocks
  for ( i = [1,-1] )
    {
      translate([i * 225, -130, 13])
        rotate([0,0,i * 90])
        rotate([0,0,90])
        y_rail_mount();

      y_rail_mount_addatives();
    }

  // translate([current_x_position, 0,0]) x_movement();
}

module x_movement()
{
  //translate([22.2 + - 150, - 152.15 + 65,19.2]) rotate([0,180,90]) mgn_12_h();
  //translate([22.2 + - 150, - 152.15 + 65,19.2+ 20]) rotate([0,0,90]) mgn_12_h();

  //translate([- 150,- 152.14 + 65,0]) carriage_qye();
  //translate([-150,- 152.14 + 65, 26.2 + 13 - 52]) carriage_e3d();
}

module y_rail_mount() {
  difference() {
    union() {
      translate([-13.1,-28.3 / 2,0])
        cube([52, 28.3, 36]);
      translate([13.5,-28.3 / 2,-10])
        cube([25.4, 28.3, 10]);
    }
    translate([13.50,-10,6.20])
      cube([40,20,20]);


    translate([29.5,-28.3 / 2,-13.5])
      minkowski()
      {
        cube([20, 28.3, 10]);
        sphere(d = 7 , $fn = resolution);
      }
    for (i = [20.1, 32.9]) {
      translate([i,0,-20])
        cylinder(r = 2.6, h = 60, $fn = resolution);
    }
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

    translate([-3,-8,lower_belt_z - 15]) idler_cutout_wip();
    translate([-3,8,upper_belt_z - 15]) idler_cutout_wip();

    translate([-3,-8,-0.1]) cylinder(h = 50, d = 3.1, $fn = resolution);
    translate([-3,8,-0.1]) cylinder(h = 50, d = 3.1, $fn = resolution);

    translate([-13.2 + 27,14.15 - 1.9 - 0.15,upper_belt_z -15 + 5])
      cube([54,4.3,8], center = true);
    translate([-13.2,0,upper_belt_z -15 + 5])
      cube([10,28.4,11.1], center = true);

    translate([-13.2 + 27,-14.15 + 1.9 + 0.15,lower_belt_z -15 + 5])
      cube([54,4.3,8], center = true);
    translate([-13.2,0,lower_belt_z -15 + 5])
      cube([10,28.4,11.1], center = true);

    for (i = [-1,1]) {
      translate([10,7.5 * i,-0.1])
      cylinder(h = 40, r = 1.6, $fn = resolution);
    }
    for (i = [-1,1]) {
      translate([-10,7.5 * i,-0.1])
        cylinder(h = 10, r = 1.6, $fn = resolution);
    }
    for (i = [-1,1]) {
      hull() {
      translate([-10,7.5 * i,4.0])
        cylinder(h = 10, r = 3, $fn = resolution);
      translate([-15,7.5 * i,4.0])
        cylinder(h = 50, r = 3, $fn = resolution);
      }
    }
  }
}

module y_rail_mount_addatives()
{
  if (show_y_rail_addatives == 1) {
    for ( i = [-1,1] )
      {
        translate([i * 228, -130 + i * -20, lower_belt_z - 2])
          rotate([90,0,0])
          pulley(GT2x20_toothed_idler);

        translate([i * 228,  -130 + i * 20, upper_belt_z -2])
          rotate([90,0,0])
          pulley(GT2x20_toothed_idler);
      }
  }
}
