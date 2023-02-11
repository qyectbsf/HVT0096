include <../global_vars.scad>

z = 47.05;

module motor_back_left()
{
  motor_offset_x = 25.74;
  motor_offset_y = -46.29;
  motor_offset_z = 60.45;

  union()
  {
    difference()
    {
      union()
      {
        // primary structure start
        union()
        {
          translate([-15.0, -21.0, 0.0]) cube([82.0, 6.0, 100.0]);
          translate([-15.0, -69.0, 53.0]) cube([82.0, 48.0, 6.0]);

          for ( x = [-15.0, 61.0])
          {
            hull()
            {
              translate([x, -21.0, 0.0]) cube([6.0, 6.0, 100.0]);
              translate([x, -69.0, 53.0]) cube([6.0, 48.0, 6.0]);
            }
          }
        }

        // secundary structure start
        union()
        {
          // non geared idler
          hull()
          {
            translate([motor_offset_x - 1.75, -21.0, 59.0])
              cube([34.25, 6.0, 26.0]);
            translate([motor_offset_x + 15.5, motor_offset_y + 15.5, 59.0])
              cylinder(d = 19.0, h = 26.0, $fn = resolution);
          }
          // motor upper bearing
          hull()
          {
            translate([motor_offset_x - 10.75, -21.0, 73.0])
              cube([43.25, 6.0, 12.0]);
            translate([motor_offset_x, motor_offset_y, 73.0])
              cylinder(h = 12.0, d = 29.531, $fn = resolution);
          }
        }
      }

      // motor shaft and pulley space
      translate([motor_offset_x, motor_offset_y, 52.9])
        cylinder(h = 6.2, d = 22.5, $fn = resolution);

      // motor shaft
      translate([motor_offset_x, motor_offset_y, 73.0])
        cylinder(d = 5.4, h = 35.0, $fn = resolution);

      // bearing on motor shaft
      translate([motor_offset_x, motor_offset_y, 72.9])
        cylinder(d = 11.2, h = 5.0, $fn = resolution);

      // motor m3 holes
      for (j = [0.0, 1.0, 2.0])
      {
        translate([motor_offset_x, motor_offset_y, 0.0])
          rotate([0.0, 0.0, j * 90.0])
          translate([-15.5, 15.5, 48.99])
          cylinder(h = 17, d = 3.5, $fn = resolution);
      }

      // belt hole in primary structure
      translate([17.0, -21.0 - 0.05, upper_belt_z + 30 - 1])
        cube([7.0, 6.1, 10.8]);
      translate([60.9, -28.0, upper_belt_z + 30 - 1])
        cube([7.0, 7.0, 10.8]);

      // alu profile mount hole
      for (i = [9.0, 40.0, 91.0])
      {
        translate([0.0, -14.9, i])
          rotate([90.0, 0.0, 0.0])
          cylinder(d = m6_screw, h = 6.2, $fn = resolution);
      }
      translate([52.0, -14.9, 15.0])
        rotate([90.0, 0.0, 0.0])
        cylinder(d = m6_screw, h = 6.2, $fn = resolution);

      // idler cut out
      translate([motor_offset_x + 15.5, motor_offset_y + 15.5, 51.0])
        cylinder(d = 3mm_stab, h = 35.0, $fn = resolution);

      // belt cutout in secundary structure
      hull()
      {
        translate([motor_offset_x + 15.5, motor_offset_y + 15.5, upper_belt_z + 29.0])
          cylinder(d = 19.0, h = 10.8, $fn = resolution);
        translate([motor_offset_x, motor_offset_y, upper_belt_z + 29.0])
          cylinder(d = 20.0, h = 10.8, $fn = resolution);
        translate([60.9, -28.0, upper_belt_z + 29.0])
          cube([7.0, 7.0, 10.8]);
      }
    }
    translate([motor_offset_x + 15.5, motor_offset_y + 15.5, upper_belt_z + 29.0])
      pulley_cutout_inverse(20);
  }
}

module pulley_back_left()
{
  x =  15.0;
  y = -15.0;
  z =  25.1;

  z_offset = 30.0 + lower_belt_z - 1;

  union()
  {
    difference()
    {
      // main structure to subtract from
      union()
      {
        translate([15.0, -15.0, 30.0])
          cube([20.0, 6.0, 70.0]);
        translate([15.0, -15.0, 30.0])
          cube([6.0, 30.0, 70.0]);
        translate([15.0, -15.0, z_offset - 6.0])
          cube([20.0, 30.0, belts_max_space + 12.0]);
      }

      // space for 3mm stab to hold idler
      translate([10.74 + x, 15 - 2.92 + y, z_offset - 6.01])
        cylinder(h = belts_max_space + 12.02, d = 3mm_stab, $fn = resolution);

      // space for idler and belts
      translate([14.9, -15.01, z_offset]) cube([20.2, 24.0, belts_max_space]);
      translate([14.9, -15, z_offset]) cube([9.0, 30.1, belts_max_space]);

      // frame m6 mount holes
      for (i = [39.0, 88.9])
      {
        translate([14.9, 0.0, i])
          rotate([0.0, 90.0, 0.0])
          cylinder(h = 6.2, d = m6_screw, $fn = resolution);
      }
    }

    // geometrie for idler
    difference()
    {
      translate([10.74 + x -2.5, 15 -2.92 + y -5.5, z_offset])
        cube([9.0, 11.0, belts_max_space]);
      translate([10.74 + x, 15 -2.92 + y, z_offset])
        pulley_cutout(19.5);
      translate([10.74 + x, 15 -2.92 + y, z_offset])
        cylinder(h = 50.0 , d = 3mm_stab, $fn = resolution);
    }
  }
}

module motor_and_pulley_back_left()
{
  difference()
  {
    union()
    {
      pulley_back_left();
      motor_back_left();
    }

    // motor_xy_left and pulley_mount_back_left combiner
    for (i = [39.0, 88.9])
    {
      translate([27.0, -15 + 6.05, i])
        rotate([90.0, 0.0, 0.0])
        cylinder(h = 12.1, d = 3.0, $fn = resolution);
    }
  }
}

//motor_and_pulley_back_left();
