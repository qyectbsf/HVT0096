include <../global_vars.scad>
include <bl_touch_mount.scad>

module linear_rail_carriage_mount()
{
  height=7.2;

  union()
  {
    difference()
    {
      union()
      {
        for (i = [-1.0, 1.0])
        {
          // structure to mount to belt_anker_structure
          hull()
          {
            translate([i * 20.5, 0.0, 0.0])
              cube([6.0, 37.3, height - 1], center = true);
            translate([0.0, 15.17, 0.0])
              cube([46.0, 7.0, height - 1], center = true);
          }
        }

        // structure to mount to linear rail carriage
        cube([32.0, 27.0, height], center = true);
      }

      // m3 holes for  linear rail carriage
      for (i = [-1.0, 1.0])
      {
        for (j = [-1.0, 1.0])
        {
          translate([i * 20.0 / 2.0, j * 20.0 / 2.0, 0.0])
            cylinder(h = 8.1, d = 3, center = true, $fn = resolution);
          translate([i * 20.0 / 2.0, j * 20.0 / 2.0, -2.05])
            cylinder(h = 3.2, d = 5.8, center = true, $fn = resolution);
        }
      }
    }

    // secundary mount structure for extruder
    difference()
    {
      hull()
      {
        translate([-20.5, 3.0 + 0.67, -5.0])
          cube([6.0, 30.0, height], center = true);
        translate([-20.5, -20.0, -21.1])
          cube([6.0, 13.0, 25.0], center = true);
      }
      for (i = [-1.0, 1.0])
      {
         translate([-20.5, -20.0, -21.1 + (i * 15.0 / 2.0)])
           rotate([0.0, 90.0, 0.0])
           cylinder(h = 6.2, d = 3, center = true, $fn = resolution);
      }
    }

    // primary mount structure for extruder
    translate([0.0, -20.0, -1.0]) difference()
    {
      cube([31.8, 13.0, 5.2], center = true);
      for (i = [-1.0, 1.0])
      {
        translate([i* 15.0 / 2.0, 0.0, 0.0])
          cylinder(h = 5.3, d = 3, center = true, $fn= resolution);
      }
    }
  }
}

module belt_anker_structure()
{
  // base plate
  translate([0.0, 0.0, 42.0]) cube([46.0, 24.0, 5.0], center = true);

  // wings
  for (i = [-1.0, 1.0])
  {
    for (j = [-1.0, 1.0])
    {
      difference()
      {
        union()
        {
          difference()
          {
            // belt mount point and structure
            hull()
            {
              translate([3.0 * i, 15.17 * j, 41.0])
                cube([40.0, 7.0, 7.0], center = true);
              translate([(46.0 - 7.0) / 2.0 * i, 15.17 * j, 31.0])
                cube([7.0, 7.0, 27.0], center = true);
              translate([(46.0 - 7.0) / 2 * i, (15.17 + 7.01) * j, 16.0])
                cube([7.0, 7.0, 1.0], center = true);
            }

            // extruder removing space
            translate([15.0 / 2.0 * i, -24.0, 30.0])
              rotate([5.0, 0.0, 0.0])
              cylinder(h = 25, d = 5, center = true, $fn = resolution);
          }

          // linear_rail_carriage_mount mount
          translate([19.5 * i, 22.2 * j, 6.4])
            cube([7.0, 7.0, 20.0], center = true);
        }

        // belt cutout
        for (y = [-1.0, 1.0])
        {
          translate([y * 20.0, y * 15.0, lower_belt_z + 1.75])
            cylinder(h = 6.2, d = 10, center = true, $fn = resolution);
        }
        for (y = [-1.0, 1.0])
        {
          translate([-y * 20.0, y * 15.0, upper_belt_z + 1.75])
            cylinder(h = 6.2, d = 10, center = true, $fn = resolution);
        }

        // belt fixeate screw
        translate([i * 20.0, j * 15.17, 30.0])
          cylinder(h = 32, d = 2.8, center = true, $fn = resolution);
      }
    }
  }

