include <nopSCADlib/lib.scad>

include <../global_vars.scad>
include <../stl_files/main.scad>
include <y_block_left.scad>
include <y_block_right.scad>

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

  translate([-225, -130, 13]) y_rail_mount_left();
  translate([225, -130, 13]) rotate([0, 0, 180]) y_rail_mount_right();

  if (show_y_rail_addatives == 1)
    {
      y_rail_mount_addatives();
    }

  //translate([current_x_position, -130, 0]) x_movement();
}

module x_movement()
{
  //translate([22.2 + - 150, - 152.15 + 65,19.2]) rotate([0,180,90]) mgn_12_h();
  //translate([22.2 + - 150, - 152.15 + 65,19.2+ 20]) rotate([0,0,90]) mgn_12_h();

  // translate([- 150,0,0]) carriage();
  //translate([-150,- 152.14 + 65, 26.2 + 13 - 52]) carriage_e3d();
}

module y_rail_mount() {
}

module y_rail_mount_addatives()
{
  // idler
  translate([0, -130, -1.25])
    union() {
    // left lower idler
    translate([-228.00, -8.00, lower_belt_z]) pulley(GT2x20_toothed_idler);
    translate([-228.00, -8.00, 13 -0.1]) cylinder(h = 50, d = 3.1, $fn = resolution);
    // left upper idler
    translate([-231.40, +8.00, 13 -0.1]) cylinder(h = 50, d = 3.1, $fn = resolution);
    translate([-231.40, +8.00, upper_belt_z]) pulley(GT2x20_plain_idler);
    // right upper idler
    translate([+228.00, -8.00, upper_belt_z]) pulley(GT2x20_toothed_idler);
    translate([+228.00, -8.00, 13 -0.1]) cylinder(h = 50, d = 3.1, $fn = resolution);
    // right lower idler
    translate([+231.40, +8.00, lower_belt_z]) pulley(GT2x20_plain_idler);
    translate([+231.40, +8.00, 13 - 0.1]) cylinder(h = 50, d = 3.1, $fn = resolution);
  }

  for (i = [-1,1])
    {
      translate([i * 225, -130, 13])
        rotate([0,0,i * 90])
        rotate([0,0,90])
        union() {

        if ( show_screws == 1) {
          // rail m3 screw
          for (i = [-1,1]) {
            translate([10,7.5 * i,-0.1 + 20 - 2.4])
              screw("M3", length=40, head="socket", drive="hex");
          }
          for (i = [-1,1]) {
            translate([-10,7.5 * i,-0.1 + 0.6])
              screw("M3", length=10, head="socket", drive="hex");
          }

          // x rail m5 screw
          for (i = [20.1, 32.9]) {
            translate([i,0,31.1])
              screw("M5", length=14, head="socket", drive="hex");
          }
          translate([32.9,0,3.5])
            rotate([0,180,0])
            screw("M5", length=12, head="socket", drive="hex");
          translate([20.1,0,-1])
            rotate([0,180,0])
            screw("M5", length=22, head="socket", drive="hex");

          // m3 for orientation of the square
          for (i = [-1, 1])
            translate([15.8 + 7, 8 * i, -5])
              rotate([0,90,0])
              screw("M3", length=14, head="socket", drive="hex");
        }
      }
    }
}
