include <BOSL2/std.scad>
include <BOSL2/screws.scad>
include <../global_vars.scad>


module block_front_right()
{
  difference()
    {
      // main structure to subtract from
      union()
        {
          translate([15, -15.0, -30.0]) cube([6.5, 65.0, 100.0]);
          translate([-15, 15, 10.0]) cube([30.0, 6.0, 60.0]);
          translate([-15, 15, 0.0]) cube([30.0, 3.0, 10.1]);

          translate([0.0, 22.50, 63.0]) hull()
            {
              translate([-15.0, -2.5, 0.0]) cube([30.0, 6.0, 7.0]);
              translate([18.0, 12.5, 3.5]) cube([6.0, 30.0, 7.0], center = true);
            }

          translate([-15.0, 20.0, 14.0]) cube([30.0, 30.0, 6.5]);
        }

      // space for idler
      translate([18.5, 30, lower_belt_idler_z - 1.25]) idler_cutout(21);

      // space for 3mm stab
      translate([18.5,30,40])
        cylinder(h =70.0, d = 3mm_stab, $fn = resolution, center = true);

      // m6 mount hole for frame connectivity
      translate([0, 15 + 3, 50.0])
        rotate([90.0, 0.0, 0.0])
        cylinder(h = 6.2, d = m6_screw, center = true, $fn = resolution);

      for (i = [-15.0, 20.0, 55.0])
        {
          translate([18.0, 0, i])
            rotate([0.0, 90.0, 0.0])
            cylinder(h = 8.2, d = m6_screw, center = true, $fn = resolution);
        }

      translate([18, 30, -15.0])
        rotate([0.0, 90.0 ,0.0])
        cylinder(h = 10, d = m6_screw, center = true, $fn = resolution);
    }
}

module block_front_right_addatives()
{
  // idler
  translate([+18.5, 30, lower_belt_z - 2 + 0.75]) rotate([0,0,0]) pulley(GT2x20_toothed_idler);

  // 3mm stab
  translate([+18.5, 30, 40])
    cylinder(h =70.0, d = 3mm_stab, $fn = resolution, center = true);

  if ( show_screws == 1) {
    // m6 screw
    translate([0, 15 + 3 -1 + 1.6, 50.0])
      union() {
      rotate([-90.0, 0.0, 0.0])
        screw("M6", length=14, head="socket", drive="hex");

      // washer
      translate([0, 3.2, 0])
        rotate([90,0,0])
        tube(id=6.4, od=18.0, h=1.6);

      // t sliding nut
      translate([0,-5.6,0])
        rotate([90,90,0])
        sliding_t_nut(M6_sliding_t_nut);
    }

    for (i = [-15.0, 20.0, 55.0])
      {
        translate([19.1, 0, i])
          union() {
          rotate([0.0, 90.0, 0.0])
            screw("M6", length=14, head="socket", drive="hex");

          translate([3.2, 0, 0])
            rotate([0, -90, 0])
            tube(id=6.4, od=18.0, h=1.6);

          translate([-6.1, 0, 0])
            rotate([90, 90, -90])
            sliding_t_nut(M6_sliding_t_nut);
        }
      }

    translate([19.1, 30, -15.0])
      union() {
      rotate([0.0, 90.0, 0.0])
        screw("M6", length=14, head="socket", drive="hex");

      translate([3.2, 0, 0])
        rotate([0, -90, 0])
        tube(id=6.4, od=18.0, h=1.6);

      translate([-6.1, 0, 0])
        rotate([90, 90, -90])
        sliding_t_nut(M6_sliding_t_nut);
    }
  }
}