  // optical sensor mount
  for (i = [-1.0, 1.0])
  {
    difference()
    {
      x = -20.0;
      y = i * (19.1 / 2.0);
      z = 42.5;

      translate([x, y, z]) cube([20.0, 7.0, 4.0], center = true);
      translate([x - 6.5, y, z])
        cylinder(h = 4.1, d = 2.9, center = true, $fn = resolution);
    }
  }
}

module m3_mounting_hole()
{
  rotate([90.0, 0.0, 0.0])
    cylinder(h = 60, d = 3, center = true, $fn = resolution);
}

module berd_air_structure(var)
{
  delta_y = 40.0;

  hull()
  {
    translate([0.0, 0.0, -9.0])
      sphere(d = var, $fn = resolution);
    translate([0.0, 0.0, 10.0])
      sphere(d = var, $fn = resolution);
  }

  for (i = [-1.0, 1.0])
  {
    hull()
    {
      translate([0.0, i * delta_y / 2, -34.0])
        sphere(d = var, $fn = resolution);
      translate([-8.65, i * delta_y / 2, -34.0])
        rotate([0.0, -90.0, 0.0])
        cylinder(h = 1, d = var, $fn = resolution);
    }

    hull()
    {
      translate([0.0, i * delta_y / 2.0, -34.0])
        sphere(d = var, $fn = resolution);
      translate([0.0, 0.0, -9.0])
        sphere(d = var, $fn = resolution);
    }
  }
}

module berd_air()
{
  translate([25,0,40]) difference()
  {
    union()
    {
      // outer structure
      berd_air_structure(9.2);
      difference()
      {
        hull()
        {
          translate([0.0, 0.0, 9.0])
            cylinder(d = 9.2, h = 5, $fn = resolution);
          translate([11.35, 0.9, 9.0])
            bl_touch_mount_cube();
        }
        translate([11.35, 0.9, 9.0])
          bl_touch_mount_holes();
      }
      translate([0.0, 0.0, 11.0])
        cylinder(h = 13.0, d = 6.0, $fn = resolution);
    }

    // inner removed structure
    berd_air_structure(6.2);
    translate([0.0, 0.0, 11.0])
      cylinder(h = 13.0, d = 4, $fn = resolution);
  }
}

module biqu_h2o_extruder()
{
  difference()
  {
    union()
    {
      // y = 46.70 + 16.11 = 62.81
      // because i dont user the led light and the cover plate for it
      // making it shorter than the datacheat
      translate([-1.15, 15.295, 38.5])
        cube([35.0, 62.81, 35.0], center = true);

      // secundary spur gear
      translate([5.88, 10.29, 40.0])
        rotate([-90.0, 0.0, 0.0])
        cylinder(h = 3.52, d = 28.98, $fn = resolution);

      // nozzle
      cylinder(d1 = 1.0, d2 = 4.7, h = 2.0, $fn = resolution);
      translate([0.0, 0.0, 2.0])
        cylinder(d = 8, h = 3, $fn = 6);
      translate([0.0, 0.0, 5.0])
        cylinder(d = 5, h = 1.5, $fn = resolution);

      // heatblock without silicon sock
      translate([0.0, 3.1, 12.15])
        cube([15.6, 21.0, 11.3], center = true);
      translate([0.0, 0.0, 6.5])
        cylinder(d = 6, h = 14.5, $fn = resolution);
    }

    // m3 hole in the frame
    for (i = [0.0, 90.0, 180.0, 270.0])
    {
      translate([35.0 / 2.0 - 18.65, 22.4, 31.0 + 15.0 / 2.0])
      for (j = [-1.0, 1.0])
      {
        rotate([0.0, i + 180.0, 0.0])
          translate([j * 7.5, 0.0, 35.0 / 2.0 - 5.8])
          cylinder(h = 5.9, d = 2.9, $fn = resolution);
      }
    }
  }
}

module carriage()
{
  translate([1.15,-42.4,-57]) union()
  {
    berd_air();
    translate([35 - 18.65,-13 / 2 + 22.40,-7 + 31])
      bl_touch_mount_main();
    biqu_h2o_extruder();
  }

  translate([0,0,2.6])difference()
  {
    union()
    {
      linear_rail_carriage_mount();
      belt_anker_structure();
    }
    for (i = [-1,1])
    {
      translate([19.5 * i,0,-0.1]) m3_mounting_hole();
    }
  }
}

//carriage();
