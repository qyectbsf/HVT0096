include <../global_vars.scad>
include <xy_block_left.scad>


module block_right()
{
  mirror([1,0,0]) block_left();
}

module block_left_addatives()
{
  mirror([1,0,0]) block_left_addatives();
}
