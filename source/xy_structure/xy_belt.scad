pulley_r = 6;

// positive or negative for direction
lower_belt_radii = [+6.05, +6.05, -6.05, +6.05, -6.05, +6.05, -6.05, +6.05, -6.05];
upper_belt_radii = [-6.05, +6.05, -6.05, +6.00, -6.05, +6.05, -6.05, +6.05, +6.05];

lower_belt_radii_clear = [+4.05, +4.05, -8.05, +4.05, -8.05, +4.05, -8.05, +4.05, -8.05];
upper_belt_radii_clear = [-8.05, +4.05, -8.05, +4.00, -8.05, +4.05, -8.05, +4.05, +4.05];


module lower_belt()
{
  lower_belt_points= [
           [lower_belt_start_position_x, lower_belt_start_position_y, 0],
           [lower_belt_idler_x_coordinates[0], lower_belt_idler_y_coordinates[0], lower_belt_radii[0]],
           [lower_belt_idler_x_coordinates[1], lower_belt_idler_y_coordinates[1], lower_belt_radii[1]],
           [lower_belt_idler_x_coordinates[2], lower_belt_idler_y_coordinates[2], lower_belt_radii[2]],
           [lower_belt_idler_x_coordinates[3], lower_belt_idler_y_coordinates[3], lower_belt_radii[3]],
           [lower_belt_idler_x_coordinates[4], lower_belt_idler_y_coordinates[4], lower_belt_radii[4]],
           [lower_belt_idler_x_coordinates[5], lower_belt_idler_y_coordinates[5], lower_belt_radii[5]],
           [lower_belt_idler_x_coordinates[6], lower_belt_idler_y_coordinates[6], lower_belt_radii[6]],
           [lower_belt_idler_x_coordinates[7], lower_belt_idler_y_coordinates[7], lower_belt_radii[7]],
           [lower_belt_idler_x_coordinates[8], lower_belt_idler_y_coordinates[8], lower_belt_radii[8]],
           [lower_belt_end_position_x, lower_belt_end_position_y, 0]
           ];

  belt(GT2x6, lower_belt_points, open=true);
}

module lower_belt_cutout()
{
  GT2x6_clearance = [
                     for (i = [0 : len(GT2x6) - 1])
                       i == 2 ? GT2x6[i] + 2 :
                         i == 3 ? GT2x6[i] + 4 :
                         GT2x6[i]
                     ];

  lower_belt_points= [
           [lower_belt_start_position_x, lower_belt_start_position_y +2, 0],
           [lower_belt_idler_x_coordinates[0], lower_belt_idler_y_coordinates[0], lower_belt_radii_clear[0]],
           [lower_belt_idler_x_coordinates[1], lower_belt_idler_y_coordinates[1], lower_belt_radii_clear[1]],
           [lower_belt_idler_x_coordinates[2], lower_belt_idler_y_coordinates[2], lower_belt_radii_clear[2]],
           [lower_belt_idler_x_coordinates[3], lower_belt_idler_y_coordinates[3], lower_belt_radii_clear[3]],
           [lower_belt_idler_x_coordinates[4], lower_belt_idler_y_coordinates[4], lower_belt_radii_clear[4]],
           [lower_belt_idler_x_coordinates[5], lower_belt_idler_y_coordinates[5], lower_belt_radii_clear[5]],
           [lower_belt_idler_x_coordinates[6], lower_belt_idler_y_coordinates[6], lower_belt_radii_clear[6]],
           [lower_belt_idler_x_coordinates[7], lower_belt_idler_y_coordinates[7], lower_belt_radii_clear[7]],
           [lower_belt_idler_x_coordinates[8], lower_belt_idler_y_coordinates[8], lower_belt_radii_clear[8]],
           [lower_belt_end_position_x, lower_belt_end_position_y +2, 0]
           ];

  belt(GT2x6_clearance, lower_belt_points, open=true);
}

module upper_belt()
{
  upper_belt_points= [
           [upper_belt_start_position_x, upper_belt_start_position_y, 0],
           [upper_belt_idler_x_coordinates[0], upper_belt_idler_y_coordinates[0], upper_belt_radii[0]],
           [upper_belt_idler_x_coordinates[1], upper_belt_idler_y_coordinates[1], upper_belt_radii[1]],
           [upper_belt_idler_x_coordinates[2], upper_belt_idler_y_coordinates[2], upper_belt_radii[2]],
           [upper_belt_idler_x_coordinates[3], upper_belt_idler_y_coordinates[3], upper_belt_radii[3]],
           [upper_belt_idler_x_coordinates[4], upper_belt_idler_y_coordinates[4], upper_belt_radii[4]],
           [upper_belt_idler_x_coordinates[5], upper_belt_idler_y_coordinates[5], upper_belt_radii[5]],
           [upper_belt_idler_x_coordinates[6], upper_belt_idler_y_coordinates[6], upper_belt_radii[6]],
           [upper_belt_idler_x_coordinates[7], upper_belt_idler_y_coordinates[7], upper_belt_radii[7]],
           [upper_belt_idler_x_coordinates[8], upper_belt_idler_y_coordinates[8], upper_belt_radii[8]],
           [upper_belt_end_position_x, upper_belt_end_position_y, 0]
           ];

  belt(GT2x6, upper_belt_points, open=true);
}

module upper_belt_cutout()
{
  GT2x6_clearance = [
                     for (i = [0 : len(GT2x6) - 1])
                       i == 2 ? GT2x6[i] + 2 :
                         i == 3 ? GT2x6[i] + 4 :
                         GT2x6[i]
                     ];

    upper_belt_points= [
           [upper_belt_start_position_x, upper_belt_start_position_y +2, 0],
           [upper_belt_idler_x_coordinates[0], upper_belt_idler_y_coordinates[0], upper_belt_radii_clear[0]],
           [upper_belt_idler_x_coordinates[1], upper_belt_idler_y_coordinates[1], upper_belt_radii_clear[1]],
           [upper_belt_idler_x_coordinates[2], upper_belt_idler_y_coordinates[2], upper_belt_radii_clear[2]],
           [upper_belt_idler_x_coordinates[3], upper_belt_idler_y_coordinates[3], upper_belt_radii_clear[3]],
           [upper_belt_idler_x_coordinates[4], upper_belt_idler_y_coordinates[4], upper_belt_radii_clear[4]],
           [upper_belt_idler_x_coordinates[5], upper_belt_idler_y_coordinates[5], upper_belt_radii_clear[5]],
           [upper_belt_idler_x_coordinates[6], upper_belt_idler_y_coordinates[6], upper_belt_radii_clear[6]],
           [upper_belt_idler_x_coordinates[7], upper_belt_idler_y_coordinates[7], upper_belt_radii_clear[7]],
           [upper_belt_idler_x_coordinates[8], upper_belt_idler_y_coordinates[8], upper_belt_radii_clear[8]],
           [upper_belt_end_position_x, upper_belt_end_position_y +2, 0]
           ];

  belt(GT2x6_clearance, upper_belt_points, open=true);
}
