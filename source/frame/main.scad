module frame()
{
  for (x = [1,-1])
    {
      for (y = [1,-1])
        {
          translate([(420/2 + 15)*x,(410/2 + 15)*y,25]) cube([30,30,150], center = true);
        }
    }
  for (x = [1,-1])
    {
      translate([(420/2 + 15)*x,0,-15]) cube([30,410,30], center = true);
    }
  translate([0,(410/2 + 15),,-15]) cube([420,30,30], center = true);
}
