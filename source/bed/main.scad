include <../global_vars.scad>
include <../stl_files/main.scad>

include <../frame/main.scad>

include <bed_left.scad>
include <bed_right.scad>
include <bed_back.scad>

bed_frame_x = 300.0;
bed_frame_y = 320.0;

bed_frame_offset_y = +35 - 3.5;

module bed()
{
  if ( show_bed_angle_marker == 1 )
    {
      translate([0,
                 -bed_frame_offset_y,
                 -current_z_position - 31.8675 - 4])
        # bed_rail_angle_marker();
        }

  if ( show_bed == 1 )
    {
      translate([0,
                 -35 + 3.5,
                 -current_z_position + 35])
        alu_plate();

      translate([0,
                 -bed_frame_offset_y,
                 -current_z_position])
        bed_frame();
    }

  if ( show_bed == 1 )
    {
      if ( show_left == 1 )
        {
          translate([-bed_frame_x / 2,
                     -bed_frame_y / 2 - bed_frame_offset_y,
                     -current_z_position - 10.0])
            bed_left();

          if ( show_addatives == 1 )
            {
              translate([-165 - 1.05 - 0.02,
                         -180 - 1.05 + 0.02,
                         -current_z_position - 10.0])
                rotate([0,0,180 -48])
                bed_left_addatives();
            }
        }

      if ( show_right == 1 )
        {
          translate([bed_frame_x / 2,
                     -bed_frame_y / 2 - bed_frame_offset_y,
                     -current_z_position - 10.0])
            bed_right();

          if ( show_addatives == 1 )
            {
              translate([+165 + 1.05 + 0.02,
                         -180 - 1.05 + 0.02,
                         -current_z_position - 10.0])
                rotate([0,0,180 +48])
                bed_right_addatives();
            }
        }

      if ( show_back == 1 )
        {
          translate([0,
                     124.5,
                     -31.8652 - current_z_position])
            bed_back();
          if ( show_addatives == 1 )
            {
              translate([0,
                         124.5,
                         -current_z_position - 10.0])
                bed_back_addatives();
            }
        }
    }
}

module bed_rail_angle_marker()
{
  union()
  {
    rotate([0,0,-90 -48]) translate([0,-6,0]) cube([340,12,8.1]);
    rotate([0,0,90])      translate([0,-6,0]) cube([340,12,8.1]);
    rotate([0,0,-90 +48]) translate([0,-6,0]) cube([340,12,8.1]);
  }
}

module alu_plate()
{
  cube([340,340,8], center = true);
}

module bed_frame()
{
  for (i = [-1,1])
    {
      translate([-280 / 2 * i,-320 / 2,0]) rotate([-90,0,0]) 20x20l_i_typ_nut_5_3d(320);
      translate([-260 / 2,-300 / 2 * i,0]) rotate([0,90,0]) 20x20l_i_typ_nut_5_3d(260);
    }
}
