{config, pkgs}:

{
  services.openssh.enable = true;
  enviroment.etc."install.sh".source = "./install.sh";

  systemd.services.autoinstall = {
    description = "Automatic NixOS Install";
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];

    serviceConfig = {
      Type = "oneshot";
      ExecStart = "/etc/install.sh";
    };
  };
}

