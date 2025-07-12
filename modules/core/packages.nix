{
  pkgs,
  inputs,
  ...
}: {
  programs = {
    firefox.enable = false; # Firefox is not installed by default
    hyprland.enable = true; #someone forgot to set this so desktop file is created
    dconf.enable = true;
    seahorse.enable = true;
    fuse.userAllowOther = true;
    mtr.enable = true;
    adb.enable = true;
    hyprlock.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs;
    [
      amfora # Fancy Terminal Browser For Gemini Protocol
      appimage-run # Needed For AppImage Support
      aseprite # Pixelart editor
      blender # 3D Modeling Software
      brave # Brave Browser
      btop # System Task Manager
      brightnessctl # For Screen Brightness Control
      cbonsai # Bonsai tree generator in terminal
      cliphist # Clipboard manager using rofi menu
      cmatrix # Matrix Movie Effect In Terminal
      cowsay # Great Fun Terminal Program
      docker-compose # Allows Controlling Docker From A Single File
      duf # Utility For Viewing Disk Usage In Terminal
      eza # Beautiful ls Replacement
      fastfetch # System info
      ffmpeg # Terminal Video / Audio Editing
      file-roller # Archive Manager
      flatpak
      gcc # If you don't know what this is, go fuck yourself
      gedit # Simple Graphical Text Editor
      gimp # Great Photo Editor
      gitui # Git UI terminal program
      glibc
      glxinfo #needed for inxi diag util
      godot # Open source game engine
      greetd.tuigreet # The Login Manager (Sometimes Referred To As Display Manager)
      htop # Simple Terminal Based System Monitor
      hyprpicker # Color Picker
      eog # For Image Viewing
      inxi # CLI System Information Tool
      killall # For Killing All Instances Of Programs
      legendary-heroic # Epic games launcher
      libnotify # For Notifications
      libreoffice # Open-source Microsoft Office, if you want to say so
      lm_sensors # Used For Getting Hardware Temps
      lolcat # Add Colors To Your Terminal Command Output
      lshw # Detailed Hardware Information
      modrinth-app # Minecraft Modded Launcher
      mpv # Incredible Video Player
      ncdu # Disk Usage Analyzer With Ncurses Interface
      nixfmt-rfc-style # Nix Formatter
      nwg-displays #configure monitor configs via GUI
      onefetch #provides zsaneyos build info on current system
      obsidian # Markdown Document Editor
      obs-studio # Video recording software
      openrazer-daemon
      pavucontrol # For Editing Audio Levels & Devices
      pciutils # Collection Of Tools For Inspecting PCI Devices
      picard # For Changing Music Metadata & Getting Cover Art
      pkg-config # Wrapper Script For Allowing Packages To Get Info On Others

      playerctl # Allows Changing Media Volume Through Scripts
      polychromatic # For configuring razer devices
      prismlauncher # Minecraft Launcher
      r2modman # Mod manager for Steam games
      rhythmbox
      ripgrep # Improved Grep
      rust-analyzer
      rustup
      satisfactorymodmanager # Mod manager for Satisfactory
      socat # Needed For Screenshots
      solaar # For configuring LogiTech devices
      spotify-player # Spotify TUI application
      st # Simple terminal for testing cli and tui applications
      tokei # Utility or Counting lines of code
      unrar # Tool For Handling .rar Files
      unzip # Tool For Handling .zip Files
      usbutils # Good Tools For USB Devices
      v4l-utils # Used For Things Like OBS Virtual Camera
      vesktop # Discord client
      vscode # Alternative code editor to nvim
      wget # Tool For Fetching Files With Links
      ytmdl # Tool For Downloading Audio From YouTube
    ]
    ++ (inputs.nix-gaming.lib.legendaryBuilder pkgs
      {
        games = {
          rocket-league = {
            # find names with legendary list
            desktopName = "Rocket League";

            # find out on lutris/winedb/protondb
            tricks = ["dxvk" "win10"];

            # google "<game name> logo"
            icon = builtins.fetchurl {
              # original url = "https://www.pngkey.com/png/full/16-160666_rocket-league-png.png";
              url = "https://user-images.githubusercontent.com/36706276/203341314-eaaa0659-9b79-4f40-8b4a-9bc1f2b17e45.png";
              name = "rocket-league.png";
              sha256 = "0a9ayr3vwsmljy7dpf8wgichsbj4i4wrmd8awv2hffab82fz4ykb";
            };

            # if you don't want winediscordipcbridge running for this game
            discordIntegration = false;
            # if you dont' want to launch the game using gamemode
            gamemodeIntegration = false;

            preCommands = ''
              echo "the game will start!"
            '';

            postCommands = ''
              echo "the game has stopped!"
            '';
          };
        };

        opts = {
          # same options as above can be provided here, and will be applied to all games
          # NOTE: game-specific options take precedence
          wine = inputs.nix-gaming.packages.${pkgs.system}.wine-tkg;
        };
      });
  # So I don't build gcc when building nix-gaming
  nix.settings = {
    substituters = ["https://nix-gaming.cachix.org"];
    trusted-public-keys = ["nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="];
  };
}
