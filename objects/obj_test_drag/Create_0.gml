dragging = false;
drag_growth_scale = 1.25;
drag_growth_speed = 20;
drag_speed = 10;
deceleration = 5;
x_velocity = 0;
y_velocity = 0.2;
goal_x_velocity = 0;
goal_y_velocity = 0.2;
touching_shore = false;

mouse_over = false;


in_texel = shader_get_uniform(sh_outline, "in_texel");
outline_pixel_width = shader_get_uniform(sh_outline, "pixel_width");
outline_color = shader_get_uniform(sh_outline, "color");