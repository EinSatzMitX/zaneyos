{
  config,
  pkgs,
  lib,
  ...
}: let
  # Fetch the Quickshell flake directly
  quickshell-flake = builtins.fetchGit {
    url = "https://git.outfoxxed.me/outfoxxed/quickshell.git";
    # optional: pin to a tag or commit
    # ref = "v0.1.0";
  };

  # Load the flake outputs
  quickshell = import (quickshell-flake + "/flake.nix") {inherit pkgs;};
in {
  options.quickshell.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable installation of Quickshell";
  };

  config = lib.mkIf config.quickshell.enable {
    # add the Quickshell package into the system
    environment.systemPackages = [
      quickshell.packages.${config.system}.default
    ];

    # (optional) export the `quickshell` binary into your PATH earlier
    # so it overrides any other similarly-named executables
    # environment.sessionPath = [ pkgs.writeBinDir {
    #   name = "quickshell";
    #   command = "${quickshell.packages.${config.system}.default}/bin/quickshell";
    # } ];
  };
}
