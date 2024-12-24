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
      source ~/.config/functions.sh

      file="$HOME/.banner.txt"
      if [[ -f "$file" ]]; then
        echo "$(tput setaf 5)$(cat "$file")$(tput sgr0)"
      else
        echo "$(tput setaf 5)
          ▀██    ██▀                        ▀██  
           ███  ███  ▄▄ ▄▄ ▄▄     ▄▄▄▄    ▄▄ ██  
           █▀█▄▄▀██   ██ ██ ██  ▄█▄▄▄██ ▄▀  ▀██  
           █ ▀█▀ ██   ██ ██ ██  ██      █▄   ██  
          ▄█▄ █ ▄██▄ ▄██ ██ ██▄  ▀█▄▄▄▀ ▀█▄▄▀██▄ 
        $(tput sgr0)"
      fi
    '';
  };
}
