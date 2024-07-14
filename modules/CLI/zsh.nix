{ config, ... }:
{
  programs.zsh = {
    enable = true;
    # autocd = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    history.size = 1000;
    history.path = "${config.xdg.dataHome}/zsh/history";
    initExtra = ''
      bindkey -v
      bindkey '^[OA' history-beginning-search-backward
      bindkey '^[OB' history-beginning-search-forward
      echo "
        ▀██    ██▀                        ▀██  
         ███  ███  ▄▄ ▄▄ ▄▄     ▄▄▄▄    ▄▄ ██  
         █▀█▄▄▀██   ██ ██ ██  ▄█▄▄▄██ ▄▀  ▀██  
         █ ▀█▀ ██   ██ ██ ██  ██      █▄   ██  
        ▄█▄ █ ▄██▄ ▄██ ██ ██▄  ▀█▄▄▄▀ ▀█▄▄▀██▄ 
      "
    '';
  };
}
