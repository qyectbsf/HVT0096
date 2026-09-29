include <../global_vars.scad>

module gates_2gt_20t_toothed_idler()
{
  import("/media/wolf/to_space/cubic_creation/HVT0096/source/stl_files/Gates_2GT_20T_Toothed_Idler.stl", convexity = 10);
}

module gates_2gt_20t_smooth_idler()
{
  import("/media/wolf/to_space/cubic_creation/HVT0096/source/stl_files/Gates_2GT_20T_Smooth_Idler.stl", convexity = 10);
}

module gates_2gt_20t_toothed_pulley()
{
  import("/media/wolf/to_space/cubic_creation/HVT0096/source/stl_files/Gates_2GT_20T_Toothed_Pulley.stl", convexity = 10);
}

module y_schiene(x)
{
  translate([x,-204,0]) union()
    {
      mgn_12_schiene_y();
    }
}

module ms_x_block()
{
  import("/media/wolf/to_space/cubic_creation/HVT0096/source/stl_files/MS-X-BLOCK 1.3.stl", convexity=10);
}

module ms_x_belt_plate()
{
  import("/media/wolf/to_space/cubic_creation/HVT0096/source/stl_files/MS-X-BELT-PLATE 1.6.stl", convexity=10);
}

module ms_soff()
{
  import("/media/wolf/to_space/cubic_creation/HVT0096/source/stl_files/MS-SOFF-M3-FF-24L 1.1.stl", convexity=10);
}

module tc_face()
{
  import("/media/wolf/to_space/cubic_creation/HVT0096/source/stl_files/TC-FACE.stl", convexity=10);
}

module tc_back()
{
  import("/media/wolf/to_space/cubic_creation/HVT0096/source/stl_files/TC-BACK.stl", convexity=10);
}

module tc_cover()
{
  import("/media/wolf/to_space/cubic_creation/HVT0096/source/stl_files/Tool-Changer-Cover.stl", convexity=10);
}

module tc_shaft()
{
  import("/media/wolf/to_space/cubic_creation/HVT0096/source/stl_files/TC-SHAFT.stl", convexity=10);
}

module tc_plate()
{
  import("/media/wolf/to_space/cubic_creation/HVT0096/source/stl_files/TC-PLATE.stl", convexity=10);
}

module tc_ramp()
{
  import("/media/wolf/to_space/cubic_creation/HVT0096/source/stl_files/TC-RAMP.stl", convexity=10);
}

module zr_2_6_bearing_top_mount_fl_body_v_1()
{
  import("/media/wolf/to_space/cubic_creation/HevORT/files/STL/ZR_V2.6/ZR2.6_BearingTopMount_FL_Body_V1.stl", convexity=10);
}

module zr_2_6_bearing_top_mount_fr_body_v_1()
{
  import("/media/wolf/to_space/cubic_creation/HevORT/files/STL/ZR_V2.6/ZR2.6_BearingTopMount_FR_Body_V1.stl", convexity=10);
}

module zr_2_6_bearing_top_mount_rr_body_v_1()
{
  import("/media/wolf/to_space/cubic_creation/HevORT/files/STL/ZR_V2.6/ZR2.6_BearingTopMount_RR_Body_V1.stl", convexity=10);
}

module zr_2_6_motor_mount_fl_body_v_1()
{
  import("/media/wolf/to_space/cubic_creation/HevORT/files/STL/ZR_V2.6/ZR2.6_MotorMount_FL_Body_V1.stl", convexity=10);
}

module zr_2_6_motor_mount_fr_body_v_1()
{
  import("/media/wolf/to_space/cubic_creation/HevORT/files/STL/ZR_V2.6/ZR2.6_MotorMount_FR_Body_V1.stl", convexity=10);
}

module zr_2_6_motor_mount_rr_body_v_1()
{
  import("/media/wolf/to_space/cubic_creation/HevORT/files/STL/ZR_V2.6/ZR2.6_MotorMount_RR_Body_V1.stl", convexity=10);
}

module y_rail()
{
  import("/media/wolf/to_space/cubic_creation/HVT0096/source/stl_files/MGNR12R560HM.stl", convexity = 10);
}

module z_rail()
{
  import("/media/wolf/to_space/cubic_creation/HVT0096/source/stl_files/MGNR12R456HM.stl", convexity = 10);
}

module z_ball_screw_spindel()
{
  import("/media/wolf/to_space/cubic_creation/HVT0096/source/stl_files/hiwin_debn_spindel.stl", convexity = 10);
}

module z_ball_screw_flanschmutter()
{
  import("/media/wolf/to_space/cubic_creation/HVT0096/source/stl_files/hiwin_debn_flanschmutter.stl", convexity = 10);
}

module wobble_1()
{
  import("/media/wolf/to_space/cubic_creation/HevORT/files/STL/ZR_V2.6/ZR2.6_WobbleRing_SFU1204_LowerDisc_V1.stl", convexity = 10);
}

module wobble_2()
{
  import("/media/wolf/to_space/cubic_creation/HevORT/files/STL/ZR_V2.6/ZR2.6_WobbleRing_Printed_LH_RR_V1.stl", convexity = 10);
}

