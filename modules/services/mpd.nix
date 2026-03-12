{ config, pkgs, ... }:

{
  services.mpd = {
    enable = true;
    musicDirectory = "~/Music";
    extraConfig = 
    ''
    audio_output {
      type "pulse"
      name "PulseAudio"
    }

    '';
  };
}
