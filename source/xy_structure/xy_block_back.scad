include <../global_vars.scad>

module block_back()
{
  difference()
    {
     union()
      {
        block_back_primary();

        translate([upper_belt_idler_x_coordinates[5],
                   -25 + 10.5 + belt_tention_strength,
                   upper_belt_z - 2])
          block_back_secondary();

        translate([lower_belt_idler_x_coordinates[3],
                   -25 + 10.5 + belt_tention_strength,
                   upper_belt_z - 2])
          rotate([0, 180, 0])
          block_back_secondary();
      }

      for ( x =[-42, -56, 42, 56], z = [lower_belt_z - 7.2, upper_belt_z + 6 + 7.2] )
        {
          translate([x, -26.6 + belt_tention_strength, z]) rotate([-90, 0.0, 0.0]) union()
            {
              cylinder(h = 3.2, d = m4_nut, $fn = 6);
              cylinder(h = 42, d = m4_screw, $fn = resolution);
            }
        }
    }
}

module block_back_primary()
{
  difference()
    {
      translate([-120, -23, 0]) cube([240, 38, 50.5]);

      for ( z = [0, 48] )
        {
          for ( x = [-93, 70.5] )
            subract_void( x = x, y = -23, z = z,
                          cube_x = 31 - 3.5 - 5, cube_y = 38, cube_z = lower_belt_z -11.5);
          subract_void( x = -36 + 3.5 + 5, y = -23, z = z,
                        cube_x = 55, cube_y = 38, cube_z = lower_belt_z -11.5);
        }

      for ( x = [-120, 105] )
        subract_void( x = x, y = -23, z = 8.5,
                      cube_x = 15, cube_y = 38, cube_z = 35.5 + 6.5);

      subract_void( x = 6, y = -23 - 8.5, z = lower_belt_z + 0.5,
                    cube_x = 86, cube_y = 38, cube_z = 5);
      subract_void( x = -86 - 3.5 - 2.5, y = -23 - 8.5, z = upper_belt_z + 0.5,
                    cube_x = 86, cube_y = 38, cube_z = 5);
      subract_void( x = -120, y = -60, z = lower_belt_z,
                    cube_x = 240, cube_y = 38, cube_z = 16);

      for ( x = [-1,1] )
        translate([-13 + x * upper_belt_idler_x_coordinates[5],-25, lower_belt_z - 3.5 - 3 - 5])
          cube([26,38,39]);

      for ( x = [4, 6] )
        {
          translate([upper_belt_idler_x_coordinates[x],
                     motor_rel_offset_y + belt_distance + belt_thickness,
                     lower_belt_z - 7])
            cylinder(h = 32, d = 5mm_stab, $fn = resolution);
        }

      for ( x = [2, 4] )
        {
          translate([lower_belt_idler_x_coordinates[x],
                     motor_rel_offset_y + belt_distance + belt_thickness,
                     lower_belt_z - 7])
            cylinder(h = 32, d = 5mm_stab, $fn = resolution);
        }

      // easy fuck up resolver
      for ( x = [upper_belt_idler_x_coordinates[5], lower_belt_idler_x_coordinates[3]] )
        {
          translate([x, 10, upper_belt_z - 2]) rotate([-90,0,0]) cylinder(h = 7, d = 5, $fn = resolution);
        }

      // alu profile mount
      for ( x = [-113, 113] )
        translate([x, 0, -0.1]) cylinder(h = 5.2, d = m6_screw, $fn = resolution);
    }

  // idler inverse cutout
  for ( x = [2, 4] )
    {
      translate([lower_belt_idler_x_coordinates[x],
                 motor_rel_offset_y + belt_distance + belt_thickness,
                 lower_belt_idler_z])
        idler_cutout_inverse();
    }
  for ( x = [4, 6] )
    {
      translate([upper_belt_idler_x_coordinates[x],
                 motor_rel_offset_y + belt_distance + belt_thickness,
                 upper_belt_idler_z])
        idler_cutout_inverse();
    }
}

module block_back_secondary()
{
  union()
  {
    difference()
      {
        cube([25,24,38], center = true);
        translate([0,-4,idler_cutout_height / 2 -1])
          cube([25.2, 24, idler_cutout_height], center = true);
        cylinder(h = 39, d = 5, $fn = resolution, center = true);
        subract_void( x = -12.5, y = -45.5, z = -8,
                      cube_x = 25, cube_y = 38, cube_z = 16);
      }
    translate([0,0,-1]) idler_cutout_inverse();
  }
}

module block_back_addatives()
{
  if ( show_addatives == 1 )
    {
      for ( x = [4, 5, 6] )
        {
          if ( x == 5 )
            {
              translate([upper_belt_idler_x_coordinates[x],
                         motor_rel_offset_y + belt_distance + belt_thickness + belt_tention_strength,
                         upper_belt_z - 2]) rotate([90,0,0]) gates_2gt_20t_smooth_idler();
            } else
            {
              translate([upper_belt_idler_x_coordinates[x],
                         motor_rel_offset_y + belt_distance + belt_thickness,
                         upper_belt_z - 2]) rotate([90,0,0]) gates_2gt_20t_smooth_idler();
            }
        }

      for ( x = [2, 3, 4] )
        {
          if (x == 3)
            {
              translate([lower_belt_idler_x_coordinates[x],
                         motor_rel_offset_y + belt_distance + belt_thickness + belt_tention_strength,
                         lower_belt_z - 2]) rotate([90,0,0]) gates_2gt_20t_smooth_idler();

            } else
            {
              translate([lower_belt_idler_x_coordinates[x],
                         motor_rel_offset_y + belt_distance + belt_thickness,
                         lower_belt_z - 2]) rotate([90,0,0]) gates_2gt_20t_smooth_idler();
            }
        }
    }
}
