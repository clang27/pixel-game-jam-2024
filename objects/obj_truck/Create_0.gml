trash_hovering_correctly = false;
trash_hovering_incorrectly = false;
drag_growth_scale = 1.05;
drag_growth_speed = 40;

in_texel = shader_get_uniform(sh_outline, "in_texel");
outline_pixel_width = shader_get_uniform(sh_outline, "pixel_width");
outline_color = shader_get_uniform(sh_outline, "color");