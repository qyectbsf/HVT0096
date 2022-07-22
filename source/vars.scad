lower_belt_z = 22.05;
upper_belt_z = 33.20;

m4_screw = 4.5;
m6_screw = 6.1;

m4_nut = 8.4;

3mm_stab = 3.2;

resolution = 42;

module pulley_cutout(width)
{
  height = 10.8;
  difference()
  {
    translate([0,0,height/2]) cylinder(h = height, d =width, center = true, $fn = 200);
    translate([0,0,height/2 + 4.9]) cylinder(h = 1, d1 =4.4, d2 = 9, center = true, $fn = 200);
    translate([0,0,height/2 - 4.9]) cylinder(h = 1, d1 =9, d2 = 4.4, center = true, $fn = 200);
  }
}