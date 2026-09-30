include <../global_vars.scad>

module gates_2gt_20t_toothed_idler()
{
  import("stl_files/Gates_2GT_20T_Toothed_Idler.stl", convexity = 10);
}

module gates_2gt_20t_smooth_idler()
{
  import("stl_files/Gates_2GT_20T_Smooth_Idler.stl", convexity = 10);
}

module gates_2gt_20t_toothed_pulley()
{
  import("stl_files/Gates_2GT_20T_Toothed_Pulley.stl", convexity = 10);
}

module ms_x_block()
{
  import("stl_files/MS-X-BLOCK 1.3.stl", convexity=10);
}

module ms_x_belt_plate()
{
  import("stl_files/MS-X-BELT-PLATE 1.6.stl", convexity=10);
}

module ms_soff()
{
  import("stl_files/MS-SOFF-M3-FF-24L 1.1.stl", convexity=10);
}

module tc_face()
{
  import("stl_files/TC-FACE.stl", convexity=10);
}

module tc_back()
{
  import("stl_files/TC-BACK.stl", convexity=10);
}

module tc_cover()
{
  import("stl_files/Tool-Changer-Cover.stl", convexity=10);
}

module tc_shaft()
{
  import("stl_files/TC-SHAFT.stl", convexity=10);
}

module tc_plate()
{
  import("stl_files/TC-PLATE.stl", convexity=10);
}

module tc_ramp()
{
  import("stl_files/TC-RAMP.stl", convexity=10);
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

module x_rail(x)
{
  //rotate([0,180,90]) translate([0,-180,0]) mgn_12_schiene_x();
  translate([0,0,20]) rotate([0,0,90]) translate([0,-180,0]) mgn_12_schiene_x();
}

module y_rail()
{
  import("stl_files/MGNR12R400HM.stl", convexity = 10);
}

module y_schiene(x)
{
  translate([x,-204,0]) union()
    {
      mgn_12_schiene_y();
    }
}


module z_rail()
{
  import("stl_files/MGNR12R456HM.stl", convexity = 10);
}

module z_ball_screw_spindel()
{
  import("stl_files/hiwin_debn_spindel.stl", convexity = 10);
}

module z_ball_screw_flanschmutter()
{
  import("stl_files/hiwin_debn_flanschmutter.stl", convexity = 10);
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

module mgn_12_c()
{
  import("stl_files/MGN12CZ0HM.stl", convexity=10);
}

module mgn_12_h()
{
  import("stl_files/MGN12HZ0HM.stl", convexity = 10);
}

module mgn_12_schiene_bed()
{
  import("stl_files/MGNR12R150HM.stl", convexity=10);
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

module left() {
  # union() {
    translate([-13.1,-14.15,0])
      cube([52 ,28.3,35]);
    translate([13.5,-14.15,-10])
      cube([25.4,28.3,10]);
  }
}

module y_left_guide_hevort()
{
  translate([18.9,-24.4,40 - 4.95 + 0.15]) rotate([180,0,180]) left_upper_mod();
  translate([-0.5 + 15 - (3.2 / 2), 8.25 - (3.2/2) + 7.5, -9]) rotate([90,0,0]) left_lower_mod();
}

module y_right_guide_hevort()
{
  translate([-12.9,-8.05,35 + 0.15]) rotate([0,180,0]) right_upper_mod();
  translate([-12.9,-8.25 - 5.9,-9.1]) rotate([-90,0,0]) right_lower_mod();
}
