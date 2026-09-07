{pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    wireshark
  ];

  programs.wireshark = {
    enable = true;
    package = pkgs.wireshark;
    dumpcap.enable = true;
    usbmon.enable = true;
  };
  users.users."bigschniff".extraGroups = [ "wireshark" ];
}
