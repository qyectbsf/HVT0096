pulley_r = 6;

// Define the radius for each idler individually.
// Use positive (6) for one side, negative (-6) for the opposite side.
lower_belt_radii = [+6.05, +6.05, -6.05, +6.05, -6.05, +6.05, -6.05, +6.05, -6.05];
upper_belt_radii = [-6.05, +6.05, -6.05, +6.00, -6.05, +6.05, -6.05, +6.05, +6.05];

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
