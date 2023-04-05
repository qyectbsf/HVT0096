include <../global_vars.scad>
include <../stl_files/main.scad>

include <xy_belt.scad>
include <xy_movement.scad>
include <corner_mount.scad>

module xy_structure()
{
  translate([0, -130 + current_y_position, 28]) cube([420,20,20], center = true);

  if ( show_belts == 1 )
    {
      color("green") translate([0,0,upper_belt_z]) upper_belt();
      color("blue") translate([0,0,lower_belt_z]) lower_belt();
    }

  for ( i = [-1,1] ) translate([(30/2 + 420/2) * i, -225, 0]) y_rail();

  translate([-225.0, -260.0, 0.0]) block_front_left();
  translate([-241.5, -230.0, 0.0]) block_front_left_addatives();

  translate([ 225.0, -260.0, 0.0]) block_front_right();
  translate([ 241.5, -230.0, 0.0]) block_front_right_addatives();

  translate([0, current_y_position, 0]) y_movement();
}
