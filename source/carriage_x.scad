include <vars.scad>
include <bl_touch_mount.scad>

module mgn_12_mount()
{
  $fn=resolution;
  height=7.2;

  union()
  {
    difference()
    {
      union()
      {
        for (i = [-1,1])
        {
          hull()
          {
            translate([20.5*i,0,0]) cube([6,37.3,height -1], center = true);
            translate([0,15.17,0])  cube([46,7,height - 1], center = true);
          }
        }
        cube([32,27,height], center = true);
      }
      for (i = [-1,1])
      {
        for (j = [-1,1])
        {
          translate([20 / 2 * i,20 / 2 * j,0]) cylinder(h = 8.1, d = 3, center = true);
          translate([20 / 2 * i,20 / 2 * j,-2.05]) cylinder(h = 3.2, d = 5.8, center = true);
        }
      }
    }
    difference()
    {
      hull()
      {
        translate([-20.5,3+ 0.67,-5]) cube([6,30,height], center = true);
        translate([-20.5,-20,-1 - 15 - 0.1 - 5]) cube([6,13,25], center = true);
      }
      for (i = [-1,1])
      {
         translate([-20.5,-20,-1 - 15 - 0.1 - 5 + (i * 15/2)]) rotate([0,90,0]) cylinder(h = 6.2,d = 3, center = true);
      }
    }
    translate([0,-20,-1]) difference()
    {
      cube([31.8,13,5.2], center = true);
      for (i = [-1,1])
      {
        translate([15/2*i,0,0]) cylinder(h = 5.3, d= 3, center = true);
      }
    }
  }
}

module xy_gantry()
{
  $fn = resolution;

  translate([0,0,42]) cube([46,24,5], center = true);
  for (i = [-1,1])
  {
    for (j = [-1,1])
    {
      difference()
      {
        union()
        {
          difference()
          {
            hull()
            {
              translate([3 * i,15.17* j,41]) cube([40,7,7], center = true);
              translate([(46 -7)/2 * i,15.17* j,31]) cube([7,7,27], center = true);
              translate([(46 -7)/2 * i,(15.17 + 7.01) * j,16]) cube([7,7,1], center = true);
            }
            translate([15/2*i,-24,30]) rotate([5,0,0]) cylinder(h = 25, d= 5, center = true);
          }
          translate([19.5 * i,22.2* j,6.4]) cube([7,7,20], center = true);
        }
        for (y = [-1,1])
        {
          translate([y* 20 ,y * 15,lower_belt_z + 1.75]) cylinder(h=6.2,d=10, center = true);
        }
        for (y = [-1,1])
        {
          translate([-y* 20 ,y * 15,upper_belt_z + 1.75]) cylinder(h=6.2,d=10, center = true);
        }
        translate([20 * i,15.17* j,30]) cylinder(h= 32, d = 2.8, center = true);
      }
    }
  }
  for (i = [-1,1])
  {
    difference()
    {
      x = -20;
      y = i * (19.1 / 2);
      z = 43.5;
      translate([x,y,z])cube([20,7,2], center = true);
      translate([x - 6.5,y,z]) cylinder(h = 2.1, d = 2.9, center = true, $fn=200);
    }
  }
}

module m3_mounting_hole()
{
  $fn = resolution;
  rotate([90,0,0]) cylinder(h = 60 ,d = 3, center = true);
}

module berd_air_structure(var)
{
  $fn = resolution;
  delta_y = 40;

  hull()
  {
    translate([0,0,-9])sphere(d=var);
    translate([0,0,10])sphere(d=var);
  }

  for (i = [-1,1])
  {
    hull()
    {
      translate([0,delta_y/2 * i,-34]) sphere(d=var);
      translate([-8.65,delta_y / 2 * i,-34]) rotate([0,-90,0]) cylinder(h=1, d=var);
    }

    hull()
    {
      translate([0,delta_y/2 * i,-34]) sphere(d=var);
      translate([0,0,-9])sphere(d=var);
    }
  }
}

module berd_air()
{
  translate([25,0,40]) difference()
  {

    union()
    {
      berd_air_structure(9.2);
      difference()
      {
        hull()
        {
          translate([0,0,9]) cylinder(d=9.2, h = 5,$fn=resolution);
          translate([35 - 18.65,-13 / 2 + 22.40,-7 + 31]) translate([-5,-15,-15]) bl_touch_mount_cube();
        }
        translate([35 - 18.65,-13 / 2 + 22.40,-7 + 31]) translate([-5,-15,-15]) bl_touch_mount_holes();
      }
      translate([0,0,11]) cylinder(h = 7 + 6, d = 6, $fn = 200);
    }

    berd_air_structure(6.2);
    translate([0,0,11]) cylinder(h = 7 + 6, d = 4, $fn = 200);

  }
}

module biqu_h2o_extruder()
{
  $fn = 42;
  difference()
  {
    union()
    {
      // y = 46.70 + 16.11 = 62.81
      // because i dont user the led light and the cover plate for it
      // making it shorter than the datacheat
      translate([35/2 - 18.65,(46.70 + 16.11)/ 2 - 16.11,35 / 2+ 21])
      cube([35,46.70 + 16.11,35], center = true);

      // secundary spur gear
      translate([
        -28.98/2 - 35 / 2 + 37.87,
        -16.11 + 26.4,
        21.00 + 19])
      rotate([-90,0,0]) cylinder(h = 3.52, d = 28.98);

      // nozzle
      cylinder(d1=1, d2=4.7,h = 2, $fn = 40);
      translate([0,0,2]) cylinder(d=8,h = 3, $fn = 6);
      translate([0,0,5]) cylinder(d=5,h = 1.5, $fn = 40);

      // heatblock without silicon sock
      translate([0,24 / 2 - 8.9,11.3/2 + 6.5]) cube([15.6,21,11.3], center = true);
      translate([0,0,6.5]) cylinder(d=6,h = 21 - 6.5, $fn = 40);
    }

    // m3 hole in the frame
    for (i = [0,90,180,270])
    {
      translate([35/2 - 18.65,22.40,031 + 15 / 2])
      for (j = [-1,1])
      {
        rotate([0,i + 180,0])
        translate([j * 7.5,0,35/2 - 5.8])
        cylinder(h = 5.9, d = 2.9);
      }
    }
  }
}

module carriage_x_main()
{
  translate([1.15,-42.4,-57]) union()
  {
    berd_air();
    translate([35 - 18.65,-13 / 2 + 22.40,-7 + 31]) bl_touch_mount_main();
    biqu_h2o_extruder();
  }
  translate([0,0,2.6])difference()
  {
    union()
    {
      mgn_12_mount();
      xy_gantry();
    }
    for (i = [-1,1])
    {
      translate([19.5 * i,0,-0.1]) m3_mounting_hole();
    }
  }
}

carriage_x_main();