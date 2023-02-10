module y_schiene(x)
{
  translate([x,-204,0]) union()
    {
      mgn_12_schiene_y();
    }
}

module x_schiene(x)
{
  rotate([0,180,90]) translate([0,-180,0]) mgn_12_schiene_x();
}

module mgn_12_c()
{
  import("stl_files/MGN12CZ0HM.stl", convexity=10);
}

module mgn_12_h()
{
  import("stl_files/MGN12HZ0HM.stl", convexity = 10);
}
module mgn_12_schiene_y()
{
  import("stl_files/MGNR12R400HM.stl", convexity=10);
}

module mgn_12_schiene_x()
{
  import("stl_files/MGNR12R360HM.stl", convexity=10);
}

module left_lower_mod()
{
  difference()
  {
    import("stl_files/left_lower_org.stl", convexity = 10);
    translate([-15.82,17.55,20.41]) rotate([-90,0,0]) difference()
    {
      cylinder(h = 12, d = 19.5);
      cylinder(h = 12.1, d = 10);
    }
  }
}

module left_upper_mod()
{
  difference()
  {
    import("stl_files/left_upper_org.stl", convexity = 10);
    translate([24.11,31.36,5.8]) difference()
    {
      cylinder(h = 11, d = 19.5);
      cylinder(h = 10.1, d = 10);
    }

    translate([21.82,18.15,16.8]) difference()
    {
      cylinder(h = 11, d = 19.5);
      cylinder(h = 10.1, d = 10);
    }
  }
}

module right_lower_mod()
{
  difference()
  {
    import("stl_files/right_lower_org.stl", convexity = 10);
    translate([18.11,-29.65,21.1]) rotate([-90,0,0]) difference()
    {
      cylinder(h = 12, d = 19.5);
      cylinder(h = 12.1, d = 10);
    }
  }
}

module right_upper_mod()
{
  difference()
  {
    import("stl_files/right_upper_org.stl", convexity = 10);
    translate([-15.82,1.8,5.8]) difference()
    {
      cylinder(h = 12, d = 19.5);
      cylinder(h = 12.1, d = 10);
    }

    translate([-18.11,15.01,16.95]) difference()
    {
      cylinder(h = 12, d = 19.5);
      cylinder(h = 12.1, d = 10);
    }
  }
}
