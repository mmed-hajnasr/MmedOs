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
      echo "$(tput setaf 5)
        ▀██    ██▀                        ▀██  
         ███  ███  ▄▄ ▄▄ ▄▄     ▄▄▄▄    ▄▄ ██  
         █▀█▄▄▀██   ██ ██ ██  ▄█▄▄▄██ ▄▀  ▀██  
         █ ▀█▀ ██   ██ ██ ██  ██      █▄   ██  
        ▄█▄ █ ▄██▄ ▄██ ██ ██▄  ▀█▄▄▄▀ ▀█▄▄▀██▄ 
      $(tput sgr0)"
      if [ -e "$HOME/.blood_pact.txt" ] && [ -s "$HOME/.blood_pact.txt" ]; then
          echo -e "\e[31mI SHALL \e[0m$(cat ~/.blood_pact.txt)"     
      fi
    '';
  };
}
