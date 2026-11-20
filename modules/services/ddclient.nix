{
  flake.modules.nixos.ddclient = {
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
  };
}
