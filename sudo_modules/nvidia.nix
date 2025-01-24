{ config, lib, pkgs, ... }:
{
  nixpkgs = {
    config = {
      allowUnfree = lib.mkDefault true;
      nvidia.acceptLicense = true;
    };
  };
  environment.systemPackages = with pkgs; [
    nvtopPackages.full
  ];
  services.xserver.videoDrivers = [ "nvidia" ];

  boot.kernelParams = [ "nvidia.NVreg_PreserveVideoMemoryAllocations=1" ];
  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
  };
  hardware = {
    graphics.enable = true;
    nvidia-container-toolkit.enable = true;
    nvidia = {
      prime = {
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      open = true;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };
}
