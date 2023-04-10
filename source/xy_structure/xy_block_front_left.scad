include <../global_vars.scad>

module block_front_left()
{
  difference()
    {
      // main structure to subtract from
      union()
      {
        translate([-15 - 6.5, -15.0, -30.0]) cube([6.5, 65.0, 100.0]);
        translate([-16.5, 35.0 / 2 + 15, 35.0]) cube([10, 35.0, 70.0], center = true);
        translate([-15, 15, 10.0]) cube([30.0, 6.0, 60.0]);

        for (z = [10.0, 63.0])
          {
            translate([-18.0, 22.50, z]) hull()
              {
                translate([3.0, -2.5, 0.0]) cube([30.0, 6.0, 7.0]);
                translate([0.0, 12.5, 3.5]) cube([6.0, 30.0, 7.0], center = true);
              }
          }
      }

      /* // space for optical sensor */
      /* translate([13.5, 27.4 - 3.0, 33.8]) cube([9.0, 11.7 - 1.6, 13.0], center = true); */
      /* translate([13.5 - 1.7, 27.4 - 3.0, 27.0]) cube([9.0, 5.0, 13.0], center = true); */

      /* // m3 hole to mount optical sensor into */
      /* translate([4.0, 27.38 - 3.0, 36.7]) */
      /*   rotate([0.0, 90.0, 0.0]) */
      /*   cylinder(h = 15.0, d = 2.9, center = true, $fn = resolution); */

      /* // space for connector of optical sensor */
      /* translate([0.0, 27.4 - 3.0, 9.45]) cube([6.2, 12.0, 7.7], center = true); */

      // space for idler
      translate([-16.5, 30, upper_belt_idler_z]) idler_cutout(21);

      // space for 5mm stab
      translate([-16.5,30,40]) cylinder(h =70.0, d = 5mm_stab, $fn = resolution, center = true);

      // m6 mount hole for frame connectivity
      translate([0, 15 + 3, 40.0])
        rotate([90.0, 0.0, 0.0])
        cylinder(h = 6.2, d = m6_screw, center = true, $fn = resolution);
      for (i = [-15.0, 20.0, 55.0])
        {
          translate([-18.0, 0, i])
            rotate([0.0, 90.0, 0.0])
            cylinder(h = 8.2, d = m6_screw, center = true, $fn = resolution);
        }
      translate([-18, 30, -15.0])
        rotate([0.0, 90.0 ,0.0])
        cylinder(h = 10, d = m6_screw, center = true, $fn = resolution);
    }
}

module block_front_left_addatives()
{
  if ( show_addatives == 1 )
    {
      translate([-16.5, 30, upper_belt_z - 2]) rotate([90,0,0]) gates_2gt_20t_toothed_idler();
    }
}
