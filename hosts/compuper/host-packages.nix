{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    audacity
    # discord
    # vesktop
    # vscode
    nodejs
    obs-studio
  ];
}
