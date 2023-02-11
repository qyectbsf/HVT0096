include <global_vars.scad>

include <gantry/belt_tentioner.scad>
include <gantry/motor_pulley_xy_left.scad>
include <gantry/pulley_mount.scad>
include <frame/main.scad>
include <stl_files/main.scad>

carriage_x_pos = 0;
carriage_y_pos = 0;

module main()
{
  upper_belt();
  lower_belt();

  frame();

  for (i = [1,-1])
    {
      y_schiene((30/2 + 420/2) * i);
    }

  translate([-(240+3),-202.5,20]) pulley_mount_front_left();
  translate([+(240+3),-202.5,20])  pulley_mount_front_right();

  translate([-225,220,-30]) rotate([0,0,-90]) motor_pulley_xy_left();
  /* //xy_right(); */

  translate([0,220,0]) rotate([0,0,180]) belt_tentioner();

  /* // printer has a y offset of + 15 mm */
  //translate([0,carriage_y_pos - 60 + 15,0]) y_movement();
}

module upper_belt()
{
  # translate([-400,-400, upper_belt_z + 1.4]) cube([800,800,6]);
}

module lower_belt()
{
  # translate([-400,-400, lower_belt_z + 1.4]) cube([800,800,6]);
}

module y_movement()
{
  translate([-212.1,-73,4]) rotate([90,0,0]) left_lower_mod();
  translate([-206.1,-111.54,48.05]) rotate([0,180,0]) left_upper_mod();

  //translate([212.1,-101.3,3.9]) rotate([-90,0,0]) right_lower_mod();
  //translate([212.1,-95.2,48.05]) rotate([0,180,0]) right_upper_mod();

  //  translate([0,- 152.15 +65,29.2]) cube([420,20,20], center = true);
  //translate([0,- 152.15 + 65,19.2]) x_schiene(0);

  //for (i = [1,-1])
  //{
  //  translate([(30/2 + 420/2)*i,-104,0]) mgn_12_c();
  //}

  //translate([carriage_x_pos + 2,0,0]) x_movement();
}

module x_movement()
{
  translate([22.2 + - 150, - 152.15 + 65,19.2]) rotate([0,180,90]) mgn_12_h();
  translate([- 150,- 152.14 + 65,0]) carriage_x_main();
}

main();
