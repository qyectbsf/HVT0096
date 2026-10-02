include <BOSL2/std.scad>
include <BOSL2/screws.scad>
include <nopSCADlib/lib.scad>

include <../global_vars.scad>

module block_back_right()
{
  primary_back_right();
  secondary_back_right();
}

module primary_back_right()
{
  difference()
    {
      // main object to subtract from
      union()
        {
          translate([+15, -86 + 15, -30.0]) cube([printed_wall_width, 86, 100.0]);
          hull()
            {
              translate([15 + 5.5, -5.5 + 15, -30.0]) cube([1.0, 5.5, 100.0]);
              translate([-1 * (motor_rel_offset_x - 10), -5.5 + 15, lower_belt_z -13.2]) cube([1, 5.5, 30.0]);
            }
          hull()
            {
              translate([15 + 5.5, -86 + 15, -30.0]) cube([1.0, 5.5, 100.0]);
              translate([-1 * (motor_rel_offset_x - 10), -86 + 15, lower_belt_z -13.2]) cube([1, 5.5, 30.0]);
            }
          hull()
            {
              translate([-1 * (motor_rel_offset_x -22), motor_rel_offset_y -22, lower_belt_z -13.2])
                cube([1, 44, 30.0]);
              translate([-1 * (motor_rel_offset_x -10), motor_rel_offset_y -43, lower_belt_z -13.2])
                cube([1, 86, 30.0]);
            }
          translate([motor_rel_offset_x + 67, motor_rel_offset_y -43, lower_belt_z -13.2]) cube([35, 86, 30.0]);

        }
      // motor shaft plus bearing and pulley
      translate([-motor_rel_offset_x, motor_rel_offset_y, lower_belt_z - 12.5]) xy_motor_shaft_cutout();

      // 3 out of 4 screws for motor mount
      translate([-motor_rel_offset_x, motor_rel_offset_y, lower_belt_z - 12.5])
        rotate([0,0,-90])
        xy_motor_screw_cutout();

      //space for idler
      translate([-1 * (motor_rel_offset_x + 15.52), motor_rel_offset_y - 15.52, lower_belt_idler_z - 1.25])
        idler_cutout(21);

      // space for 3mm stab
      translate([-1 * (motor_rel_offset_x + 15.52), motor_rel_offset_y - 15.52, lower_belt_idler_z - 1.25])
        cylinder(h =70.0, d = 3mm_stab, $fn = resolution, center = true);

      // space for belt
      translate([-225,-220,lower_belt_z + 3]) lower_belt_cutout();

      // space for idler assembly
      translate([-1 * ( motor_rel_offset_x +15.52 + 10), motor_rel_offset_y -44, lower_belt_z - 2.5])
        cube([20, 25, 11.0]);

      // space for m6
      for (z = [-15,60.5]){
        translate([19, 0, z])
          rotate([0, 90, 0])
          cylinder(h = 10, d = m6_screw, center = true, $fn = resolution);
      }
      translate([19, - 86 + 30, -15])
        rotate([0, 90, 0])
        cylinder(h = 10, d = m6_screw, center = true, $fn = resolution);
    }
}

module secondary_back_right()
{
  difference(){
    // the main object the subtract form
    union()
      {
        translate([-15 -6.5, -53 + 15, -30.0]) cube([6.5, 53, 100.0]);
        translate([-15 - 6.5, -53 + 15, 10.0]) cube([36.5, 23, 60.0]);
      }

    // back alu profile
    translate([-15 -0.1 - 6.5, -30 + 15, -31]) cube([6.7, 31, 31]);

    // deco but less deco
    translate([-15.1 -6.5, -53 + 15 -6.5, 51.0]) cube([36.7, 23, 60.0]);

    // belt space
    translate([-225,-220,lower_belt_z + 3]) lower_belt_cutout();
    translate([-225,-220,upper_belt_z + 3]) upper_belt_cutout();

    // idler space
    translate([-1 * (motor_rel_offset_x + 43), motor_rel_offset_y, upper_belt_idler_z - 1.25])
      idler_cutout(21);
    translate([-1 * (motor_rel_offset_x + 43 + 10), motor_rel_offset_y - 20, upper_belt_idler_z - 1.25])
      cube([20, 25, 11.0]);

    // idler stab space
    translate([-1 * (motor_rel_offset_x + 43), motor_rel_offset_y, upper_belt_idler_z - 1.25])
      cylinder(h =70.0, d = 3mm_stab, $fn = resolution, center = true);

    // m6 screw
    translate([0, -18.58, 60.5])
      rotate([-90,0,0])
      cylinder(h = 10, d = m6_screw, center = true, $fn = resolution);
    translate([-19, - 15 - 12.5, -15])
      rotate([0,90,0])
      cylinder(h = 10, d = m6_screw, center = true, $fn = resolution);
    for (z = [15,55]){
      translate([-19, 0, z])
        rotate([0,90,0])
        cylinder(h = 10, d = m6_screw, center = true, $fn = resolution);
    }
  }
}

