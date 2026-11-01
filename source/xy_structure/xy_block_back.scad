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
                   upper_belt_z - 2.5])
          block_back_secondary();

        translate([lower_belt_idler_x_coordinates[3],
                   -25 + 10.5 + belt_tention_strength,
                   upper_belt_z - 2.5])
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
      translate([-95, -23, 0]) cube([190, 38, 58]);

      // remove deco top left to right
      subract_void( x = -95.5 - 6, y = -23, z = 49.5 + 6,
                    cube_x = 30, cube_y = 38, cube_z = 10);
      subract_void( x = 63.5 + 6, y = -23, z = 49.5 + 6,
                    cube_x = 30, cube_y = 38, cube_z = 10);

      subract_void( x = -36 + 3.5 + 5, y = -23, z = 49.5 + 6,
                    cube_x = 55, cube_y = 38, cube_z = lower_belt_z -11.5);

      for (i = [-1,0,1]) {
        translate([i * 80,-9,5 + 6])
          cube([25,40,10], center = true);
        translate([i * 80,0,5 + 6])
          cylinder(h = 50, d = 13, $fn = resolution);
        translate([i * 80, 0, 3.0])
          cylinder(h = 6.2, d = m6_screw, center = true, $fn = resolution);

      }

      translate([0,0,upper_belt_z - 2])
      hull() {
        translate([-60.5, 14 - 4, 0])
          cube([23,1,10]);
        translate([-79, -25, 0])
          cube([60,1,10]);
      }

      translate([0,0,lower_belt_z - 2])
        hull() {
        translate([60.5 - 23, 14 - 4, 0])
          cube([23,1,10]);
        translate([19, -25, 0])
          cube([60,1,10]);
      }

      // for ( z = [0, 48] )
      //   {
      //     for ( x = [-93, 70.5] )
      //       subract_void( x = x, y = -23, z = z,
      //                     cube_x = 31 - 3.5 - 5, cube_y = 38, cube_z = lower_belt_z -11.5);
      //     subract_void( x = -36 + 3.5 + 5, y = -23, z = z,
      //                   cube_x = 55, cube_y = 38, cube_z = lower_belt_z -11.5);
      //   }

      // for ( x = [-120, 105] )
      //   subract_void( x = x, y = -23, z = 8.5,
      //                 cube_x = 15, cube_y = 38, cube_z = 35.5 + 6.5);

      // subract_void( x = 6, y = -23 - 8.5, z = lower_belt_z - 0.25,
      //               cube_x = 86, cube_y = 38, cube_z = 5);
      // subract_void( x = -86 - 3.5 - 2.5, y = -23 - 8.5, z = upper_belt_z - 0.25,
      //               cube_x = 86, cube_y = 38, cube_z = 5);
      subract_void( x = -120, y = -24, z = lower_belt_z - 2.0,
                    cube_x = 240, cube_y = 1, cube_z = 21);

      for ( x = [-1,1] )
        translate([-13 + x * upper_belt_idler_x_coordinates[5],-25, lower_belt_z - 3.5 - 3 - 5])
          cube([26,38,40]);

      // idler mount stab
      for ( i = [4, 6] )
        {
          translate([upper_belt_idler_x_coordinates[i],
                     upper_belt_idler_y_coordinates[i] - 220,
                     lower_belt_z - 8])
            cylinder(h = 50, d = 3mm_stab, $fn = resolution);
        }

      // idler mount stab
      for ( i = [2, 4] )
        {
          translate([lower_belt_idler_x_coordinates[i],
                     lower_belt_idler_y_coordinates[i] - 220,
                     lower_belt_z - 8])
            cylinder(h = 50, d = 3mm_stab, $fn = resolution);
        }

      // tention block remove help
      for ( x = [upper_belt_idler_x_coordinates[5], lower_belt_idler_x_coordinates[3]] )
        {
          translate([x, 10, upper_belt_z - 2.5]) rotate([-90,0,0]) cylinder(h = 7, d = 5, $fn = resolution);
        }

      // alu profile mount
      for ( x = [-113, 113] )
        translate([x, 0, -0.1]) cylinder(h = 5.2, d = m6_screw, $fn = resolution);

      // idler inverse cutout
      for ( i = [2, 4] )
        {
          translate([lower_belt_idler_x_coordinates[i],
                     lower_belt_idler_y_coordinates[i] - 220,
                     lower_belt_idler_z - 0.75])
            idler_cutout(21);
        }
      for ( i = [4, 6] )
        {
          translate([upper_belt_idler_x_coordinates[i],
                     upper_belt_idler_y_coordinates[i] - 220,
                     upper_belt_idler_z - 0.75])
            idler_cutout(20);
        }
    }
}

module block_back_secondary()
{
  union()
  {
    difference()
      {
        cube([25,24,39], center = true);
        translate([0,-8,5.5]) cube([25.2, 24, 8.5], center = true);
        translate([0,-1.45,0]) cylinder(h = 39.2, d = 3mm_stab, $fn = resolution, center = true);
        subract_void( x = -12.5, y = -46.5, z = -8, cube_x = 25, cube_y = 38, cube_z = 16);
        translate([0,-1.45,0.5]) idler_cutout(20);
      }
  }
}

module block_back_addatives()
{
  translate([0,-220,0])
  for ( i = [4, 5, 6] )
    {
      if ( i == 5 )
        {
          translate([upper_belt_idler_x_coordinates[i],
                     upper_belt_idler_y_coordinates[i],
                     upper_belt_z - 1.25]) rotate([0,0,0]) pulley(GT2x20_toothed_idler);
        } else
        {
          translate([upper_belt_idler_x_coordinates[i],
                     upper_belt_idler_y_coordinates[i],
                     upper_belt_z - 1.25]) rotate([0,0,0]) pulley(GT2x20_plain_idler);
        }
    }

  translate([0,-220,0])
  for ( i = [2, 3, 4] )
    {
      if (i == 3)
        {
          translate([lower_belt_idler_x_coordinates[i],
                     lower_belt_idler_y_coordinates[i],
                     lower_belt_z - 1.25]) rotate([0,0,0]) pulley(GT2x20_toothed_idler);

        } else
        {
          translate([lower_belt_idler_x_coordinates[i],
                     lower_belt_idler_y_coordinates[i],
                     lower_belt_z - 1.25]) rotate([0,0,0]) pulley(GT2x20_plain_idler);
        }
    }

  if (show_screws == 1){
    for (i = [-1,0,1]){
      translate([i * 80,0,0])
        // m6 screw
        translate([0, 0, -2.4 + 6])
        union() {
        rotate([0.0, 0.0, 0.0])
          screw("M6", length=14, head="socket", drive="hex");

        // washer
        translate([0, 0, 3.2])
          rotate([0,0,0])
          tube(id=6.4, od=18.0, h=1.6);

        // t sliding nut
        translate([0,0,-5.5])
          rotate([180,0,0])
          sliding_t_nut(M6_sliding_t_nut);
      }
    }
  }
}
