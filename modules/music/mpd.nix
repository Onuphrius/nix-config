{ config, pkgs, ... }:

{
  services.mpd = {
    enable = true;
    musicDirectory = "~/Music";
    #network.listenAddress = "127.0.0.1";
    extraConfig = 
    ''
    audio_output {
      type "pipewire"
      name "PipeWire"
    }
    auto_update "yes"
    restore_paused "yes"
    bind_to_address "/tmp/mpd_socket"

    '';
  };
}
