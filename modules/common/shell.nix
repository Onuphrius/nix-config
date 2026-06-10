{
  programs.zsh = {
    enable = true;

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    enableCompletion = true;

    history.size = 10000;

    initContent = ''
      zstyle ':completion:*' menu select
    '';
  };
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
