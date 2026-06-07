{
  services.wlsunset = {
    enable = true;
    gamma = 0.6;
    sunrise = "7:00";
    sunset = "22:00";
    temperature.night = 4000;
    systemdTarget = "graphical-session.target";
  };
}
