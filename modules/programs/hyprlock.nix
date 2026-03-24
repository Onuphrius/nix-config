{config, pkgs, wallpapers, ...}:


{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
	hide_cursor = true;
      };
      background = {
	path = "${wallpapers}/mountain.jpg";
	blur_passes = 3;
	blur_size = 5;
	crossfade_time = 300;
      };
      input-field = {
	size = "300, 60";
	font_color = "rgb(202, 211, 245)";
	inner_color = "rgba(91, 96, 120, 0)";
	outer_color = "rgb(202, 211, 245)";
	outline_thickness = 2;

      
      };
    };
  };

}
