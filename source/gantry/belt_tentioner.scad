include <../global_vars.scad>

module belt_tentioner_base()
{
  difference()
  {
    union()
    {
      // x cube
      for (x = [70 + 3,-(70 +3)])
      {
        translate([x,3,25]) cube([6,36,50], center = true);
        translate([x * 1.204,3,3]) cube([30,36,6], center = true);
      }

      // z cube
      for (z = [lower_belt_z - 3, upper_belt_z +3 + 10.8])
      {
        translate([0,3,z]) cube([70.0 * 2.0, 36.0, 6.0], center = true);
      }

      #translate([0,-15 + 1,33.025]) cube([70 * 2, 2, (6 + 10.8) * 2 + 0.35], center = true);

      i = -10;
      for (x = [i,i - 22.5,i - (22.5 * 2)])
      {
        y = 15 + 6 - 8.5;
        if (x != - 32.5)
        {
          difference()
          {
            translate([x,y,lower_belt_z]) cylinder(h = 10.8 * 2 + 0.35, d =19.4, $fn = resolution);
            translate([x,y,lower_belt_z]) pulley_cutout(19.5);
          }
          hull()
          {
            translate([x,y,upper_belt_z - 0.35]) cylinder(h = 10.8 + 0.35, d =19.4, $fn = resolution);
            translate([x -  5,-15,upper_belt_z]) cube([10,1,10.8]);
          }
        }
        if (x != - 32.5)
        {
          difference()
          {
            translate([-x,y,lower_belt_z]) cylinder(h = 10.8 * 2 + 0.35, d =19.4, $fn = resolution);
            translate([-x,y,upper_belt_z]) pulley_cutout(19.5);
          }
          hull()
          {
            translate([-x,y,lower_belt_z]) cylinder(h = 10.8 + 0.35, d =19.4, $fn = resolution);
            translate([-x -  5,-15,lower_belt_z]) cube([10,1,10.8]);
          }
        }
      }
    }
    translate([0,16 + 5 +0.1,33.025]) cube([(85 + 6) * 2 + 0.2, 8, 10.8 * 2 + 0.35], center = true);
    i = -10;
    for (x = [i,i - 22.5,i - (22.5 * 2)])
    {
      y = 15 + 6 - 8.5;
      translate([x,y,0]) cylinder(h = 60, d =3mm_stab, $fn = resolution);
      translate([-x,y,0]) cylinder(h = 60, d =3mm_stab, $fn = resolution);
    }
    for (x = [-1,1])
    {
      translate([x * (70 + 6 + 15),0,0]) cylinder(h = 6.2, d =m6_screw, $fn = resolution);
    }
    for (i =[-32.5,32.5])
    {
      for (x = [-6,6])
      {
        for (z = [lower_belt_z - 3, upper_belt_z + 10.8 + 3])
        {
          translate([i + x,-15 -0.1,z]) rotate([-90,0,0]) cylinder(h = 36.2, d = m4_screw,$fn = resolution);
          translate([i + x,+18 -0.1,z]) rotate([-90,0,0]) cylinder(h = 3.2, d = m4_nut,$fn = 6);
        }
      }
    }
  }
}

module belt_tentioner_arm()
{
  y = 15 + 6 - 8.5;
  difference()
  {
    union()
    {
      difference()
      {
        intersection()
        {
          translate([32.5 - 22.5 / 2,-26 / 2,lower_belt_z - 6]) cube([22.5,36 -2, 10.8 * 2 + 0.35 + 12]);
          belt_tentioner_base();
        }
        translate([32.5 - 22.5 / 2 - 0.1,-26 / 2 -0.1,lower_belt_z - 6 - 0.1])
        cube([22.5 + 0.2,36 -2 - 20 + 0.1, 10.8 * 2 + 0.35 + 12 + 0.2]);
      }
      difference()
      {
        translate([32.5 - 11.25,y - 11.5,lower_belt_z]) cube([22.5,15,10.8 * 2 + 0.35]);
        translate([32.5,y,upper_belt_z]) pulley_cutout(24);
      }
    }
    translate([32.5,y,0]) cylinder(h = 60, d =3mm_stab, $fn = resolution);
  }
}

module belt_tentioner_mount()
{
  union()
  {
    difference()
    {
      belt_tentioner_base();
      for (i = [(32.5 - 22.5 / 2 - 0.1) - 0.1,-(32.5 - 22.5 / 2 - 0.1) -22.8])
      {
        translate([i,-26 / 2 -0.1,lower_belt_z - 6 - 0.1])
        cube([22.5 + 0.4,36, 10.8 * 2 + 0.35 + 12 + 0.2]);
      }
    }
    for (x = [32.5, -32.5])
    {
      for (z = [lower_belt_z - 3,upper_belt_z +10.8 + 3])
      {
        translate([x,15 + 6 + 3 - 1,z]) cube([40,4,6], center = true);
      }
    }
  }
}

module belt_tentioner()
{
  //translate([-32.5 * 2,0,66+ 0.05]) mirror([0,0,1]) belt_tentioner_arm();
  //belt_tentioner_arm();
  belt_tentioner_mount();
}

belt_tentioner();
