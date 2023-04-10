include <../global_vars.scad>

module block_left()
{
  for ( y = [285,37.5] )
    {
      translate([0,y,0]) block_left_base();
    }
}

module block_left_base()
{
  difference()
    {
      rotate([90,0,0])
        linear_extrude(height = 495/2, convexity = 10)
        polygon(points = [[0,-30], [-5,-30], [-5,-10],
                          [-40,lower_belt_z], [-40,upper_belt_z + 6], [-5,70],
                          [0,70], [0,68], [-33,upper_belt_z + 6],
                          [-33,lower_belt_z], [0,-8]]);

      for ( y = [41.25:41.25:206.25] )
        {
          translate([1,-y,-15]) rotate([0,-90,0]) xy_m6_screw_cutout();
        }
    }
}

module block_left_addatives()
{
}