module wobble_3()
{
  import("/media/wolf/to_space/cubic_creation/HevORT/files/STL/ZR_V2.6/ZR2.6_SliderMount_FL_Body_V1stl.stl", convexity = 10);
}

module x_schiene(x)
{
  //rotate([0,180,90]) translate([0,-180,0]) mgn_12_schiene_x();
  translate([0,0,20]) rotate([0,0,90]) translate([0,-180,0]) mgn_12_schiene_x();
}

module mgn_12_c()
{
  import("/media/wolf/to_space/cubic_creation/HVT0096/source/stl_files/MGN12CZ0HM.stl", convexity=10);
}

module mgn_12_h()
{
  import("/media/wolf/to_space/cubic_creation/HVT0096/source/stl_files/MGN12HZ0HM.stl", convexity = 10);
}

module mgn_12_schiene_bed()
{
  import("/media/wolf/to_space/cubic_creation/HVT0096/source/stl_files/MGNR12R150HM.stl", convexity=10);
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
      cylinder(h = 12, d = 19.5, $fn = resolution);
      cylinder(h = 12.1, d = 10, $fn = resolution);
    }
  }
}

module idler_cutout_wip() {
  difference() {
    cylinder(r = 9.25, h = 10.0, $fn = resolution);
    for (i = [0,180]) {
      translate([0,0,5])
      rotate([0,i,0])
        translate([0,0,4.5])
        cylinder(h = 0.5, r1 = 2.5, r2 = 3.0, $fn = resolution);
    }
  }
}

module y_rail_mount_left() {
  difference() {
    union() {
      translate([-13.1,-28.3 / 2,0])
        cube([52, 28.3, 36]);
      translate([13.5,-28.3 / 2,-10])
        cube([25.4, 28.3, 10]);
    }
    translate([13.50,-10,6.20])
      cube([40,20,20]);


    translate([29.5,-28.3 / 2,-13.5])
      minkowski()
      {
        cube([20, 28.3, 10]);
        sphere(d = 7 , $fn = resolution);
      }
    for (i = [20.1, 32.9]) {
      translate([i,0,-20])
        cylinder(r = 2.6, h = 60, $fn = resolution);
    }
    for (i = [-1, 1]) {
      translate([13.4, 8 * i, -5])
        rotate([0,90,0])
        cylinder(r = 3.1754, h = 2.5, $fn = 6);
      translate([15.8, 8 * i, -5])
        rotate([0,90,0])
        cylinder(r = 1.6, h = 10.3, $fn = resolution);
      translate([26, 8 * i, -5])
        rotate([0,90,0])
        cylinder(r = 3.5, h = 10.3, $fn = resolution);
    }

    translate([-3,-8,lower_belt_z - 15]) idler_cutout_wip();
    translate([-3,8,upper_belt_z - 15]) idler_cutout_wip();

    translate([-3,-8,-0.1]) cylinder(h = 50, d = 3.1, $fn = resolution);
    translate([-3,8,-0.1]) cylinder(h = 50, d = 3.1, $fn = resolution);

    translate([-13.2 + 27,14.15 - 1.9 - 0.15,upper_belt_z -15 + 5])
      cube([54,4.3,8], center = true);
    translate([-13.2,0,upper_belt_z -15 + 5])
      cube([10,28.4,11.1], center = true);

    translate([-13.2 + 27,-14.15 + 1.9 + 0.15,lower_belt_z -15 + 5])
      cube([54,4.3,8], center = true);
    translate([-13.2,0,lower_belt_z -15 + 5])
      cube([10,28.4,11.1], center = true);

    for (i = [-1,1]) {
      translate([10,7.5 * i,-0.1])
      cylinder(h = 40, r = 1.6, $fn = resolution);
    }
    for (i = [-1,1]) {
      translate([-10,7.5 * i,-0.1])
        cylinder(h = 10, r = 1.6, $fn = resolution);
    }
    for (i = [-1,1]) {
      hull() {
      translate([-10,7.5 * i,4.0])
        cylinder(h = 10, r = 3, $fn = resolution);
      translate([-15,7.5 * i,4.0])
        cylinder(h = 50, r = 3, $fn = resolution);
      }
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
      cylinder(h = 11, d = 19.5, $fn = resolution);
      cylinder(h = 10.1, d = 10, $fn = resolution);
    }

    translate([21.82,18.15,16.8]) difference()
    {
      cylinder(h = 11, d = 19.5, $fn = resolution);
      cylinder(h = 10.1, d = 10, $fn = resolution);
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
      cylinder(h = 12, d = 19.5, $fn = resolution);
      cylinder(h = 12.1, d = 10, $fn = resolution);
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
      cylinder(h = 12, d = 19.5, $fn = resolution);
      cylinder(h = 12.1, d = 10, $fn = resolution);
    }

    translate([-18.11,15.01,16.95]) difference()
    {
      cylinder(h = 12, d = 19.5, $fn = resolution);
      cylinder(h = 12.1, d = 10, $fn = resolution);
    }
  }
}

y_rail_mount_left();
