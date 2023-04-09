include <../global_vars.scad>
include <../stl_files/main.scad>

module y_movement()
{

  // 20x20 alu profile

  translate([0, -130, 28]) cube([420,20,20], center = true);

  /* translate([0,- 152.15 + 65,19.2]) x_schiene(0); */

  for ( i = [1,-1] ) translate([(30/2 + 420/2)*i, -130 - 44.4 / 2, 0]) mgn_12_h();

  for ( i = [1,-1] )
    {
      translate([i * 211.5, -130, 13])
        rotate([0,0,i * 90])
        y_rail_mount();

      y_rail_mount_addatives();
    }

  translate([current_x_position, 0,0]) x_movement();
}

module x_movement()
{
  //translate([22.2 + - 150, - 152.15 + 65,19.2]) rotate([0,180,90]) mgn_12_h();
  translate([22.2 + - 150, - 152.15 + 65,19.2+ 20]) rotate([0,0,90]) mgn_12_h();

  //translate([- 150,- 152.14 + 65,0]) carriage_qye();
  //translate([-150,- 152.14 + 65, 26.2 + 13 - 52]) carriage_e3d();
}

module y_rail_mount()
{
  // first
  difference()
    {
      y_rail_mount_base();
      // rail mount
      for ( x = [-1, 1] )
        {
          for ( y = [-1, 1] )
            {
              translate([x * 20 / 2,y * 20 / 2 - 10 - 3.5,- 0.1]) cylinder(h = 5 + 0.2, d = m3_screw_loose, $fn = resolution);
              translate([x * 20 / 2,y * 20 / 2 - 10 - 3.5,5]) cylinder(h = 10 + 0.2, d = m3_screw_head, $fn = resolution);
            }
        }
      // combiner
      for ( y = [-3.5, -13.5, -23.5] )
        {
          translate([0, y,- 0.1]) cylinder(h = 15 + 0.2, d = m3_screw_tight, $fn = resolution);
        }
    }

  // second
  difference()
    {
      translate([0,0,30]) rotate([0,180,0]) y_rail_mount_base();
      // combiner
      for ( y = [-3.5, -13.5, -23.5] )
        {
          translate([0, y,15 - 0.1]) cylinder(h = 5 + 0.2, d = m3_screw_tight, $fn = resolution);
          translate([0, y,20 - 0.1]) cylinder(h = 10 + 0.2, d = m3_screw_head, $fn = resolution);
        }
    }
}

module y_rail_mount_base()
{
  length = 60;

  difference()
    {
      union()
      {
        translate([-length / 2, -27,0]) cube([length, 27, 5]);
        translate([-26 / 2, 0, 0]) cube([26, 27, 5]);

        translate([-20 / 2, -27, 5]) cube([20, 27, 10]);
        translate([10 , -27, 5]) cube([20, 27, 10]);
        translate([10 , 0, 5]) cube([3, 27, 10]);
        translate([-13 , 0, 5]) cube([3, 27, 2]);
        translate([-30 , -27, 5]) cube([20, 27, 1]);
      }
      translate([10  , -27 - 0.1, 14]) cube([20.1, 20.1, 2.1]);
      translate([20,-16.5,2]) cylinder(h = 15, d = 5mm_stab ,$fn = resolution);

      translate([-30 -0.1  , -27 - 0.1, 4]) cube([20.1, 20.1, 2.1]);
      translate([-20,-16.5,2]) cylinder(h = 10, d = 5mm_stab ,$fn = resolution);

      // alu profile mount
      for ( z = [0,23] )
        {
          for ( y = [10,20] )
            {
              translate([0,y,z - 0.1]) cylinder(h = 5 + 0.2, d = m5_screw_tight, $fn = resolution);
            }
        }
    }
  difference()
    {
      translate([-20,-16.5,4]) cylinder(h = 1, d1 = 9, d2 = 6,$fn = resolution);
      translate([-20,-16.5,4 - 0.1]) cylinder(h = 1.2, d = 5mm_stab,$fn = resolution);
    }

  difference()
    {
      translate([20,-16.5,14]) cylinder(h = 1, d1 = 9, d2 = 6,$fn = resolution);
      translate([20,-16.5,14 - 0.1]) cylinder(h = 1.2, d = 5mm_stab,$fn = resolution);
    }
}

module y_rail_mount_addatives()
{
  for ( i = [-1,1] )
    {
      translate([i * 228, -130 + i * -20, lower_belt_z - 2])
        rotate([90,0,0])
        gates_2gt_20t_smooth_idler();

      translate([i * 228,  -130 + i * 20, upper_belt_z -2])
        rotate([90,0,0])
        gates_2gt_20t_toothed_idler();
    }
}
