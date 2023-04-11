include <MCAD/stepper.scad>
include <MCAD/2Dshapes.scad>
include <global_vars.scad>

include <xy_structure/main.scad>
include <z_structure/main.scad>
include <bed_structure/main.scad>
include <frame_structure/main.scad>
include <stl_files/main.scad>

//$vpr = [0,0,37.2];

module main()
{
  frame();

  translate([0, 110,0])
    z_structure();

  translate([0, 110, -46.8348 - 0.05])
    bed();

  xy_structure();

  //translate([0,270,0]) tool_changer();
}

main();
