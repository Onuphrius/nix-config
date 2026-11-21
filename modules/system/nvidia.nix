{
  flake.modules.nixos.nvidia = {pkgs, config, lib, ...}: {
    services.xserver.videoDrivers = ["nvidia"];
    hardware.graphics.enable = true;
    hardware.nvidia = {
      open = false;
      modesetting.enable = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };

    boot.kernelParams = [
      "nvidia_drm.modeset=1"
    ];
    #environment.systemPackages = with pkgs; [
    #  cudatoolkit
    #];
    
    #Sway support
    programs.sway.extraOptions = lib.mkIf config.programs.sway.enable [
      "--unsupported-gpu"
    ];

  };
}
