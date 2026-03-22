{config, pkgs, wallpapers, ...}:


{
  programs.hyprlock = {
    enable = true;
    settings = {
      background = {
	path = "${wallpapers}/mountain.jpg";
	blur_passes = 1;
	blur_size = 1;
	crossfade_time = 300;
      };
      input-field = {
	size = "20% 5%";
      
      };
    };
  };

}
