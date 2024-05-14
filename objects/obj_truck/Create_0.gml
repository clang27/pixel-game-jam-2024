obj_truck_manager.truck_count++;

trash_hovering_correctly = false;
trash_hovering_incorrectly = false;
drag_growth_scale = 1.05;
drag_growth_speed = 40;

in_texel = shader_get_uniform(sh_outline, "in_texel");
outline_pixel_width = shader_get_uniform(sh_outline, "pixel_width");
outline_color = shader_get_uniform(sh_outline, "color");

drive_in_speed = 2;
drive_out_speed = 0.6;
wait_time = irandom_range(1, 6);

reached_top_path = false;
waiting_at_top_path = false;
disabled = false;