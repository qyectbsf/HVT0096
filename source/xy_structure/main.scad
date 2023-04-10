include <../global_vars.scad>
include <../stl_files/main.scad>

include <xy_belt.scad>
include <xy_movement.scad>

include <xy_block_back_left.scad>
include <xy_block_back_right.scad>
include <xy_block_front_left.scad>
include <xy_block_front_right.scad>

include <xy_block_left.scad>
include <xy_block_right.scad>

module xy_structure()
{
  if ( show_belts == 1 )
    {
      color("green") translate([0,0,upper_belt_z]) upper_belt();
      color("blue") translate([0,0,lower_belt_z]) lower_belt();
    }

  if ( show_xy_struct == 1 )
    {
      //for ( i = [-1,1] ) translate([225 * i, -225, 0]) y_rail();

      if ( show_xy_front_left == 1)
        {
          translate([-225.0, -260.0, 0.0]) union()
            {
              block_front_left();
              block_front_left_addatives();
            }
        }

      if ( show_xy_front_right == 1)
        {
          translate([ 225.0, -260.0, 0.0]) union()
            {
              block_front_right();
              block_front_right_addatives();
            }
        }

      if ( show_xy_back_left == 1)
        {
          translate([-225,370,0]) union()
            {
              block_back_left();
              block_back_left_addatives();
            }
        }

      if ( show_xy_back_right == 1)
        {
          translate([225,370,0]) union()
            {
              block_back_right();
              block_back_right_addatives();
            }
        }

      if ( show_xy_left == 1)
        {
          translate([-240,0,0]) union()
            {
              block_left();
            }
        }

      if ( show_xy_right == 1)
        {
          translate([240,0,0]) union()
            {
              block_right();
            }
        }


      //translate([0, current_y_position, 0]) y_movement();
    }
}
