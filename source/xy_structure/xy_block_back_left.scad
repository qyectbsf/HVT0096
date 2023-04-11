include <../global_vars.scad>

module block_back_left()
{
  difference()
    {
      union()
      {
        primary_back_left();
        secondary_back_left();
      }

      // block back left combiner
      for (i = [7.0, 60])
        {
          translate([-9.0, -30.0, i])
            rotate([0.0, -90.0, 0.0])
            cylinder(h = 20, d = 3.0, $fn = resolution);
        }
    }
}

module primary_back_left()
{
  union()
  {
    difference()
      {
        // structure to subtract from
        hull()
          {
            translate([-15 -printed_wall_width, -100 + 15, -30.0]) cube([printed_wall_width, 100, 100.0]);
            translate([-54 - 15, -100 + 15, upper_belt_z - 8.3 -4 ]) cube([printed_wall_width, 100, 26.0]);
          }

        // subtract main voids
        subract_void( x = motor_rel_offset_x - 23.0, y = motor_rel_offset_y - 21.0, z = -30.0,
                      cube_x = 44.0, cube_y = 42.0, cube_z = upper_belt_z + 14.2 );

        subract_void( x = -69.0, y = motor_rel_offset_y - 21.0, z = upper_belt_z - 3.8,
                      cube_x = 44.0, cube_y = 42.0, cube_z =  9.0 );

        subract_void( x = -76.0, y = -76.5, z = upper_belt_z + 17.1,
                      cube_x = 44.0, cube_y = 83.0, cube_z = upper_belt_z + 14.2 );

        // motor shaft and m3 screws
        translate([motor_rel_offset_x, motor_rel_offset_y, upper_belt_z - 12.3]) xy_motor_shaft_cutout();
        translate([motor_rel_offset_x, motor_rel_offset_y, upper_belt_z - 12.3]) xy_motor_screw_cutout();

        // alu profile mount hole
        translate([-15.0,   0.0, -20.0]) rotate([0, -90, 0]) xy_m6_screw_cutout();
        translate([-15.0,   0.0,  upper_belt_z]) rotate([0, -90, 0]) xy_m6_screw_cutout();
        translate([-15.0,   0.0,  55.0]) rotate([0, -90, 0]) xy_m6_screw_cutout();
        translate([-15.0, -70.0, -15.0]) rotate([0, -90, 0]) xy_m6_screw_cutout();

        translate([motor_rel_offset_x + 16, motor_rel_offset_y - 42, upper_belt_z - 3])
          idler_cutout(width = 20);

        translate([motor_rel_offset_x - 2, motor_rel_offset_y - 2, upper_belt_z - 2])
          rotate([0,0,180 + 37.2])
          cube([belt_thickness + 6, 43, belt_height + 4]);

        translate([motor_rel_offset_x + 16, motor_rel_offset_y - 42, upper_belt_z - 3])
          difference()
          {
            hull()
              {
                cylinder(h = pulley_cutout_height, d = 19, $fn = resolution);
                translate([0,-30,0])
                  cylinder(h = pulley_cutout_height, d = 19, $fn = resolution);

              }
            cylinder(h = pulley_cutout_height, d = 19, $fn = resolution);

          }
        translate([motor_rel_offset_x + 16, motor_rel_offset_y - 42, 10])
          cylinder(h = 60, d = 5mm_stab, $fn = resolution);

        translate([motor_rel_offset_x, motor_rel_offset_y + 10, upper_belt_z - 2])
          rotate([0,0,-90])
          cube([belt_thickness + 6, 43, belt_height + 4]);

      }
  }
}

module secondary_back_left()
{
  difference()
    {
      // main structure to subtract from
      translate([-15.0, -45.0, 0]) cube([30,30,70]);

      // subtract void
      subract_void( x = -15 + 5+  3.5, y = -45, z = 0,
                    cube_x = 30 - 5 - 3.5, cube_y = 30 - 5 - 3.5,  cube_z = lower_belt_z - 3.5 - 5 -3);

      subract_void( x = -15 + 5+  3.5, y = -45, z = upper_belt_z + belt_height + 5 + 3.5 + 3,
                    cube_x = 30 - 5 - 3.5, cube_y = 30 - 5 - 3.5,  cube_z = 30 );

      // subtract m6 alu mount
      translate([0,-14.9, 55]) rotate([90,0,0]) cylinder(h = 5.2, d = m6_screw, $fn = resolution);

      // subtract idler
      translate([-3,-28,lower_belt_z - 3]) idler_cutout(20);

      // subtract space for belts
      difference()
        {
          translate([-15.1, -45.1, lower_belt_z - 3]) cube([30.2,30.2,upper_belt_z - lower_belt_z + 6 + 6]);
          translate([-7.4,  -45.1, lower_belt_z - 3]) cube([22.5,22.5, upper_belt_z - lower_belt_z + 6 + 6]);
          translate([-3,-28,lower_belt_z - 3]) cylinder(h = pulley_cutout_height, d = 19, $fn = resolution);
        }

      // subtract 5mm stab
      translate([-3,-28,lower_belt_z - 3 - 4]) cylinder(h = 40, d = 5mm_stab, $fn = resolution);
    }
}

module block_back_left_addatives()
{
  if ( show_addatives == 1 )
    {
      translate([motor_rel_offset_x, motor_rel_offset_y, upper_belt_z - 8.3 -4]) nema_17_25mm_shaft();
      translate([motor_rel_offset_x, motor_rel_offset_y, upper_belt_z - 8.3]) rotate([90,0,0]) gates_2gt_20t_toothed_pulley();
    }
}
