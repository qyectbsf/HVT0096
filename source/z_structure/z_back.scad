include <../global_vars.scad>
include <../stl_files/main.scad>

module z_back()
{
  g = 0;
  translate([0, 220,-41]) z_back_top_object();
  translate([0,
             220 + ball_screw_back_relative_y,
             -210 + z_bottom_object_height - 0.2 + 24 - current_z_position - g])
    z_back_middle_object();
  translate([0, 220, -512 - 0.2]) z_back_bottom_object();

  if ( show_addatives == 1 )
    {
      translate([0, 220,-41]) z_back_top_object_addatives();

      translate([0,
                 220 + ball_screw_back_relative_y + 40,
                 -210 + z_bottom_object_height - 0.2 + 24 - current_z_position - g])
        z_back_middle_object_addatives();

      translate([0, 220 + ball_screw_back_relative_y, -512 - 0.2]) z_back_bottom_object_addatives();

      translate([0, 205 + 40,-30]) rotate([-90,0,180]) z_rail();

      translate([0,
                 220  + ball_screw_back_relative_y,
                 -512 + z_bottom_object_height + mcl_clamp_height])
        rotate([0,-90,180])
        z_ball_screw_spindel();

      translate([0,
                 220  + ball_screw_back_relative_y,
                 -210 + z_bottom_object_height - 0.2 - 160 - current_z_position - g])
        rotate([0,-90,180])
        z_ball_screw_flanschmutter();
    }
}

module z_back_top_object()
{
  difference()
    {
      union()
      {
        hull()
          {
            translate([0,40,0]) hull()
              {
                translate([-15 -7,-15 - 7 ,0]) cube([44,7,11]);
                translate([-15 -7 - 3,-15 - 7,11]) cube([50,7,1]);
                translate([-15 -7 - 3,-15 - 7,40]) cube([50,7,1]);
              }

            translate([ball_screw_back_relative_x, ball_screw_back_relative_y,0]) cylinder(h = 17, d = 30.3, $fn = resolution);
          }

        translate([-15 -7,-15 -7 + 40,0]) cube([44,37,11]);
      }

      // subtract alu profile
      translate([-15,-15 + 40,-0.1]) cube([30, 30.1, 11.2]);

      // subtract m5 alu mount screws
      for (x = [-17, 17])
        {
          union()
          {
            translate([x,-14.9 + 40, 26]) rotate([90,0,0]) cylinder(h = 7.2, d = 5.2, $fn = resolution);
            translate([x,-15 - 7 + 40, 26]) rotate([90,0,0]) cylinder(h = 30, d = 10, $fn = resolution);
          }
        }

      // subtract linear rail
      translate([-6,-8 - 15,-1]) cube([12,8.1,12]);

      // subtract drive shaft
      translate([ball_screw_back_relative_x, ball_screw_back_relative_y, 0]) z_ball_screw_shaft_cutout_upper();

      // subtract blockade space
      translate([-30,-15 + 40,41]) rotate([-90,0,-90]) linear_extrude(height = 60)
        polygon(points=[[60 + 40,31], [7,16],[7,0], [52,0]]);

    }
}

module z_back_top_object_addatives()
{

}

module z_back_middle_object()
{
  object_height = 11.0;
  object_space = 2.0;

  translate([0,0,2 * (object_height + object_space)]) z_back_middle_object_top();
  translate([0,0,object_height + object_space]) z_back_middle_object_middle();
  z_back_middle_object_bottom();
}

module z_back_middle_object_addatives()
{

  translate([-ball_screw_back_relative_x,
             -ball_screw_back_relative_y - 15,
             3])
    rotate([90,0,0]) mgn_12_h();
}

module z_back_middle_object_top()
{
  difference()
    {
      union()
      {
        hull()
          {
            z_middle_object_base(height = 11.0, id = 32.0);

            translate([0,-60,29/2]) rotate([90,0,90]) union()
              {
                translate([0,0,-42/2]) cylinder(h = 42, d = 23, $fn= resolution);
                //                translate([-20/2,29/2,-42/2]) cube([20,1,42]);
              }

            translate([0,48,29/2]) rotate([90,0,90]) union()
              {
                translate([0,0,-42/2]) cylinder(h = 42, d = 23, $fn= resolution);
                //translate([-20/2,-29/2,-42/2]) cube([20,1,42]);
              }
          }
            //            hull()
            //{
                /* if (i == 1) */
                /*   { */
                /*     translate([0,i * 25,29/2]) rotate([90,0,90]) union() */
                /*       { */
                /*         translate([0,0,-42/2]) cylinder(h = 42, d = 23, $fn= resolution); */
                /*         translate([-20/2,-29/2,-42/2]) cube([20,1,42]); */
                /*       } */
                   translate([-ball_screw_back_relative_x - 43 /2,
                            -ball_screw_back_relative_y - 35 + 40,
                            -17])
                     cube([37 + 6,17,32.4 + 10.6]);
                /*   } */
                //}
      }

      translate([0,0,-0.1]) cylinder(d = 32, h = 30, $fn = resolution);

      translate([0,0,11 / 2]) rotate([180,0,0]) translate([0,0,-11 / 2]) z_middle_object_bearing_cutout();

        translate([-ball_screw_back_relative_x,
                   -ball_screw_back_relative_y + 22,
                   -17])
        rotate([0,0,180])
        mgn_h_block_cutout();

        // redo
        /* for (i = [-1,1]) */
        /* { */
        /*   for (j = [-1,1]) */
        /*     { */
        /*       translate([-ball_screw_back_relative_x + i * 10, */
        /*                  -ball_screw_back_relative_y - 28 + 40, */
        /*                  2 + 22.2 + 10 * j - 25]) */
        /*         rotate([0,0,-90]) */
        /*         mgn_screw_cutout(); */
        /*     } */
        /* } */

        translate([-6,-60,29/2]) rotate([90,0,90])   translate([0,0,-14.5]) union()
        {
          z_bearing_rod_cutout();
          translate([0,0,10]) difference()
            {
              hull()
                {
                  translate([0,0,0.01]) linear_extrude(20.98) pieSlice([40, 40], start_angle=35, end_angle=325);
                  cylinder(h = 21, d = 29.99, $fn = resolution);
                }
              cylinder(h = 21, d = 29.99, $fn = resolution);
            }
        }
    }
}

