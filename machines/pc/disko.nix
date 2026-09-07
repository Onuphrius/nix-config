{
  disko.devices = {
    disk.main = {
      type = "disk";
      device = "/dev/disk/by-id/ata-HP_SSD_S700_250GB_HBSB29520100154"; # <-- change if needed
      content = {
        type = "gpt";
        partitions = {
          ESP = {
            size = "512M";
            type = "EF00";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
              mountOptions = [ "fmask=0077" "dmask=0077" ];
            };
          };

          swap = {
            size = "8G"; # adjust to match your actual swap size
            content = {
              type = "swap";
            };
          };

          root = {
            size = "100%";
            content = {
              type = "filesystem";
              format = "ext4";
              mountpoint = "/";
            };
          };
        };
      };
    };
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
