include <../global_vars.scad>
include <../stl_files/main.scad>

include <z_left.scad>

module z_right()
{
  translate([225, -190, -512]) z_right_bottom_object();
  if ( show_addatives == 1 )
    {
      translate([225, -190, -512]) z_right_bottom_object_addatives();
    }

  translate([+225 - ball_screw_left_relative_x,
             -190 + ball_screw_left_relative_y,
             -210 + z_bottom_object_height - 0.2 + 24 - current_z_position])
    z_right_middle_object();
  if ( show_addatives == 1 )
    {
      translate([+225 - ball_screw_left_relative_x,
                 -190 + ball_screw_left_relative_y,
                 -210 + z_bottom_object_height - 0.2 + 24 - current_z_position])
        z_right_middle_object_addatives();
    }

  translate([225,-190,-41]) z_right_top_object();
  if ( show_addatives == 1 )
    {
      translate([225,-190,-41]) z_right_top_object_addatives();
    }

  if ( show_addatives == 1 )
    {
      translate([210, -190, -30]) rotate([-90,0,90]) z_rail();
      translate([+225 - ball_screw_left_relative_x,
                 -190 + ball_screw_left_relative_y,
                 -512 + z_bottom_object_height + mcl_clamp_height])
        rotate([0,-90,90])
        z_ball_screw_spindel();
      translate([+225 - ball_screw_left_relative_x,
                 -190 + ball_screw_left_relative_y,
                 -210 + z_bottom_object_height - 0.2 - 160 - current_z_position])
        rotate([0,-90,90])
        z_ball_screw_flanschmutter();
    }
}

module z_right_top_object()
{
  mirror([1,0,0]) z_left_top_object();
}

module z_right_top_object_addatives()
{
  mirror([1,0,0]) z_left_top_object_addatives();
}

module z_right_middle_object()
{
  mirror([1,0,0]) z_left_middle_object();
}

module z_right_middle_object_addatives()
{
  mirror([1,0,0]) z_left_middle_object_addatives();
}

module z_right_bottom_object()
{
  mirror([1,0,0]) z_left_bottom_object();
}

module z_right_bottom_object_addatives()
{
  mirror([1,0,0]) z_left_bottom_object_addatives();
}
