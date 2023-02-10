 include <vars.scad>

z = 47.05;

module motor_xy_left()
{
  motor_offset_x = 25.74;
  motor_offset_y = -46.29;
  motor_offset_z = 60.45;
  
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
          translate([motor_offset_x + 15.5 - 13 - 4 - 0.25,-15 - 6 ,49 + 6]) cube([34 + 0.25,6,30]);
          translate([motor_offset_x + 15.5,motor_offset_y + 15.5,49 + 6]) cylinder(d = 19, h = 30, $fn = 200);
        }
        // motor upper bearing
        hull()
        {
          translate([motor_offset_x + 15.5 - 13 - 4 - 9 -0.25,-15 - 6 ,49 + 6 + 18]) cube([34 + 0.25 + 9,6,12]);
          translate([motor_offset_x,motor_offset_y,49 + 6 + 18]) cylinder(h=12 ,d = 29.531,$fn=200);
        }
      }
      // secundary structure end
    }

    // motor shaft and pulley space
    translate([motor_offset_x,motor_offset_y,49 - 0.1 + 4]) cylinder(h=6.2 ,d = 22.5,$fn=200);

    // motor shaft 
    translate([motor_offset_x,motor_offset_y,49 + 6 + 18]) cylinder(d = 5.4, h = 35, $fn = 200);

    // bearing on motor shaft
    translate([motor_offset_x,motor_offset_y,49 + 6 + 18 - 0.1]) cylinder(d = 11.2, h = 5, $fn = 200);


    // motor m3 holes
    for (j = [0,1 * 90, 2 * 90])
    {
      translate([motor_offset_x,motor_offset_y,0])
      rotate([0,0,j])
      translate([-15.5,+15.5, 49- 0.01])
      cylinder(h=17 ,d = 3.5,$fn=200);
    }

    // belt hole in primary structure
    translate([17,-15 - 6 - 0.05,upper_belt_z + 30 - 1]) cube([7,6.1,10.8]);
    translate([60.8 + 0.1,-15 - 6 - 7,upper_belt_z + 30 - 1]) cube([7,7,10.8]);

    // alu profile mount hole
    for (i = [9, 40, 91])
    {
      translate([0,-15 + 0.1,i]) rotate([90,0,0]) cylinder(d = m6_screw, h = 6.2, $fn=200);
    }
    translate([52,-15 + 0.1,15]) rotate([90,0,0]) cylinder(d = m6_screw, h = 6.2, $fn=200);

    // idler cut out
    translate([motor_offset_x + 15.5,motor_offset_y + 15.5,49 + 2]) cylinder(d = 3mm_stab, h = 35, $fn = 200);

    // belt cutout in secundary structure
    hull()
    {
      translate([motor_offset_x + 15.5,motor_offset_y + 15.5,upper_belt_z + 30 - 1]) cylinder(d = 19, h = 10.8, $fn = 200);
      translate([motor_offset_x,motor_offset_y,upper_belt_z + 30 - 1]) cylinder(d = 20, h = 10.8, $fn = 200);
      translate([60.8 + 0.1,-15 - 6 - 7,upper_belt_z + 30 - 1]) cube([7,7,10.8]);
    }
  }
}

module pulley_mount_back_left()
{
  x =15;
  y = -15;
  z  =25.1;
  union()
  {
    difference()
    {
      union()
      {
        translate([15,-15,30]) cube([20,6,70]);
        translate([+ 15,- 15,30]) cube([6,30,70]);
        translate([15,- 15,52 - 6]) cube([20,30,21 + 6+ 6]);
      }
      translate([10.74+x,15 -2.92+y,26.1+z-0.1- 10]) cylinder(h = 50 , d = 3mm_stab, $fn=200);

      translate([15- 0.1,- 15,52]) cube([20.2,30 - 6,21]);
      translate([15- 0.1,- 15,52]) cube([6 + 3,30.1,21]);

      for (i = [39, 88.9])
      {
        translate([15 - 0.1,0,i]) rotate([0,90,0]) cylinder(h = 6.2, d = m6_screw, $fn=200);
      }
    }
    difference()
    {
      translate([10.74+x -2.5,15 -2.92+y -5.5,52]) cube([9,11,21]);
      translate([10.74+x,15 -2.92+y,52]) pulley_cutout(19.5);
      translate([10.74+x,15 -2.92+y,26.1+z-0.1- 10]) cylinder(h = 50 , d = 3mm_stab, $fn=200);
    }
  }
}


module xy_left()
{
  difference()
  {
    union()
    {
      // pulley_mount_back_left();
      motor_xy_left();
    }
    
    // motor_xy_left and pulley_mount_back_left combiner
    for (i = [39, 88.9])
    {
      translate([15 + 6+ 6,-15 + 6.05,i]) rotate([90,0,0]) cylinder(h = 12.1, d = 3, $fn= 200);
    }
  }
}

xy_left();