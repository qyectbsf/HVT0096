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
include <xy_block_back.scad>

module xy_structure()
{
  if ( show_belts == 1 )
    {
      color("green") translate([0,0,upper_belt_z + 3]) upper_belt();
      color("blue")  translate([0,0,lower_belt_z + 3]) lower_belt();
    }

  if ( show_xy_struct == 1 )
    {
      if ( show_xy_front_left == 1)
        {
          translate([-225.0, -220.0, 0.0]) union()
            {
              block_front_left();
              if ( show_xy_front_left_addatives == 1 )
                {
                  block_front_left_addatives();
                }
            }
        }

      if ( show_xy_front_right == 1)
        {
          translate([ 225.0, -220.0, 0.0]) union()
            {
              block_front_right();
              if ( show_xy_front_right_addatives == 1 )
                {
                  block_front_right_addatives();
                }
            }
        }

      if ( show_xy_back_left == 1)
        {
          translate([-225,220,0]) union()
            {
              block_back_left();
              if ( show_xy_back_left_addatives == 1 )
                {
                  block_back_left_addatives();
                }
            }
        }

      if ( show_xy_back_right == 1)
        {
          translate([225,220,0]) union()
            {
              block_back_right();
              if ( show_xy_back_right_addatives == 1 )
                {
                  block_back_right_addatives();
                }
            }
        }

      if ( show_xy_left == 1)
        {
          translate([-240,0,0]) union()
            {
              // block_left();
              if ( show_xy_left_addatives == 1 )
                {
                  block_left_addatives();
                }
            }
        }

      if ( show_xy_right == 1)
        {
          translate([240,0,0]) union()
            {
              // block_right();
              if ( show_xy_right_addatives == 1 )
                {
                  block_right();
                }
            }
        }

      if ( show_xy_back == 1 )
        {
          translate([0,0,0]) union()
            {
              // block_back();
              if ( show_xy_back_addatives == 1 )
                {
                  block_back_addatives();
                }
            }
        }

      if ( show_y_rail == 1)
        {
          for (i = [-1,1]){
            translate([i * (205 + 14 + 6), 0, 0])
              rotate([0,0,90])
              rail(MGN12, 400);
          }
        }


      if ( show_y_struct == 1)
        {
          translate([0, current_y_position, 0]) y_movement();

          if ( show_x_rail == 1)
            {
              translate([0,205,500])
                x_rail();
            }

        }
    }
}
