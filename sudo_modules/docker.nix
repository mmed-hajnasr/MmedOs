{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nvidia-docker
    docker_26
    nvidia-container-toolkit
    docker-compose
  ];
  virtualisation = {
    containers.enable = true;
    docker = {
      enable = true;
      enableOnBoot = true;
      package = pkgs.docker_26;
    };
  };
}
