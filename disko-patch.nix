{
  disko.devices = {
    disk.games = {
      type = "disk";
      device = "/dev/disk/by-id/ata-Samsung_SSD_870_QVO_1TB_S5RRNF1T407667K";
      content = {
	type = "gpt";
	partitions = {
	  games = {
	    size = "100%";
	    content = {
	      type = "filesystem";
	      format = "ext4";
	      mountpoint = "/games";
	      mountOptions = ["users" "nofail" "exec"];
	    };
	  };
	};
      };
    };
  };
}
