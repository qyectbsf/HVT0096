include <../global_vars.scad>

module bl_touch_mount_cube()
{
  translate([0.0, 0.0, 2.5])
    cube([10.0, 30.0, 5.0], center = true);
}

module bl_touch_mount_holes()
{
  translate([0.0, 0.0, -0.1])
    cylinder(h = 5.2, d = 5, $fn = resolution);
  for (y = [-9.0, 9.0])
  {
    translate([0.0, y, -0.1])
      cylinder(h = 5.2, d = 2.9, $fn = resolution);
  }
}

module bl_touch_mount()
{
  difference()
  {
    translate([0.0, 0.0, 2.5])
      cube([10.0, 30.0, 5.0], center = true);
    translate([0.0, 0.0, -0.1])
      cylinder(h = 5.2, d = 5, $fn = resolution);
    for (y = [-9.0, 9.0])
    {
      translate([0, y, -0.1])
        cylinder(h = 5.2, d = 2.9, $fn = resolution);
    }
  }
}

module h2o_mount()
{
  difference()
  {
    cube([5.0, 13.0, 30.0]);
    for (z = [7.0, 22.0])
    {
      translate([-0.1, 13.0 / 2.0, z])
        rotate([0.0, 90.0, 0.0])
        cylinder(h = 5.2, d = 3.0, $fn = resolution);
    }
  }
}

module combination_structure()
{
  hull()
  {
    translate([15.0, 0.0, 20.0])
      cube([10.0, 3.0, 5.0]);
    translate([5.0, 0.0, 0.0])
      cube([1.0, 3.7, 30.0]);
  }
}

module bl_touch_mount_main()
{
  union()
  {
    combination_structure();
    translate([20,-15,20]) bl_touch_mount();
    h2o_mount();
  }
}

//bl_touch_mount_main();
