include <MCAD/stepper.scad>
include <MCAD/2Dshapes.scad>
include <nopSCADlib/lib.scad>
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

  translate([0, 110 - 77, 570])
    z_structure();

  translate([0, 110 - 77, -46.8348 - 0.05 + 570.00])
    bed();

  translate([0,0, 570])
    xy_structure();
}

main();
