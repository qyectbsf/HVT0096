module bl_touch_mount_cube()
{
  translate([0,0,2.5]) cube([10,30,5], center = true);
}

module bl_touch_mount_holes()
{
  translate([0,0,-0.1]) cylinder(h = 5.2, d = 5, $fn = 200);
  for (y = [-9,9])
  {
    translate([0,y,-0.1]) cylinder(h = 5.2, d = 2.9, $fn = 200);
  }
}

module bl_touch_mount()
{
  difference()
  {
    translate([0,0,2.5]) cube([10,30,5], center = true);
    translate([0,0,-0.1]) cylinder(h = 5.2, d = 5, $fn = 200);
    for (y = [-9,9])
    {
      translate([0,y,-0.1]) cylinder(h = 5.2, d = 2.9, $fn = 200);
    }
  }
}

module h2o_mount()
{
  difference([])
  {
    cube([5,13,30]);
    for (z = [7,7 + 15])
    {
      translate([-0.1,13/2,z]) rotate([0,90,0]) cylinder(h = 5.2, d = 3, $fn = 200);
    }
  }
}

module fuse()
{
  hull()
  {
    translate([15,0,20]) cube([10,3,5]);
    translate([5,0,0]) cube([1,3.7,30]);
  }
}

module bl_touch_mount_main()
{
  fuse();
  translate([20,-15,20]) bl_touch_mount();
  h2o_mount();
}

//bl_touch_mount_main();
