include <MCAD/stepper.scad>
include <MCAD/2Dshapes.scad>;

include <global_vars.scad>

/* include <carriage/main.scad> */

include <xy_structure/main.scad>
include <z_structure/main.scad>
include <bed/main.scad>
include <frame/main.scad>
include <stl_files/main.scad>

//$vpr = [0,0,37.2];

module main()
{
  color([0.90, 0.90, 0.90]) frame();

  translate([0, 110,0]) z_structure();

  translate([0, 110, -46.8348 - 0.05]) bed();

  xy_structure();

  //color([0.20, 0.20, 0.20]) translate([0,220 + 150,0]) rotate([0,0,180]) belt_tentioner();

  // printer has a y offset of + 15 mm
  //translate([0, current_y_position, 18]) y_movement();

  //translate([0,270,0]) tool_changer();
}

main();
