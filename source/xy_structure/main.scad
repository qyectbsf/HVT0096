include <../global_vars.scad>
include <../stl_files/main.scad>

include <xy_belt.scad>
include <xy_movement.scad>
include <corner_mount.scad>

module xy_structure()
{
  if ( show_belts == 1 )
    {
      color("green") translate([0,0,upper_belt_z]) upper_belt();
      color("blue") translate([0,0,lower_belt_z]) lower_belt();
    }

  if ( show_xy_struct == 1 )
    {
      for ( i = [-1,1] ) translate([225 * i, -225, 0]) y_rail();

      translate([-225.0, -260.0, 0.0]) union()
        {
          block_front_left();
          block_front_left_addatives();
        }

      translate([ 225.0, -260.0, 0.0]) union()
        {
          block_front_right();
          block_front_right_addatives();
        }

      translate([-225,370,0]) union()
        {
          block_back_left();
          block_back_left_addatives();
        }

      translate([0, current_y_position, 0]) y_movement();
    }
}
