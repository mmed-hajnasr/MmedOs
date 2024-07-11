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
      source ~/.config/functions.sh;
      bindkey -v
      bindkey '^[[A' history-beginning-search-backward
      bindkey '^[[B' history-beginning-search-forward

      echo "
      ░░░    ░░░ ░░░    ░░░ ░░░░░░░ ░░░░░░  
      ▒▒▒▒  ▒▒▒▒ ▒▒▒▒  ▒▒▒▒ ▒▒      ▒▒   ▒▒ 
      ▒▒ ▒▒▒▒ ▒▒ ▒▒ ▒▒▒▒ ▒▒ ▒▒▒▒▒   ▒▒   ▒▒ 
      ▓▓  ▓▓  ▓▓ ▓▓  ▓▓  ▓▓ ▓▓      ▓▓   ▓▓ 
      ██      ██ ██      ██ ███████ ██████  
      "

    '';
  };
}
