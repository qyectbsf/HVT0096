include <../global_vars.scad>
include <../stl_files/main.scad>

include <../frame/main.scad>

include <z_left.scad>
include <z_right.scad>
include <z_back.scad>

module z_structure()
{
  if ( show_z_struct == 1 )
    {
      if ( show_left == 1 )
        {
          z_left();
        }
      if ( show_right == 1 )
        {
          z_right();
        }
      if ( show_back == 1 )
        {
          z_back();
        }
    }
}