module z_back_middle_object_middle()
{
  difference()
    {
      z_middle_object_base(height = 11.0, id = 32.0);
      translate([0,0,11 / 2]) rotate([180,0,90]) translate([0,0,-11 / 2]) z_middle_object_bearing_cutout();
      z_middle_object_bearing_cutout();
    }
}


module z_back_middle_object_bottom()
{
  difference()
    {
      z_middle_object_base(height = 11, id = 28.0);

      for (i = [45, 135, 225, 315]) { rotate([0,0,i]) translate([19,0,-0.1]) cylinder(h = 11.2, d = 5, $fn = resolution); }

      rotate([0,0,90]) z_middle_object_bearing_cutout();
    }
}

module z_back_bottom_object()
{
  difference()
    {
      union()
      {
        hull()
          {
            // alu profile
            translate([-15 - 7,-15 -7 + 40,0]) cube([30 + 14, 30 + 7, z_bottom_object_height]);

            // fill struct
            translate([ball_screw_back_relative_x,
                       ball_screw_back_relative_y,
                       z_bottom_object_height/2])
              cylinder(h = z_bottom_object_height, d = 44, center = true, $fn = resolution);
          }

        // motor plate
        translate([ball_screw_back_relative_x,
                   ball_screw_back_relative_y,
                   3])
          cube([44,44,6], center = true);
      }

      // subtract drive shaft
      translate([ball_screw_back_relative_x,
                 ball_screw_back_relative_y,
                 0]) z_ball_screw_shaft_cutout_lower();

      // subtract motor screws
      for (j = [0.0, 1.0, 2.0, 3.0])
        {
          translate([ball_screw_back_relative_x,
                     ball_screw_back_relative_y,
                     0])
            rotate([0.0, 0.0, j * 90.0 +180])
            translate([-15.5, 15.5,-0.1])
            if ((j == 1.0) || (j == 2.0)) {
              cylinder(h = 6.1, d = 3.5, $fn = resolution);
              translate([0,0,6.1]) cylinder(h = z_bottom_object_height, d = 7, $fn = resolution);
            } else {
              union()
              {
                cylinder(h = 6.1, d = 3.5, $fn = resolution);
                hull()
                  {
                    translate([0,0,6.1]) cylinder(h = 12, d = 7, $fn = resolution);
                    translate([-3,3,20]) cylinder(h = 12, d = 7, $fn = resolution);
                  }
              }
            }
        }

      // subtract alu profile
      translate([-15,-15 + 40,-0.1]) cube([30,30.1,z_bottom_object_height + 0.2]);

      // subtract linear rail
      translate([-6,-15 -7.9 + 40,z_rail_z_offset])
        cube([12,8.1,z_bottom_object_height]);

      // subtract m6 alu mount screws
      for (r = [-90, 90])
        {
          for (z = [15,((z_bottom_object_height - 30) / 2) +15,z_bottom_object_height - 15])
            {
              translate([0,0,z]) rotate([0,r,0]) union()
                {
                  translate([0,40,15 -0.1]) cylinder(d = m6_screw, h = 7.2, $fn = resolution);
                  translate([0,40,15 + 7]) cylinder(d = m6_screw + 7, h = 24, $fn = resolution);
                }
            }
        }

      translate([0,0,15]) rotate([90,0,0]) union()
        {
          translate([0,0,15 -0.1 - 40]) cylinder(d = m6_screw, h = 7.2, $fn = resolution);
          translate([0,0,15 + 7 - 40]) cylinder(d = m6_screw + 7, h = 50, $fn = resolution);
        }

      // subtract assembly space
      translate([0,-73.591 + 22,0]) rotate([0,0,-90]) union()
        {
          translate([0,-8,+6]) cube([50,16,34]);
          translate([0,0,32]) rotate([45,0,0]) cube([50,sqrt(16^2/2),sqrt(16^2/2)]);
        }

      // subtract bearing fixate screw
      translate([ball_screw_back_relative_x,
                 ball_screw_back_relative_y + 19.8,
                 z_bottom_object_height - 12.9]) cylinder(h = 13, d = 4.8, $fn = resolution);
    }
}

module z_back_bottom_object_addatives()
{
  nema_17_25mm_shaft();
}

/* z_back(); */

/* z_back_top_object(); */
/* z_back_top_object_addatives(); */

/* z_back_middle_object(); */
/* z_back_middle_object_addatives(); */

/* z_back_middle_object_top(); */
/* z_back_middle_object_middle(); */
/* z_back_middle_object_bottom(); */

/* z_back_bottom_object(); */
/* z_back_bottom_object_addatives(); */
