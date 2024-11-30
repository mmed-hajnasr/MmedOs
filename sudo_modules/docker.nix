{ config, lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nvidia-docker
    docker_25
    nvidia-container-toolkit
  ];
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.beta;
  systemd.enableUnifiedCgroupHierarchy = false;
  hardware.nvidia-container-toolkit.enable = true;
  virtualisation = {
    containers.enable = true;
    docker = {
      enable = true;
      # CDI is feature-gated and only available from Docker 25 and onwards
      #package = pkgs.docker_26;
      package = pkgs.docker_25;
      # setSocketVariable = true;
      daemon.settings = {
        features.cdi = true;
        default-runtime = "nvidia";
        runtimes.nvidia.path = "${pkgs.nvidia-docker}/bin/nvidia-container-runtime";
        exec-opts = [ "native.cgroupdriver=cgroupfs" ];
      };
      #storageDriver = "zfs";
    };
    #oci-containers.backend = "docker";
  };
}