module block_back_right_addatives()
{
  // stepper motor
  translate([-motor_rel_offset_x, motor_rel_offset_y, lower_belt_z - 8.3 -4]) nema_17_25mm_shaft();

  // idler
  translate([-1 * (motor_rel_offset_x + 15.52), motor_rel_offset_y - 15.52, lower_belt_idler_z])
    pulley(GT2x20_plain_idler);
  translate([-1 * (motor_rel_offset_x + 15.52), motor_rel_offset_y - 15.52, lower_belt_idler_z])
    cylinder(h =70.0, d = 3mm_stab, $fn = resolution, center = true);

  // motor pulley
  translate([-motor_rel_offset_x, motor_rel_offset_y, lower_belt_z - 7.25]) pulley(GT2x20ob_pulley);

  // bearing
  translate([-motor_rel_offset_x, motor_rel_offset_y, lower_belt_z + 10.5]) mr115zz_bearing();

  // idler
  translate([-1 * (motor_rel_offset_x + 43), motor_rel_offset_y, upper_belt_idler_z ]) pulley(GT2x20_toothed_idler);
  translate([-1 * (motor_rel_offset_x + 43), motor_rel_offset_y, upper_belt_idler_z - 1.25])
    cylinder(h =70.0, d = 3mm_stab, $fn = resolution, center = true);

  if (show_screws == 1)
    {
      // m6 screw
      translate([0, -18.58, 60.5])
        rotate([180,0,0])
        union() {
        rotate([-90.0, 0.0, 0.0])
          screw("M6", length=14, head="socket", drive="hex");

        // washer
        translate([0, 3.2, 0])
          rotate([90,0,0])
          tube(id=6.4, od=18.0, h=1.6);

        // t sliding nut
        translate([0,-5.6,0])
          rotate([90,90,0])
          sliding_t_nut(M6_sliding_t_nut);
      }

      translate([19.1, -15 - 12.5, -15])
        union() {
        rotate([0.0, 90.0, 0.0])
          screw("M6", length=14, head="socket", drive="hex");

        translate([3.2, 0, 0])
          rotate([0, 90, 0])
          tube(id=6.4, od=18.0, h=1.6);

        translate([-6.1, 0, 0])
          rotate([90,0,-90])
          sliding_t_nut(M6_sliding_t_nut);
      }

      for (z = [15, 55]){
        translate([19.1, 0, z])
          union() {
          rotate([0.0, -90.0, 180.0])
            screw("M6", length=14, head="socket", drive="hex");

          translate([3.2, 0, 0])
            rotate([0, 90, 0])
            tube(id=6.4, od=18.0, h=1.6);

          translate([-6.1, 0, 0])
            rotate([90,90,-90])
            sliding_t_nut(M6_sliding_t_nut);
        }
      }

      for (z = [-15,10,60.5]){
        translate([-19.1, 0, z])
          union() {
          rotate([0.0, -90.0, 0.0])
            screw("M6", length=14, head="socket", drive="hex");

          translate([-3.2, 0, 0])
            rotate([0, 90, 0])
            tube(id=6.4, od=18.0, h=1.6);

          translate([6.1, 0, 0])
            rotate([90,90,90])
            sliding_t_nut(M6_sliding_t_nut);
        }
      }

      translate([-19.1, - 86 + 30, -15])
        union() {
        rotate([0.0, -90.0, 0.0])
          screw("M6", length=14, head="socket", drive="hex");

        translate([-3.2, 0, 0])
          rotate([0, 90, 0])
          tube(id=6.4, od=18.0, h=1.6);

        translate([6.1, 0, 0])
          rotate([90,0,90])
          sliding_t_nut(M6_sliding_t_nut);
      }
    }
}
