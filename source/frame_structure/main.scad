include <nopSCADlib/lib.scad>

module frame()
{
  if ( show_frame == 1 )
    {
      translate([ 210 + 15,-205 - 15, 440]) extrusion(E3030, 880, cornerHole = true);
      translate([-210 - 15,-205 - 15, 440]) extrusion(E3030, 880, cornerHole = true);
      translate([-210 - 15, 205 + 15, 440]) extrusion(E3030, 880, cornerHole = true);
      translate([ 210 + 15, 205 + 15, 440]) extrusion(E3030, 880, cornerHole = true);

      translate([0,-205 - 15,       15]) rotate([0,90,0]) extrusion(E3030, 420, cornerHole = true);
      translate([0, 205 + 15,       15]) rotate([0,90,0]) extrusion(E3030, 420, cornerHole = true);
      translate([0, 205 + 15, 510 + 45]) rotate([0,90,0]) extrusion(E3030, 420, cornerHole = true);
      // translate([0,-205 - 15, 880 - 15]) rotate([0,90,0]) extrusion(E3030, 420, cornerHole = true);
      // translate([0, 205 + 15, 880 - 15]) rotate([0,90,0]) extrusion(E3030, 420, cornerHole = true);

      translate([-210 - 15, 0,       15]) rotate([-90,0,0]) extrusion(E3030, 410, cornerHole = true);
      translate([ 210 + 15, 0,       15]) rotate([-90,0,0]) extrusion(E3030, 410, cornerHole = true);
      translate([-210 - 15, 0, 510 + 45]) rotate([-90,0,0]) extrusion(E3030, 410, cornerHole = true);
      translate([ 210 + 15, 0, 510 + 45]) rotate([-90,0,0]) extrusion(E3030, 410, cornerHole = true);
      // translate([-210 - 15, 0, 880 - 15]) rotate([-90,0,0]) extrusion(E3030, 410, cornerHole = true);
      // translate([ 210 + 15, 0, 880 - 15]) rotate([-90,0,0]) extrusion(E3030, 410, cornerHole = true);

      translate([-225,-205 + 15, 30 + 510 / 2]) extrusion(E3030, 510, cornerHole = true);
      translate([ 225,-205 + 15, 30 + 510 / 2]) extrusion(E3030, 510, cornerHole = true);
      translate([   0, 205 + 15, 30 + 510 / 2]) extrusion(E3030, 510, cornerHole = true);
    }
}
