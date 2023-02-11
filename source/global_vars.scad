lower_belt_z = 22.05;
upper_belt_z = 33.20;

belts_max_space = 21.95;

m4_screw = 4.5;
m6_screw = 6.1;

m4_nut = 8.4;

3mm_stab = 3.2;

// 10 for compile speed 200 for final export
resolution = 20.0;

pulley_cutout_height = 10.8;

module pulley_cutout(width)
{
  difference()
  {
    translate([0.0, 0.0, pulley_cutout_height/2])
      cylinder(h = pulley_cutout_height, d = width, center = true, $fn = resolution);
    pulley_cutout_inverse(width);
  }
}

module pulley_cutout_inverse(width)
{
  bearing_mount_inner_width = 4.4;
  bearing_mount_outer_width = 9.0;
  bearing_mount_height = 1.0;

  difference()
  {
    union()
    {
      translate([0.0, 0.0, pulley_cutout_height/2 + 4.9])
        cylinder(h = bearing_mount_height,
                 d1 = bearing_mount_inner_width,
                 d2 = bearing_mount_outer_width,
                 center = true,
                 $fn = resolution);
      translate([0.0, 0.0, pulley_cutout_height/2 - 4.9])
        cylinder(h = bearing_mount_height,
                 d1 = bearing_mount_outer_width,
                 d2 = bearing_mount_inner_width,
                 center = true,
                 $fn = resolution);
    }
    translate([0.0, 0.0, pulley_cutout_height/2])
      cylinder(h = pulley_cutout_height, d = 3mm_stab, center = true, $fn = resolution);
  }
}

//pulley_cutout(20);
//pulley_cutout_inverse(20);
