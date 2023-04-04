show_belt = 0;
show_frame = 1;
show_z_struct = 1;
show_bed = 1;
show_bed_angle_marker = 0;

show_left = 1;
show_right = 1;
show_back = 1;

show_addatives = 1;

current_x_position = 150.0;
current_y_position = 150.0;
current_z_position = -13.0 + 0.0;

lower_belt_z = 22.05;
upper_belt_z = 33.20;

belts_max_space = 21.95;


m4_screw = 4.5;
m6_screw = 6.1;

m4_nut = 8.4;

3mm_stab = 3.2;

z_rail_z_offset = 26.0;


// 10 for compile speed 200 for final export
resolution = 20.0;

//ball_screw_left_relative_x = 36.15;
ball_screw_left_relative_x = 38;
//ball_screw_left_relative_y = 29.622;
ball_screw_left_relative_y = -38 - 15;

//ball_screw_back_relative_x = 0;
ball_screw_back_relative_x = 0;
//ball_screw_back_relative_y = -51.591;
ball_screw_back_relative_y = -58 + 20;


left_bed_rail_angle = 0.0;
right_bed_rail_angle = -left_bed_rail_angle;
back_bed_rail_angle = 0.0;

pulley_cutout_height = 10.8;

mcl_clamp_height = 9.0;

// z_bottom_object_height = Endenbearbeitung s21-10 - mcl clamp + space + motor shaft
// z_bottom_object_height = 50 - 9 + 2 + 24

// | | ruland mcl 10 f
//  –
// | |
// | | angular ball bearing 5200 2rs tn
// | |
// |
// |
// | spindel
// |
//
// | 2 mm space
//
// |
// | motor shaft
// |

z_bottom_object_height = 67.0;

ball_bearing_5200_2rs_tn_height = 14.3;
module ball_bearing_5200_2rs_tn()
{
  radius = 0.715;
  id = 10;
  od = 30;
  width = 14.3;
  seal = 0.43;
  contact_space = 2.9;

  bearin_blueprint(radius, id, od, width, seal, contact_space);
}

module ball_bearing_ss_608_2rs_tn()
{
  radius = 0.25;
  id = 8.0;
  od = 22.0;
  width = 7.0;
  seal = 0.2;
  contact_space = 1.5;

  bearin_blueprint(radius, id, od, width, seal, contact_space);
}

module bearin_blueprint(radius, id, od, width, seal, contact_space)
{
  rotate_extrude($fn = resolution)
    polygon(points=[[(id + radius) / 2,0],
                    [id / 2, radius],
                    [id / 2, width - radius],
                    [(id + radius) / 2, width],
                    [(id + 2 * contact_space) / 2, width],
                    [(id + 2 * contact_space) / 2, width - seal],
                    [(od - 2 * contact_space) / 2, width - seal],
                    [(od - 2 * contact_space) / 2, width],
                    [(od - radius) / 2, width],
                    [od / 2, width - radius],
                    [od / 2, radius],
                    [(od - radius) / 2, 0],
                    [(od - 2 * contact_space) / 2,0],
                    [(od - 2 * contact_space) / 2, seal],
                    [(id + 2 * contact_space) / 2, seal],
                    [(id + 2 * contact_space) / 2,0]]
            );
}

module ruland_mcl_10_f_clamping_shaft_collar()
{
  difference()
    {
      cylinder(h = 9, d = 24, $fn = resolution);
      translate([0,0,-0.1]) cylinder(h = 9.2, d = 10, $fn = resolution);
    }
}

module z_motor()
{
  cylinder(h = 24, d = 5, $fn = resolution);
}

module pulley_cutout(width)
{
  difference()
  {
    translate([0.0, 0.0, pulley_cutout_height/2])
      cylinder(h = pulley_cutout_height, d = width, center = true, $fn = resolution);
    pulley_cutout_inverse(width);
  }
}

module pulley_cutout_inverse(width)
{
  bearing_mount_inner_width = 4.4;
  bearing_mount_outer_width = 9.0;
  bearing_mount_height = 1.0;

  difference()
  {
    union()
    {
      translate([0.0, 0.0, pulley_cutout_height/2 + 4.9])
        cylinder(h = bearing_mount_height,
                 d1 = bearing_mount_inner_width,
                 d2 = bearing_mount_outer_width,
                 center = true,
                 $fn = resolution);
      translate([0.0, 0.0, pulley_cutout_height/2 - 4.9])
        cylinder(h = bearing_mount_height,
                 d1 = bearing_mount_outer_width,
                 d2 = bearing_mount_inner_width,
                 center = true,
                 $fn = resolution);
    }
    translate([0.0, 0.0, pulley_cutout_height/2])
      cylinder(h = pulley_cutout_height, d = 3mm_stab, center = true, $fn = resolution);
  }
}

module bed_alu_mount_hole()
{
  translate([0,0,-0.1]) cylinder(h = 5.2, d = 2.9, $fn = resolution);
  translate([0,0,5.1])cylinder(h = 30, d = 4.0, $fn = resolution);
  translate([0,0,18])cylinder(h = 100, d = 2.0, $fn = resolution);
}

module z_ball_screw_shaft_cutout_upper()
{
  rotate_extrude($fn = resolution)
    polygon(points=[[0,-0.1],[11.125,-0.1],[11.125,7.249],
                    [9.0475,7.249],[9.0475,20],[0,20]]
            );
}

