include <../global_vars.scad>
include <../stl_files/main.scad>


module bed_back()
{
  translate([0,-16.75 - 2.5,-2.95]) rotate([-100,0,180]) rosengelenkstangenkugellager_mount();
  bed_back_rail_mount();
  bed_back_plate_left();
  bed_back_plate_right();
}

module bed_back_addatives()
{
  translate([0, 21 ,0]) rotate([180,0,0]) mgn_12_schiene_bed();

  translate([0, 0 - 2.5, -21.8675]) rotate([10,0,0]) rotate([0,90,0]) rosengelenkstangenkugellager();

  translate([0, -12.85 - 2.5, 0]) rotate([180,0,0]) mgn_12_h();
}

module bed_back_rail_mount()
{
  difference()
    {
      hull()
        {
          translate([-7, -130, 21.8657]) cube([14, 152, 23]);
          translate([-49, -22 + 3, 21.8657]) cube([14 + 2 * 42, 26, 23]);
        }
      translate([-49 - 0.1, -22 + 3 + 3, 21.8657 - 0.1]) cube([14.2 + 2 * 42, 20, 20.2]);

      for (i = [-1,1])
        {
          translate([i * 3.5, 3.5,-3.5]) minkowski()
            {
              translate([i * 28 - 21, 7, 21.8657 - 0.1]) cube([42, 20, 20.2]);
              sphere(d = 7, $fn = resolution);
            }
          translate([i * 3.5, -3.5,-3.5]) minkowski()
            {
              translate([i * 28 - 21, -130, 21.8657 - 0.1]) cube([42, 111, 20.2]);
              sphere(d = 7, $fn = resolution);
            }
        }

      for (r = [0,1,2])
        {
          for (x = [-2,-1,1,2])
            {
                translate([x * 18,-6, 31.8657]) rotate([0,r * -90,90]) translate([6.1,0,0]) mgn_screw_cutout();
            }
        }

      for (i = [0,2,3,4,5])
        translate([0, 21 - (12.5 + i * 25),21.8657 + 7]) rotate([0,90,0]) mgn_screw_cutout();
    }
}

module bed_back_plate_left()
{
  difference()
    {
      translate([-170,-36,21.8657]) cube([60,50,25]);

      // alu profile
      translate([-150,-36 - 0.1,21.8657 - 0.1]) cube([20,40.1,20.1]);
      translate([-130 -0.1,-36 + 20,21.8657 - 0.1]) cube([20.2,20,20.1]);

      // deco and structure
      translate([-170 - 22,-36,21.8657 + 7]) rotate([0,50,0]) cube([60,50,25]);

      translate([-3.5, -3.5,-3.5]) minkowski()
        {
          translate([-166.5,-32.5,21.8657 - 0.1 + 3.5]) cube([13.5, 13.5,16.6]);
          sphere(d = 7, $fn = resolution);
        }
      translate([-3.5, -3.5,-3.5]) minkowski()
        {
          translate([-166.5,3.5 - 9 - 3.5,21.8657 - 0.1  + 3.5]) cube([13.5,13, 16.6]);
          sphere(d = 7, $fn = resolution);
        }
      translate([3.5, -3.5,-3.5]) minkowski()
        {
          translate([-127,-32.5,21.8657 - 0.1 + 3.5]) cube([13.5,13.5,16.6]);
          sphere(d = 7, $fn = resolution);
        }
      translate([3.5, -3.5,-3.5]) minkowski()
        {
          translate([-170 - 3.5 ,-32.5 + 40 + 6.5,21.8657 - 0.1 + 3.5]) cube([60,3.5,16.6]);
          sphere(d = 7, $fn = resolution);
        }

      // alu profile m3 screw
      h = 31.8657;
      // x
      translate([-140 - 13.1,-36 + 8.5, h])  rotate([0,90,0]) cylinder(h = 3.2, d = 2.9, $fn = resolution);
      translate([-140 - 13.1,-36 + 30,  h])  rotate([0,90,0]) cylinder(h = 3.2, d = 2.9, $fn = resolution);
      translate([-140 + 9.9,-36 + 8.5, h])  rotate([0,90,0]) cylinder(h = 3.2, d = 2.9, $fn = resolution);

      // y
      translate([-140,3.9, h])  rotate([-90,0,0]) cylinder(h = 3.2, d = 5, $fn = resolution);
      translate([-120,3.9, h])  rotate([-90,0,0]) cylinder(h = 3.2, d = 2.9, $fn = resolution);
      translate([-120,-19.1, h])  rotate([-90,0,0]) cylinder(h = 3.2, d = 2.9, $fn = resolution);

      // z
      translate([-140 ,-36 + 30,  h + 9.9])  cylinder(h = 5.2, d = 2.9, $fn = resolution);
      translate([-140 ,-36 + 8.5, h + 9.9])  cylinder(h = 5.2, d = 2.9, $fn = resolution);
      translate([-140 + 20,-36 + 30,  h + 9.9])  cylinder(h = 5.2, d = 2.9, $fn = resolution);

      // alu plate m4 screw
      translate([-140 - 23,-36 + 30,  h + 9.9])  cylinder(h = 5.2, d = 4, $fn = resolution);
    }
}


module bed_back_plate_right()
{
  mirror([1,0,0]) bed_back_plate_left();
}
