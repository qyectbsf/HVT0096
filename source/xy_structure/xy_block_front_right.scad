include <../global_vars.scad>

module block_front_right()
{
  difference()
    {
      union()
      {
        block_front_right_primary();
        block_front_right_secondary();
      }

      // combiner
      for ( z = [lower_belt_z - 6 - 10, upper_belt_z + 6 + 6 + 10] )
        {
          translate([15,40,z]) rotate([0,90,0]) union()
            {
              cylinder(h = 10, d = m3_screw_tight, $fn = resolution);
              translate([0,0,10]) cylinder(h = 50, d = m3_screw_head, $fn = resolution);
            }
        }
    }
}

module block_front_right_primary()
{
  difference()
    {
      // main structure to subtract from
      union()
      {
        translate([15, -15.0, -30.0]) cube([6.5, 65.0, 100.0]);
        translate([16.5, 35.0 / 2 + 15, 35.0]) cube([10, 35.0, 70.0], center = true);
        translate([-15, 15, 10.0]) cube([30.0, 6.0, 60.0]);
        translate([-10,21,30]) cube([22,29,10]);

        for (z = [10.0, 63.0])
          {
            translate([0.0, 22.50, z]) hull()
              {
                translate([-15.0, -2.5, 0.0]) cube([30.0, 6.0, 7.0]);
                translate([18.0, 12.5, 3.5]) cube([6.0, 30.0, 7.0], center = true);
              }
          }
      }

      // space for idler
      translate([16.5, 30, lower_belt_idler_z]) idler_cutout(21);

      // space for 5mm stab
      translate([16.5,30,40]) cylinder(h =70.0, d = 5mm_stab, $fn = resolution, center = true);

      // m6 mount hole for frame connectivity
      translate([0, 15 + 3, 50.0])
        rotate([90.0, 0.0, 0.0])
        cylinder(h = 6.2, d = m6_screw, center = true, $fn = resolution);

      for (i = [-15.0, 20.0, 55.0])
        {
          translate([18.0, 0, i])
            rotate([0.0, 90.0, 0.0])
            cylinder(h = 8.2, d = m6_screw, center = true, $fn = resolution);
        }

      translate([18, 30, -15.0])
        rotate([0.0, 90.0 ,0.0])
        cylinder(h = 10, d = m6_screw, center = true, $fn = resolution);

      // optical sensor
      for ( x = [16.6,-2.4] )
        {
          translate([x,51,35])
            rotate([90,0,0])
            cylinder(h = 10, d = m3_screw_tight, $fn = resolution);
        }
      for ( x = [10.9, 3.3] , z = [-1,1])
        {
          translate([x,51,35 + z * 1.3])
            rotate([90,0,0])
            cylinder(h = 2, d = 2, $fn = resolution);
        }

      for ( z = [-1,1])
        {
          translate([5,49.1,34 + z * 2.4]) cube([4,1,2]);
        }
    }
}

module block_front_right_secondary()
{
  translate([0,20,0]) union()
    {
      rotate([90,0,0])
        linear_extrude(height = 5, convexity = 10)
        polygon(points = [[21.5,-8.715], [55,lower_belt_z], [55,upper_belt_z + 6],
                          [21.5,68.55], [21.5, 40], [25,40],
                          [25,30], [21.5,30]]);

      translate([0,30,0])
        rotate([90,0,0])
        linear_extrude(height = 30, convexity = 10)
        polygon(points = [[21.5,-8.715], [55,lower_belt_z], [55,upper_belt_z + 6],
                          [21.5,68.55], [21.5, upper_belt_z + 6 + 6], [35,upper_belt_z + 6 + 6],
                          [35,lower_belt_z - 6], [21.5,lower_belt_z - 6]]);
    }
}

module block_front_right_addatives()
{
  if ( show_addatives == 1 )
    {
      translate([16.5, 30,lower_belt_z - 2]) rotate([90,0,0]) gates_2gt_20t_toothed_idler();
      translate([-5.1,50,40]) rotate([0,0,0])
        reprap_optical_limit_sensor_endstop_switch();

    }
}
