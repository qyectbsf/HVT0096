include <../global_vars.scad>

module pulley_front_left()
{
  difference()
  {
    // main structure to subtract from
    union()
    {
      translate([0.0, 0.0, 0.0]) cube([6.0, 65.0, 100.0], center = true);
      translate([3.0, -2.5, -10.0]) cube([30.0, 6.0, 60.0]);
      translate([3.0, -2.5, -20.0]) cube([5.0, 6.0, 10.0]);
      translate([6.0, 27.4 - 3.0, 35.0]) cube([9.0, 16.2, 13.0], center = true);

      for (z = [-10.0, 43.0])
      {
        translate([0.0, 0.0, z]) hull()
        {
          translate([3.0, -2.5, 0.0]) cube([30.0, 6.0, 7.0]);
          translate([0.0, 12.5, 3.5]) cube([6.0, 30.0, 7.0], center = true);
        }
      }
    }

    // space for optical sensor
    translate([13.5, 27.4 - 3.0, 33.8]) cube([9.0, 11.7 - 1.6, 13.0], center = true);
    translate([13.5 - 1.7, 27.4 - 3.0, 27.0]) cube([9.0, 5.0, 13.0], center = true);

    // m3 hole to mount optical sensor into
    translate([4.0, 27.38 - 3.0, 36.7])
      rotate([0.0, 90.0, 0.0])
      cylinder(h = 15.0, d = 2.9, center = true, $fn = resolution);

    // space for connector of optical sensor
    translate([0.0, 27.4 - 3.0, 9.45]) cube([6.2, 12.0, 7.7], center = true);

    // space for idler
    translate([0.0,(65.0 / 8.0), -20.0 + upper_belt_z -1.0]) pulley_cutout(19.5);

    // space for 3mm stab
    translate([0.0,(65.0 / 8.0), 26.0]) cylinder(h = 50.0, d = 3mm_stab, $fn = resolution, center = true);

    // m6 mount hole for frame connectivity
    translate([3.0 + 15.0, 0.5, 20.0])
      rotate([90.0, 0.0, 0.0])
      cylinder(h = 6.2, d = m6_screw, center = true, $fn = resolution);
    for (i = [-35.0, 0.0, 35.0])
    {
      translate([0.0, (-65.0 / 2.0) + 15.0, i])
        rotate([0.0, 90.0, 0.0])
        cylinder(h = 6.2, d = m6_screw, center = true, $fn = resolution);
    }
    translate([0.0, (65.0 / 2) - 15.0, -35.0])
      rotate([0.0, 90.0 ,0.0])
      cylinder(h = 6.2, d = m6_screw, center = true, $fn = resolution);
  }
}

module pulley_front_right()
{
  difference()
  {
    // main structure to subtract from
    union()
    {
      translate([0.0 ,0.0 ,0.0]) cube([6.0, 65.0, 100.0], center = true);
      translate([-33.0, -2.5, -10.0]) cube([30.0, 6.0, 60.0]);
      translate([-8.0, -2.5, -20.0]) cube([5.0, 6.0, 10.0]);
      for (z = [-10.0, 43.0])
      {
        translate([0.0, 0.0, z]) hull()
        {
          translate([-33.0, -2.5, 0.0]) cube([30.0, 6.0, 7.0]);
          translate([0.0, 12.5, 3.5]) cube([6.0, 30.0, 7.0], center = true);
        }
      }
    }

    // space for idler
    translate([0.0, (65.0 / 8.0), -20.0 + lower_belt_z -1.0]) pulley_cutout(19.5);

    // space for 3mm stab
    translate([0.0, (65.0 / 8.0), 26.0]) cylinder(h = 70.0, d = 3mm_stab, $fn = resolution, center = true);

    // m6 mount hole for frame connectivity
    translate([-18.0, 0.5, 20.0])
      rotate([90.0, 0.0, 0.0])
      cylinder(h = 6.2, d = m6_screw, center = true, $fn = resolution);
    for (i = [-35.0, 0.0, 35.0])
    {
      translate([0.0, (-65.0 / 2.0) + 15.0, i])
        rotate([0.0, 90, 0.0])
        cylinder(h = 6.2, d = m6_screw, center = true, $fn = resolution);
    }
    translate([0.0, (65.0 / 2.0) - 15.0, -35.0])
      rotate([0.0, 90.0, 0.0])
      cylinder(h = 6.2, d = m6_screw, center = true, $fn = resolution);
  }
}

//pulley_front_left();
//pulley_front_right();
