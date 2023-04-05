include <../global_vars.scad>
include <../stl_files/main.scad>

module belt_gear()
{
  difference()
    {
      cylinder(h = belt_height, d = 15, $fn = resolution);
      translate([0,0,-0.1]) cylinder(h = belt_height + 0.2, d = 12, $fn = resolution);
    }
}

module lower_belt()
{
  // lines
  for ( i = [0:9] )
    {
      translate([lower_belt_x_coordinates[i], lower_belt_y_coordinates[i], 0])
        rotate([0,0,lower_belt_rotations[i]])
        translate([-belt_thickness / 2,0,0])
        cube([belt_thickness, lower_belt_split_lengths[i], belt_height]);
    }

  // gear
  for ( i = [0:8] )
    {
      translate([lower_belt_idler_x_coordinates[i],
                 lower_belt_idler_y_coordinates[i],
                 0])
        belt_gear();
    }
}

module upper_belt()
{
  // lines
  for ( i = [0:9] )
    {
      translate([upper_belt_x_coordinates[i], upper_belt_y_coordinates[i], 0])
        rotate([0,0,upper_belt_rotations[i]])
        translate([-belt_thickness / 2,0,0])
        cube([belt_thickness, upper_belt_split_lengths[i], belt_height]);
    }

  // gears
  for ( i = [0:8] )
    {
      translate([upper_belt_idler_x_coordinates[i],
                 upper_belt_idler_y_coordinates[i],
                 0])
        belt_gear();
    }
}
