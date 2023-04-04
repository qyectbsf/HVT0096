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
                        [-3,-5],[3,-5],[8,-10],
                        [8,-13],[6,-13],[6,-11.5],
                        [3,-11.5],[3,-15]],
                paths=[[0,1,2,3,4,5,6,7,8,9,10,11,12,13]]
                );
    }

    circle(d = 5, $fn = 20);
  }
}

module 20x20l_i_typ_nut_5_2d() {
  difference()
    {
      minkowski()
        {
          s = 4;

          square(size = 20 - s, center = true);
          circle(d=s, $fn=200);
        }

      for (i = [0,1,2,3])
        {
          rotate([0,0,i * 90])
            polygon(
                    points=[
                            [-2.5,-10],[-2.5,-8],[-6.5,-8],
                            [-2.5,-4],[2.5,-4],[6.5,-8],
                            [2.5,-8],[2.5,-10]],
                    paths=[[0,1,2,3,4,5,6,7]]
                    );
        }

      circle(d = 4.3, $fn = 20);
    }
}

module 30x30l_i_typ_nut_6_3d(h) {
  linear_extrude(height = h, convexity = 10, twist = 0) 30x30l_i_typ_nut_6_2d();
}

module 20x20l_i_typ_nut_5_3d(h) {
  linear_extrude(height = h, convexity = 10, twist = 0) 20x20l_i_typ_nut_5_2d();
}

module frame()
{
  if ( show_frame == 1 )
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
      translate([-225, -190 + 110,-600 + 60]) 30x30l_i_typ_nut_6_3d(h = 510);
      // #F25
      translate([225, -190 + 110,-600 + 60]) 30x30l_i_typ_nut_6_3d(h = 510);
      // #F26
      translate([0, 370, -600 + 30]) 30x30l_i_typ_nut_6_3d(h = 540);
    }
}
