include <../global_vars.scad>
include <../stl_files/main.scad>

include <../frame_structure/main.scad>

include <z_left.scad>
include <z_right.scad>
include <z_back.scad>

module z_structure()
{
  if ( show_z_struct == 1 )
    {
      // if ( show_z_left == 1 )
      //   {
      //     z_left();
      //   }
      // if ( show_z_right == 1 )
      //   {
      //     z_right();
      //   }
      // if ( show_z_back == 1 )
      //   {
      //     z_back();
      //   }
      // if ( show_z_rail == 1)
      //   {
           z_rail();
      //   }
      // if ( show_z_addatives == 1 )
      //   {
           z_addatives();
      //   }
    }
}

module z_rail()
{
  translate([-210,-232.5 + 9.5 + 33,-318 + 47])
  rotate([0,90,0])
  rail(MGN12, 480);
}

module z_addatives()
{
  translate([-210,-232.5 + 9.5 + 33, -123 - current_z_position])
  rotate([0,90,0])
    carriage(MGN12H_carriage);

  translate([-188.85, -160.38, -165 + 0.23  - current_z_position])
  sfu1204_nut();

  translate([-188.85, -160.38, -400 - 31])
  spindel(400);

  translate([-188.85, -160.38, -500 + 42]) union()
    {
      nema_17_25mm_shaft();
      translate([0,0,-20.9 - 39])
        cube([42,42,40], center = true);
    }
}
