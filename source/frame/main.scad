module 2d_object_org() {
  translate([-15.2,-15.4,-20])
    scale(0.115)
    color("red")
    surface("/home/wolf/Pictures/sas.png");
}

module 30x30l_i_typ_nut_6_2d() {
  difference() {
    minkowski() {
      s = 7;

      square(size = 30 - s, center = true);
      circle(d=s, $fn=200);
    }

    for (i = [0,1,2,3]) {
      rotate([0,0,i * 90])
        polygon(points=[[-3,-15],[-3,-11.5],[-6,-11.5],
                        [-6,-13],[-8,-13],[-8,-10],
                        [-3.5,-5.25],[3.5,-5.25],[8,-10],
                        [8,-13],[6,-13],[6,-11.5],
                        [3,-11.5],[3,-15]],
                paths=[[0,1,2,3,4,5,6,7,8,9,10,11,12,13]]
                );
    }

    circle(d = 5, $fn = 20);
  }
}

module 30x30l_i_typ_nut_6_3d(h) {
  linear_extrude(height = h, convexity = 10, twist = 0) 30x30l_i_typ_nut_6_2d();
}

module frame()
{
  // #F01
  translate([-555,-260,-600]) 30x30l_i_typ_nut_6_3d(h = 1000);
  // #F02
  translate([-225,-260,-570]) 30x30l_i_typ_nut_6_3d(h = 940);
  // #F03
  translate([225,-260,-570]) 30x30l_i_typ_nut_6_3d(h = 940);
  // #F04
  translate([555,-260,-600]) 30x30l_i_typ_nut_6_3d(h = 1000);
  // #F05
  translate([555,370,-600]) 30x30l_i_typ_nut_6_3d(h = 1000);
  // #F06
  translate([225,370,-570]) 30x30l_i_typ_nut_6_3d(h = 940);
  // #F07
  translate([-225,370,-570]) 30x30l_i_typ_nut_6_3d(h = 940);
  // #F08
  translate([-555,370,-600]) 30x30l_i_typ_nut_6_3d(h = 1000);
  // #F09
  translate([-540,-260,-585]) rotate([0,90,0]) 30x30l_i_typ_nut_6_3d(h = 1080);
  // #F10
  translate([-540,370,-585]) rotate([0,90,0]) 30x30l_i_typ_nut_6_3d(h = 1080);
  // #F11
  translate([-540,370,385]) rotate([0,90,0]) 30x30l_i_typ_nut_6_3d(h = 1080);
  // #F12
  translate([-540,-260,385]) rotate([0,90,0]) 30x30l_i_typ_nut_6_3d(h = 1080);
  // #F13
  translate([-555,-245,-585]) rotate([-90,0,0]) 30x30l_i_typ_nut_6_3d(h = 600);
  // #F14
  translate([555,-245,-585]) rotate([-90,0,0]) 30x30l_i_typ_nut_6_3d(h = 600);
  // #F15
  translate([555,-245,385]) rotate([-90,0,0]) 30x30l_i_typ_nut_6_3d(h = 600);
  // #F16
  translate([-555,-245,385]) rotate([-90,0,0]) 30x30l_i_typ_nut_6_3d(h = 600);

  // #F17
  translate([-225,-245,-555]) rotate([-90,0,0]) 30x30l_i_typ_nut_6_3d(h = 600);
  // #F18
  translate([225,-245,-555]) rotate([-90,0,0]) 30x30l_i_typ_nut_6_3d(h = 600);
  // #F19
  translate([225,-245,-15]) rotate([-90,0,0]) 30x30l_i_typ_nut_6_3d(h = 600);
  // #F20
  translate([225,-245,385]) rotate([-90,0,0]) 30x30l_i_typ_nut_6_3d(h = 600);
  // #F21
  translate([-225,-245,385]) rotate([-90,0,0]) 30x30l_i_typ_nut_6_3d(h = 600);
  // #F22
  translate([-225,-245,-15]) rotate([-90,0,0]) 30x30l_i_typ_nut_6_3d(h = 600);

  // #F23
  translate([210, 220 + 150,-15]) rotate([0,-90,0]) 30x30l_i_typ_nut_6_3d(h = 420);
  // #F24
  translate([210, 330,-555]) rotate([0,-90,0]) 30x30l_i_typ_nut_6_3d(h = 420);

  // #F25
  translate([-225, -190 + 110,-600 + 60]) 30x30l_i_typ_nut_6_3d(h = 510);
  // #F26
  translate([225, -190 + 110,-600 + 60]) 30x30l_i_typ_nut_6_3d(h = 510);
  // #F27
  translate([0, 220 + 110,-600 + 60]) 30x30l_i_typ_nut_6_3d(h = 510);
  // #F28
  translate([210, 220 + 110,-15]) rotate([0,-90,0]) 30x30l_i_typ_nut_6_3d(h = 420);
}

//2d_object_org();

//frame();

