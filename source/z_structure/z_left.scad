include <MCAD/2Dshapes.scad>;

include <../global_vars.scad>
include <../stl_files/main.scad>

module z_left()
{
  translate([-225,-190,-41]) z_left_top_object();
  if ( show_addatives == 1 )
    {
      translate([-225,-190,-41]) z_left_top_object_addatives();
    }

  translate([-225 + ball_screw_left_relative_x,
             -190 + ball_screw_left_relative_y,
             -210 + z_bottom_object_height - 0.2 + 24 - current_z_position])
    z_left_middle_object();

  if ( show_addatives == 1 )
    {
      translate([-225 + ball_screw_left_relative_x,
                 -190 + ball_screw_left_relative_y,
                 -210 + z_bottom_object_height - 0.2 + 24 - current_z_position])
        z_left_middle_object_addatives();
    }

  translate([-225, -190,-512]) z_left_bottom_object();
  if ( show_addatives == 1 )
    {
      translate([-225, -190,-512]) z_left_bottom_object_addatives();
    }

  if ( show_addatives == 1 )
    {
      translate([-210, -190, -30]) rotate([-90,0,-90]) z_rail();

      translate([-225 + ball_screw_left_relative_x,
                 -190 + ball_screw_left_relative_y,
                 -512 + z_bottom_object_height + mcl_clamp_height])
        rotate([0,-90,-90])
        z_ball_screw_spindel();

      translate([-225 + ball_screw_left_relative_x,
                 -190 + ball_screw_left_relative_y,
                 -210 + z_bottom_object_height - 0.2 - 160 - current_z_position])
        rotate([0,-90,-90])
        z_ball_screw_flanschmutter();
    }
}

module z_left_top_object()
{
  difference()
    {
      union()
      {
        hull()
          {
            translate([ball_screw_left_relative_x,
                       ball_screw_left_relative_y,
                       0])
              cylinder(h = 17, d = 7, $fn = resolution);

            translate([15,-100 + 15 + 7,0]) cube([12, 100, 17]);
          }

        translate([15.0 + 21.15, ball_screw_left_relative_y, 0.0])
          cylinder(h = 17, d = 30.3, $fn = resolution);

        translate([-15,15,0]) cube([42,7,11]);
        translate([-15,-15 - 7,0]) cube([42,7,11]);

        translate([15,-100 + 15 + 7,0]) cube([7, 100, 36]);
      }

      // subtract m5 alu mount screws
      for (y = [0, -31, -62])
        {
          translate([14.9,y, 26]) rotate([0,90,0]) cylinder(h = 7.2, d = 5.2, $fn = resolution);
        }

      // subtract linear rail
      translate([14.9,-6,-1]) cube([8.1,12,12]);

      // subtract drive shaft
      translate([ball_screw_left_relative_x, ball_screw_left_relative_y,0]) z_ball_screw_shaft_cutout_upper();

      // subtract blockade space
      // translate([0,-100,41]) rotate([-90,0,0]) linear_extrude(height = 30 + 10 + 2 * -ball_screw_left_relative_y)
      //  polygon(points=[[52,31],[31,24],[31,23], [52,23]]);
    }
}

module z_left_top_object_addatives()
{
  translate([ball_screw_left_relative_x,
             ball_screw_left_relative_y,
             0])
    ball_bearing_ss_608_2rs_tn();
}

module z_left_middle_object()
{
  object_height = 11.0;
  object_space = 2.0;

  translate([0,0,2 * (object_height + object_space)]) z_left_middle_object_top();
  translate([0,0,object_height + object_space]) z_left_middle_object_middle();
  z_left_middle_object_bottom();
}

module z_left_middle_object_addatives()
{
  translate([-ball_screw_left_relative_x + 15,
             -ball_screw_left_relative_y,
             3])
    rotate([90,0,90]) mgn_12_h();
}

module z_left_middle_object_top()
{
  id = 32.0;
  jh = 23;


  difference()
    {
      union()
      {
        hull()
          {
            z_middle_object_base(height = 26.0, id = 32.0);

            translate([25 - 0.0584,42.45 + 0.0584 + 15,14.5]) rotate([90,0,-90 -48]) union()
              {
                translate([0,0,-15]) cylinder(h = 42, d = 23, $fn= resolution);
                //                translate([-20/2,-29/2,-15]) cube([20,1,42]);
              }
          }

        translate([-ball_screw_left_relative_x + 15 + 3.04,
                   -ball_screw_left_relative_y - 13.5 - 5,
                   -17])
          cube([17,37,32.4 + 10.6]);

        hull()
          {
            translate([-ball_screw_left_relative_x + 15 + 3.04,
                       -ball_screw_left_relative_y - 13.5 - 5,
                        0]) cube([17,37,26]);

            translate([25,+42.45 + 15,14.5]) rotate([90,0,-90 -48]) translate([0,0,-15]) cylinder(h = 42, d = 23, $fn= resolution);
          }
      }

      translate([0,0,-0.1]) cylinder(d = 32, h = 30, $fn = resolution);

      translate([0,0,11 / 2]) rotate([180,0,0]) translate([0,0,-11 / 2]) z_middle_object_bearing_cutout();

      translate([-ball_screw_left_relative_x + 15 + 3.04,
                 -ball_screw_left_relative_y,
                 -17])
        rotate([0,0,-90])
        mgn_h_block_cutout();

      translate([-ball_screw_left_relative_x + 15 + 13,-ball_screw_left_relative_y - 10,2 + 12.2 - 25]) mgn_screw_cutout();
      translate([-ball_screw_left_relative_x + 15 + 13,-ball_screw_left_relative_y - 10,2 + 32.2 - 25]) mgn_screw_cutout();
      translate([-ball_screw_left_relative_x + 15 + 13,-ball_screw_left_relative_y + 10,2 + 12.2 - 25]) mgn_screw_cutout();

      translate([25 - 0.0584,42.45 + 0.0584 + 15,19.5 - 5]) rotate([90,0,-90 -48]) translate([0,0,-14.5]) union()
        {
          z_bearing_rod_cutout();
          translate([0,0,10]) difference()
            {
              hull()
                {
                  translate([0,0,0.01]) linear_extrude(20.98) pieSlice([40, 40], start_angle=60, end_angle=300);
                  cylinder(h = 21, d = 29.99, $fn = resolution);
                }
              cylinder(h = 21, d = 29.99, $fn = resolution);
            }
        }
    }
}

