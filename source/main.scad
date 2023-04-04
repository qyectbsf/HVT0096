include <global_vars.scad>

include <gantry/belt_tentioner.scad>
include <gantry/pulley_and_motor_back_left.scad>
include <gantry/pulley_and_motor_back_right.scad>
include <gantry/pulley_front_left_and_right.scad>

include <carriage/main.scad>

include <z_structure/main.scad>

include <bed/main.scad>

include <frame/main.scad>
include <stl_files/main.scad>

//$vpr = [90,0,-48];

module main()
{
  upper_belt();
  lower_belt();

  color([0.90, 0.90, 0.90]) frame();

  translate([0, 110,0]) z_structure();

  translate([0, 110, -46.8348 - 0.05]) bed();

  // for (i = [1,-1])
  //{
  //  y_schiene((30/2 + 420/2) * i);
  //}

  // gantry
  //color([0.20, 0.20, 0.20]) translate([-(240+3),-202.5 - 40,20]) pulley_front_left();
  //color([0.20, 0.20, 0.20]) translate([+(240+3),-202.5 - 40,20])  pulley_front_right();
  /* color([0.20, 0.20, 0.20]) translate([-225,220 + 150,-30]) rotate([0,0,-90]) motor_and_pulley_back_left(); */
  /* color([0.20, 0.20, 0.20]) translate([225,220 + 150,-30]) rotate([0,0,-90]) motor_and_pulley_back_right(); */
  //color([0.20, 0.20, 0.20]) translate([0,220 + 150,0]) rotate([0,0,180]) belt_tentioner();
  // printer has a y offset of + 15 mm
  translate([0, -44 + current_y_position, 18]) y_movement();

  //translate([0,270,0]) tool_changer();
}

module upper_belt()
{
  if ( show_belt == 1 )
  {
    # translate([-400,-400, upper_belt_z + 1.4]) cube([800,800,6]);
  }
}

module lower_belt()
{
  if ( show_belt == 1 )
  {
    # translate([-400,-400, lower_belt_z + 1.4]) cube([800,800,6]);
  }
}

module y_movement()
{
  // commented out cause of poor unrendered perfomance
  /* translate([-212.1,-73,4]) rotate([90,0,0]) left_lower_mod(); */
  /* translate([-206.1,-111.54,48.05]) rotate([0,180,0]) left_upper_mod(); */
  /* translate([212.1,-101.3,3.9]) rotate([-90,0,0]) right_lower_mod(); */
  /* translate([212.1,-95.2,48.05]) rotate([0,180,0]) right_upper_mod(); */

  // 20x20 alu profile
  translate([0,- 152.15 +65,29.2]) cube([420,20,20], center = true);

  translate([0,- 152.15 + 65,19.2]) x_schiene(0);

  for (i = [1,-1])
  {
    translate([(30/2 + 420/2)*i,-104,0]) mgn_12_c();
  }

  translate([-15.3 + current_x_position,0,0]) x_movement();
}

module x_movement()
{
  //translate([22.2 + - 150, - 152.15 + 65,19.2]) rotate([0,180,90]) mgn_12_h();
  translate([22.2 + - 150, - 152.15 + 65,19.2+ 20]) rotate([0,0,90]) mgn_12_h();
  //translate([- 150,- 152.14 + 65,0]) carriage_qye();
  translate([-150,- 152.14 + 65, 26.2 + 13 - 52]) carriage_e3d();
}

main();