module z_ball_screw_shaft_cutout_lower()
{
  rotate_extrude($fn = resolution)
    polygon(points=[[0.0, -0.1], [11.0, -0.1], [11.0, 3.0],
                    [4.5, 3.0], [4.5, 5.0], [5.5, 6.0], [15.0, 6.0],
                    [15.0, z_bottom_object_height - ball_bearing_5200_2rs_tn_height - 15.0],
                    [12.0, z_bottom_object_height - ball_bearing_5200_2rs_tn_height - 5.0],
                    [12.0, z_bottom_object_height - ball_bearing_5200_2rs_tn_height],
                    [15.05, z_bottom_object_height - ball_bearing_5200_2rs_tn_height],
                    [15.05, z_bottom_object_height + 0.1], [0, z_bottom_object_height + 0.1]]
            );
}

module z_middle_object_bearing_cutout()
{
  for (r = [0,180])
    {
      rotate([0,0,r]) translate([22.5,0,0]) rotate_extrude($fn = resolution)
        polygon(points=[[0,-0.1], [(9.1) / 2, -0.1], [(9.1) / 2, 0], [(9.1 - 1) / 2, 0.5],
                        [(9.1 - 1) / 2, 6.0], [(10.1) / 2, 8.0], [(10.1) / 2, 10.0],
                        [(12.1) / 2, 11.0], [(12.1) / 2, 11.1], [0,11.1]
                        ]);
    }

  for (i = [-3.5, 3.5])
    {
      translate([-40,i,6.47 + 1.525]) rotate([0,90,0]) cylinder(h = 40 * 2, d = 3.05, $fn = resolution);
    }
}

module z_middle_object_base(height, id)
{
  rotate_extrude($fn = resolution)
    polygon(points=[[(id + 1.05) / 2, 0], [28.5, 0], [29, 0.5],
                    [29, height - 0.5], [28.5, height], [(id + 1.05) / 2,height],
                    [(id + 0.05) / 2, height- 0.5], [(id + 0.05) / 2, 0.5]
                    ]);
}

module z_bearing_rod_cutout() {
  rotate_extrude($fn = resolution)
    polygon(points=[[0,-100], [7,-100], [7,8],
                    [4.1,8], [4.1,14.5], [4.5,14.5],
                    [15,10], [15,31], [4.5,26.5],
                    [4.1,26.5], [4.1,38], [0,38]]
            );

}

module mgn_screw_cutout()
{
  rotate([0,90,0]) translate([0,0,-8.1]) cylinder(h = 15.2, d = 2.5, $fn = resolution);
  rotate([0,90,0]) translate([0,0,7]) cylinder(h = 150, d = 5, $fn = resolution);
}

module rosengelenkstangenkugellager()
{
  difference()
    {
      union()
      {
        sphere(d = 15.88, $fn = resolution);

        hull()
          {
            translate([0,0,-4.5]) cylinder(h = 9, d = 24, $fn = resolution);
            translate([0,-16,0]) rotate([90,0,0]) cylinder(h = 1, d = 8, $fn= resolution);
          }

        translate([0,-17,0]) rotate([90,0,0]) cylinder(h = 25, d = 8, $fn= resolution);
      }

      translate([0,0,-6.1]) cylinder(h = 12.2, d = 8, $fn = resolution);

      for (i = [-1,1])
        {
          rotate([0,90 + i * 90,0]) translate([0,0,6]) cylinder(h = 12, d = 16, $fn = resolution);
        }
    }
}

module rosengelenkstangenkugellager_mount()
{
  translate([0,-12,0]) difference()
    {
      union()
      {
        rotate([10,0,0]) difference()
          {
            translate([-33 / 2, -10,-10]) cube([33,15,42.4]);
            translate([-27 / 2, -10.1,-10.1]) cube([27,10.1,42.6]);
          }
        hull()
          {
            translate([0,12,0]) cylinder(h = 18, d = 15, $fn = resolution);
            translate([-9,0,0]) cube([18,1,18]);
          }
      }
      translate([-25,-25,-20]) cube([50,50,20]);
      translate([0,12,-0.1]) cylinder(h = 18.2, d = 8, $fn = resolution);
      rotate([10,0,0]) for (i = [-1,1])
        {
          for (j = [-1,1])
            {
              translate([i * 10,-2,16.2 + j * 10]) rotate([0,0,90]) mgn_screw_cutout();
            }
        }
      rotate([10,0,0]) translate([-27 / 2, -10.1,-10.1]) cube([27,10.1,42.6]);
    }
}

module mgn_h_block_cutout()
{
  union()
  {
    difference()
      {
        translate([-29 / 2,-0.1,-20])cube([29,11.1,32.4 + 40]);
        translate([-29.2 / 2,-0.1,-2.5])cube([29.2,11.2,37.4]);
      }
    translate([-27 / 2,-0.1,2])cube([27,10.1,28.4]);

    hull()
      {
        translate([-29 / 2,-0.1,-2.6]) cube([29,11,0.1]);
        translate([-27 / 2,-0.1,2]) cube([27,10.1,0.1]);
      }
    translate([0,0,32.4]) rotate([0,180,0]) hull()
      {
        translate([-29 / 2,-0.1,-2.6]) cube([29,11,0.1]);
        translate([-27 / 2,-0.1,2]) cube([27,10.1,0.1]);
      }
  }
}

//rosengelenkstangenkugellager_mount();
//rosengelenkstangenkugellager();
//pulley_cutout(20);
//pulley_cutout_inverse(20);
//ball_bearing_5200_2rs_tn();
//ruland_mcl_10_f_clamping_shaft_collar();
//deep_groove_ball_bearing_ss_63800_2rs();
//mgn_h_block_cutout();
