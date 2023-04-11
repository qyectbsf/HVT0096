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
      if ( show_z_left == 1 )
        {
          z_left();
        }
      if ( show_z_right == 1 )
        {
          z_right();
        }
      if ( show_z_back == 1 )
        {
          z_back();
        }
    }
}
