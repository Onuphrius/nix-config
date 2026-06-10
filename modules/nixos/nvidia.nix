{pkgs, config, ...}:
{
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    open = false;
    modesetting.enable = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  boot.kernelParams = [
    "nvidia_drm.modeset=1"
  ];
  environment.systemPackages = with pkgs; [
    cudatoolkit
  ];
    
}
