include <../global_vars.scad>
include <../stl_files/main.scad>

module bed_right()
{
  mirror([1,0,0]) bed_left();
}

module bed_right_addatives()
{
  mirror([1,0,0]) bed_left_addatives();
}
