include <../global_vars.scad>

module singular_belt_module()
{
  for (x = [-29.0, 29.0])
    {
      y_offset = 12.5;
      // structure to mount pulley
      difference()
        {
          translate([x, y_offset, 0.0]) cylinder(h = belts_max_space, d = 19.9, $fn = resolution);
          translate([x, y_offset, 0.0]) idler_cutout(20.0);
        }

      // support structure to fixate main structure to bottom and back
      hull()
        {
          translate([x, y_offset, belts_max_space / 2.0 - 0.175]) cylinder(h = 10.8 + 0.35 , d = 19.9, $fn = resolution);
          translate([x - 5.0, -15, belts_max_space / 2.0 - 0.175]) cube([10.0, 1.0, 10.8 + 0.35]);
        }
    }
}

module belt_tentioner_base()
{
  difference()
    {
      // main structure of belt tentioner base
      union()
      {
        // x cube
        for (x = [90.0 - 6.0, -90.0])
          {
            translate([x, -15.0, 0.0]) cube([6.0, 36.0, 54.0]);
          }
        translate([-3.0, -15.0, lower_belt_z - 11.0 - 1.0]) cube([6.0, 36.0, belts_max_space + 22.0]);

        // y cube
        translate([-90.0, -15.0, lower_belt_z - 1.0 - 11.0]) cube([90.0 * 2.0, 3.0, belts_max_space + 22.0]);

        // z cube
        // 8.4 = belt width + idler space / 2 + idler mount (6 + 1.4 + 1)
        for (z = [lower_belt_z - 10.9, upper_belt_z + 10.9])
          {
            translate([0.0, 3.0, z + 3.0 + 1.4]) cube([90.0 * 2.0, 36.0, 11], center = true);
          }
        for (x = [90.0 - 6.0, -30.0 - 90.0])
          {
            translate([x, -15.0, 0.0]) cube([36.0, 36.0, 6.0]);
          }

        // structure to mount pulley
        for (r = [0.0, 180.0])
          {
            translate([0.0, 0.0, lower_belt_z - 1.0 + belts_max_space / 2.0])
              rotate([0.0, r, 0.0])
              translate([43.5, 0.0, -belts_max_space / 2.0])
              singular_belt_module();
          }
      }

      // space for belts
      translate([-90.1, 15.0 + 2.0, lower_belt_z - 1.0]) cube([180.2, 8.0, belts_max_space]);

      // space for 3mm stab
      for (x = [14.5, 72.5])
        {
          y_offset = 12.5;
          translate([x, y_offset, 0.0]) cylinder(h = 60.0, d = 3mm_stab, $fn = resolution);
          translate([-x, y_offset, 0.0]) cylinder(h = 60.0, d = 3mm_stab, $fn = resolution);
        }

      // m6 hole for frame conectivity
      for (x = [-1.0, 1.0])
        {
          translate([x * 105.0, 0.0, 0.0]) cylinder(h = 6.2, d = m6_screw, $fn = resolution);
        }
    }
}

module belt_tentioner_arm(r)
{
  rotate([0,r,0]) difference()
    {
      // main structure to subtract form
      union()
      {
        translate([-24.6/ 2,-23.6/2,0]) cube([24.6,21.6, belts_max_space + 12 +1.6 + 2 ]);
      }

      // pulley cutout
      translate([0,5.5,(belts_max_space + 12 +2)/2 - 0.02 +1]) idler_cutout(30);

      // space for 3mm stab
      translate([0,5.5,-0.1]) cylinder(h = belts_max_space + 12 +1.6 + 0.2 + 2, d = 3mm_stab, $fn= resolution);
    }
}

module handle_cutout(x)
{
  translate([x - 12.5,-12.0,lower_belt_z - 6 - 3.0]) cube([25,36, belts_max_space + 12 + 4]);
}

module belt_tentioner_mount()
{
  union()
  {
    difference()
      {
        belt_tentioner_base();
        // space for belt_tention_arm
        for (x = [-43.5,43.5])
          {
            handle_cutout(x);
          }
        // easy remove arm hole
        for (i =[-43.5, 43.5])
          {
            translate([i, -15.1, 32.0]) rotate([-90.0, 0.0, 0.0]) cylinder(h = 3.2, d = m4_screw, $fn = resolution);
          }
      }
  }
}

module block_back()
{
  block_back_primary();

  /* difference() */
  /*   { */
  /*     union() */
  /*     { */
        /* translate([-43.5,13,lower_belt_z - 1 - 7 + 0.2 - 1]) */
        /*   belt_tentioner_arm(0); */
        /* translate([43.5,13.27,belts_max_space + 12 +1.6 + lower_belt_z - 1 - 7 + 0.2 + 1]) */
        /*   belt_tentioner_arm(180); */
  /*       belt_tentioner_mount(); */
  /*     } */
  /*     // cutout for tention m4 screw */
  /*     for (i =[-43.5, 43.5]) */
  /*       { */
  /*         for (x = [-6.0, 6.0]) */
  /*           { */
  /*             for (z = [lower_belt_z - 9.4, upper_belt_z + 9.4]) */
  /*               { */
  /*                 translate([i + x, -15.1, z + 3.0 + 1.4]) rotate([-90.0, 0.0, 0.0]) cylinder(h = 36.2, d = m4_screw, $fn = resolution); */
  /*                 translate([i + x, 20 -0.1, z + 3.0 + 1.4]) rotate([-90, 0.0, 0.0]) cylinder(h = 3.2, d = m4_nut, $fn = 6); */
  /*               } */
  /*           } */
  /*       } */
  /*   } */
}

module block_back_primary()
{
  difference()
    {
      translate([-120,-23,0]) cube([240,30 + 8,44]);

      subract_void( x = -120, y = -23, z = 8.5,
                    cube_x = 15, cube_y = 38, cube_z = 35.5);
      subract_void( x = 105, y = -23, z = 8.5,
                    cube_x = 15, cube_y = 38, cube_z = 35.5);
      subract_void( x = -93, y = -23, z = 0,
                    cube_x = 93 * 2, cube_y = 38, cube_z = lower_belt_z -11.5);
      subract_void( x = 6, y = -23 - 8.5, z = lower_belt_z + 0.5,
                    cube_x = 86, cube_y = 38, cube_z = 5);
      subract_void( x = -86 - 3.5 - 2.5, y = -23 - 8.5, z = upper_belt_z + 0.5,
                    cube_x = 86, cube_y = 38, cube_z = 5);
      subract_void( x = -120, y = -60, z = lower_belt_z,
                    cube_x = 240, cube_y = 38, cube_z = 16);

      for ( x = [-1,1] )
        translate([-13 + x * upper_belt_idler_x_coordinates[5],-25, lower_belt_z - 3.5 - 3])
          cube([26,38,29]);

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

module block_back_addatives()
{
  for ( x = [4, 5, 6] )
    {
      translate([upper_belt_idler_x_coordinates[x],
                 motor_rel_offset_y + belt_distance + belt_thickness,
                 upper_belt_z - 2]) rotate([90,0,0]) gates_2gt_20t_smooth_idler();
    }

  for ( x = [2, 3, 4] )
    {
      translate([lower_belt_idler_x_coordinates[x],
                 motor_rel_offset_y + belt_distance + belt_thickness,
                 lower_belt_z - 2]) rotate([90,0,0]) gates_2gt_20t_smooth_idler();
    }
}

//singular_belt_module();

//belt_tentioner_arm();

//belt_tentioner();
