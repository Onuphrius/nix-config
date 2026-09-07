{ pkgs, ... }:

{
  users.users.minecraft = {
    isNormalUser = true;
    description = "Minecraft Server";
    home = "/home/minecraft";
    extraGroups = ["wheel"];

    openssh.authorizedKeys.keys = [
    "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAID54EQ+u3Ygil7DSp1ZZDVVXwS++ZwmScIV3qUyF1XdaAAAABHNzaDo= key-1"
    ];
  };
  networking.firewall.allowedTCPPorts = [ 25565 ];
  # SSH server
  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
  };
  systemd.services.minecraft = {
    description = "Minecraft Server";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      User = "minecraft";

      WorkingDirectory = "/home/minecraft/gt_server";

      ExecStart = "${pkgs.jdk25}/bin/java -Xms6G -Xmx6G -Dfml.readTimeout=180 @java9args.txt -jar lwjgl3ify-forgePatches.jar nogui";

      Restart = "always";
      RestartSec = "10s";
      RuntimeMaxSec = "24h";

    };
  };
  services.ddclient = {
    enable = true;

    interval = "5min";

    protocol = "namecheap";
    server = "dynamicdns.park-your-domain.com";

    username = "bigschniff.com";
    passwordFile = "/etc/ddclient/password";

    domains = [
      "@.bigschniff.com"
    ];

    ssl = true;
  };
}



