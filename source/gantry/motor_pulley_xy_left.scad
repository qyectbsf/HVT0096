include <../global_vars.scad>

z = 47.05;

module motor_xy_left()
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
          translate([-15,-15 - 6]) cube([82,6,100]);
          translate([-15,-69,49 + 4]) cube([82,48,6]);

          for ( x = [-15,61])
          {
            hull()
            {
              translate([x,-15 - 6]) cube([6,6,100]);
              translate([x,-69,49 + 4]) cube([6,48,6]);
            }
          }
        }
        // primary structure end

        // secundary structure start
        union()
        {
          // non geared idler
          hull()
          {
            translate([motor_offset_x + 15.5 - 13 - 4 - 0.25,-15 - 6 ,49 + 6 + 4]) cube([34 + 0.25,6,26]);
            translate([motor_offset_x + 15.5,motor_offset_y + 15.5,49 + 6 + 4]) cylinder(d = 19, h = 26, $fn = resolution);
          }
          // motor upper bearing
          hull()
          {
            translate([motor_offset_x + 15.5 - 13 - 4 - 9 -0.25,-15 - 6 ,49 + 6 + 18]) cube([34 + 0.25 + 9,6,12]);
            translate([motor_offset_x,motor_offset_y,49 + 6 + 18]) cylinder(h=12 ,d = 29.531,$fn=resolution);
          }
        }
        // secundary structure end
      }

    // motor shaft and pulley space
    translate([motor_offset_x,motor_offset_y,49 - 0.1 + 4]) cylinder(h=6.2 ,d = 22.5,$fn=resolution);

    // motor shaft 
    translate([motor_offset_x,motor_offset_y,49 + 6 + 18]) cylinder(d = 5.4, h = 35, $fn = resolution);

    // bearing on motor shaft
    translate([motor_offset_x,motor_offset_y,49 + 6 + 18 - 0.1]) cylinder(d = 11.2, h = 5, $fn = resolution);


    // motor m3 holes
    for (j = [0,1 * 90, 2 * 90])
    {
      translate([motor_offset_x,motor_offset_y,0])
      rotate([0,0,j])
      translate([-15.5,+15.5, 49- 0.01])
      cylinder(h=17 ,d = 3.5,$fn=resolution);
    }

    // belt hole in primary structure
    translate([17,-15 - 6 - 0.05,upper_belt_z + 30 - 1]) cube([7,6.1,10.8]);
    translate([60.8 + 0.1,-15 - 6 - 7,upper_belt_z + 30 - 1]) cube([7,7,10.8]);

    // alu profile mount hole
    for (i = [9, 40, 91])
    {
      translate([0,-15 + 0.1,i]) rotate([90,0,0]) cylinder(d = m6_screw, h = 6.2, $fn=resolution);
    }
    translate([52,-15 + 0.1,15]) rotate([90,0,0]) cylinder(d = m6_screw, h = 6.2, $fn=resolution);

    // idler cut out
    translate([motor_offset_x + 15.5,motor_offset_y + 15.5,49 + 2]) cylinder(d = 3mm_stab, h = 35, $fn = resolution);

    // belt cutout in secundary structure
    hull()
    {
      translate([motor_offset_x + 15.5,motor_offset_y + 15.5,upper_belt_z + 30 - 1]) cylinder(d = 19, h = 10.8, $fn = resolution);
      translate([motor_offset_x,motor_offset_y,upper_belt_z + 30 - 1]) cylinder(d = 20, h = 10.8, $fn = resolution);
      translate([60.8 + 0.1,-15 - 6 - 7,upper_belt_z + 30 - 1]) cube([7,7,10.8]);
    }
  }

    translate([motor_offset_x + 15.5,motor_offset_y + 15.5,upper_belt_z + 30 - 1]) pulley_cutout_inverse(20);

}

}

module pulley_mount_back_left()
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
        translate([15.0, -15.0, 30.0]) cube([20.0,  6.0, 70.0]);
        translate([15.0, -15.0, 30.0]) cube([ 6.0, 30.0, 70.0]);
        translate([15.0, -15.0, z_offset - 6]) cube([20.0, 30.0, belts_max_space + 12]);
      }

      // space for 3mm stab to hold idler
      translate([10.74 + x, 15 - 2.92 + y, z_offset - 6.01]) cylinder(h = belts_max_space + 12.02, d = 3mm_stab, $fn=resolution);

      // space for idler and belts
      translate([15 - 0.1, -15.01, z_offset]) cube([20.2,30 - 6,belts_max_space]);
      translate([15- 0.1,- 15, z_offset]) cube([6 + 3,30.1, belts_max_space]);

      // frame m6 mount holes
      for (i = [39, 88.9])
      {
        translate([14.9, 0 ,i]) rotate([0,90,0]) cylinder(h = 6.2, d = m6_screw, $fn=resolution);
      }
    }

    // geometrie for idler
    difference()
    {
      translate([10.74+x -2.5,15 -2.92+y -5.5, z_offset]) cube([9, 11, belts_max_space]);
      translate([10.74+x,15 -2.92+y, z_offset]) pulley_cutout(19.5);
      translate([10.74+x,15 -2.92+y, z_offset]) cylinder(h = 50 , d = 3mm_stab, $fn=resolution);
    }
  }
}


module motor_pulley_xy_left()
{
  difference()
  {
    union()
    {
      pulley_mount_back_left();
      motor_xy_left();
    }

    // motor_xy_left and pulley_mount_back_left combiner
    for (i = [39, 88.9])
    {
      translate([15 + 6+ 6,-15 + 6.05,i]) rotate([90,0,0]) cylinder(h = 12.1, d = 3, $fn= resolution);
    }
  }
}

//motor_pulley_xy_left();
