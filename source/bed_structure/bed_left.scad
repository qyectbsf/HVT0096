include <../global_vars.scad>
include <../stl_files/main.scad>

module bed_left()
{
  bed_left_rail_plate_mount();
  translate([-12.65 + 9.05,
             12.65 + 9.05,
             -24.82])
    rotate([-100,0,-48])
    rosengelenkstangenkugellager_mount();
}

module bed_left_rail_plate_mount()
{
  difference()
    {
      // main blob to subtract from
      hull()
        {
          translate([-30,6,0]) rotate([0,0,-48]) translate([-1,0.34 - 1,0]) cube([14,152,25]);
          translate([-23,-13,0]) cube([83,73,25]);
        }

      // alu profile
      translate([0,0,-0.1]) cube([100,20,20.1]);
      translate([0,0,-0.1]) cube([20,100,20.1]);

      // subtract non structural matter
      minkowski(convexity = 10)
        {
          difference()
            {
              hull()
                {
                  translate([-30,6,0]) rotate([0,0,-48]) translate([-1,80,0]) cube([14,90,25 - 6.5]);

                  translate([26.5,26.5,0]) cube([50,60,25 - 6.5]);
                }
              translate([-30,6,0]) rotate([0,0,-48]) translate([-1 - 4.5,50,0]) cube([14 + 9,150,25]);
            }
          sphere(d= 7, $fn = resolution);
        }
      translate([-60,30,18]) rotate([0,45,0]) cube([60,50,25]);
      minkowski(convexity = 10)
        {
          translate([-50,-20,0]) cube([150,20 - 3.5 - 3,25 - 3.5 - 3]);
          sphere(d= 7, $fn = resolution);
        }
      minkowski(convexity = 10)
        {
          translate([-40,3.5,6.5]) cube([40 - 6.5,13,10]);
          sphere(d= 7, $fn = resolution);
        }
      minkowski(convexity = 10)
        {
          translate([-40,26.5,0]) cube([40 - 6.5,14,25 - 3.5 - 3]);
          sphere(d= 7, $fn = resolution);
        }
      minkowski(convexity = 10)
        {
          translate([-40,26.5 + 14 + 10,0]) cube([40 - 6.5,20,25 - 3.5 - 3]);
          sphere(d= 7, $fn = resolution);
        }

      // subtract alu profile mount holes
      // x
      translate([0,10,10]) rotate([0,-90,0]) bed_alu_mount_hole();
      translate([0,33,10]) rotate([0,-90,0]) bed_alu_mount_hole();
      translate([0,56,10]) rotate([0,-90,0]) bed_alu_mount_hole();
      translate([20,56,10]) rotate([0,90,0]) bed_alu_mount_hole();
      // y
      translate([10,0,10]) rotate([90,0,0]) cylinder(h = 3.2, d = 5, $fn = resolution);
      translate([30,0,10]) rotate([90,0,0]) bed_alu_mount_hole();
      translate([50,0,10]) rotate([90,0,0]) bed_alu_mount_hole();
      translate([50,20,10]) rotate([-90,0,0]) bed_alu_mount_hole();
      // z
      translate([10,10,20]) bed_alu_mount_hole();
      translate([30,10,20]) bed_alu_mount_hole();
      translate([50,10,20]) bed_alu_mount_hole();
      translate([10,30,20]) bed_alu_mount_hole();
      translate([10,50,20]) bed_alu_mount_hole();

      // subtract m4 bed mount hole
      translate([-10,10, 19.9])  cylinder(h = 5.2, d = 4, $fn = resolution);

      // subtract rail mount hole
      translate([-10.1,15.8,6.9 - 5]) rotate([0,0,90 + 42])
        for (i = [0,3,4,5])
          translate([0, 21 - (12.5 + i * 25),0]) rotate([0,90,0]) mgn_screw_cutout();
    }
}


module bed_left_addatives()
{
  translate([0, 13 ,0]) rotate([180,0,0]) mgn_12_schiene_bed();

  translate([0,0,-21.8657]) rotate([10,0,0]) rotate([0,90,0]) rosengelenkstangenkugellager();

  translate([0,-12.85 ,0]) rotate([180,0,0]) mgn_12_h();
}
