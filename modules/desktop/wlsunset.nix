{pkgs, ...}:
{
  services.wlsunset = {
    enable = true;
    gamma = 1;
    sunrise = "7:00";
    sunset = "22:00";
    temperature.night = 4000;
    systemdTarget = "graphical-session.target";
  };

  home.packages = [
    (pkgs.writeShellApplication {
      name = "wlsunset-toggle";
      runtimeInputs = [ pkgs.systemd ];
      text = ''
      if systemctl --user is-active --quiet wlsunset.service; then
          systemctl --user stop wlsunset.service
        else
          systemctl --user start wlsunset.service
        fi
      '';
    })
  ];
}