module z_left_middle_object_middle()
{
  difference()
    {
      z_middle_object_base(height = 11.0, id = 32.0);
      translate([0,0,11 / 2]) rotate([180,0,90]) translate([0,0,-11 / 2]) z_middle_object_bearing_cutout();
      z_middle_object_bearing_cutout();
    }
}


module z_left_middle_object_bottom()
{
  difference()
    {
      z_middle_object_base(height = 11.0, id = 28.0);

      for (i = [45, 135, 225, 315]) { rotate([0,0,i]) translate([19,0,-0.1]) cylinder(h = 11.2, d = 5, $fn = resolution); }

      rotate([0,0,90]) z_middle_object_bearing_cutout();
    }
}

module z_left_bottom_object()
{
  difference()
    {
      union()
      {
        hull()
          {
            // alu profile
            translate([-15,-15 - 7,0]) cube([30 + 7, 30 + 14, z_bottom_object_height]);

            // fill struct
            translate([ball_screw_left_relative_x, ball_screw_left_relative_y , z_bottom_object_height/2])
              cylinder(h = z_bottom_object_height, d = 44, center = true, $fn = resolution);
          }

        // motor plate
        translate([ball_screw_left_relative_x - 22, ball_screw_left_relative_y - 22,0]) cube([44,44,6]);
      }

      // subtract drive shaft
      translate([ball_screw_left_relative_x, ball_screw_left_relative_y ,0]) z_ball_screw_shaft_cutout_lower();

      // subtract motor screws
      for (j = [0.0, 1.0, 2.0, 3.0])
        {
          translate([ball_screw_left_relative_x, ball_screw_left_relative_y ,0])
            rotate([0.0, 0.0, j * 90.0 +180])
            translate([-15.5, 15.5,-0.1])
            if (j == 2.0) {
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
      translate([-15.1,-15,-0.1]) cube([30.1, 30, z_bottom_object_height + 0.2]);

      // subtract linear rail
      translate([14.9,-6,z_rail_z_offset]) cube([8.1,12,z_bottom_object_height]);

      // subtract m6 alu mount screws
      for (r = [-90, 90])
        {
          for (z = [15,((z_bottom_object_height - 30) / 2) +15 ,z_bottom_object_height - 15])
            {
              translate([0,0,z])
                rotate([r,0,0])
                union()
                {
                  translate([0,0,15 -0.1]) cylinder(d = m6_screw, h = 7.2, $fn = resolution);
                  translate([0,0,15 + 7]) cylinder(d = m6_screw + 7, h = 30, $fn = resolution);
                }
            }
        }

      translate([0,0,15]) rotate([0,90,0]) union()
        {
          translate([0,0,15 -0.1]) cylinder(d = m6_screw, h = 7.2, $fn = resolution);
          translate([0,0,15 + 7]) cylinder(d = m6_screw + 7, h = 24, $fn = resolution);
        }

      // subtract assembly space
      translate([ball_screw_left_relative_x, ball_screw_left_relative_y ,0]) union()
        {
          translate([0,-6,+6]) cube([50,12,34]);
          translate([0,0,34]) rotate([45,0,0]) cube([50,sqrt(12^2/2),sqrt(12^2/2)]);
        }

      // subtract bearing fixate screw
      translate([ball_screw_left_relative_x - 19.8,
                 ball_screw_left_relative_y,
                 z_bottom_object_height - 12.9])
        cylinder(h = 13, d = 4.8, $fn= resolution);
    }
}

module z_left_bottom_object_addatives()
{
  translate([ball_screw_left_relative_x,
             ball_screw_left_relative_y,
             z_bottom_object_height - ball_bearing_5200_2rs_tn_height])
    ball_bearing_5200_2rs_tn();

  translate([ball_screw_left_relative_x,
             ball_screw_left_relative_y,
             z_bottom_object_height])
    ruland_mcl_10_f_clamping_shaft_collar();

  translate([ball_screw_left_relative_x,
             ball_screw_left_relative_y,
             0])
    z_motor();
}
