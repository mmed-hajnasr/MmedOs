{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nvidia-docker
    docker_26
    nvidia-container-toolkit
    docker-compose
  ];
  hardware.nvidia-container-toolkit.enable = true;
  virtualisation = {
    containers.enable = true;
    docker = {
      enable = true;
      enableNvidia = true;
      enableOnBoot = true;
      package = pkgs.docker_26;
    };
  };
}
