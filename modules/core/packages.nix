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

  environment.systemPackages = with pkgs; [
    amfora # Fancy Terminal Browser For Gemini Protocol
    appimage-run # Needed For AppImage Support
    aseprite # Pixelart editor
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
    gcc # If you don't know what this is, go fuck yourself
    gedit # Simple Graphical Text Editor
    gimp # Great Photo Editor
    gitui # Git UI terminal program
    glibc
    glxinfo #needed for inxi diag util
    greetd.tuigreet # The Login Manager (Sometimes Referred To As Display Manager)
    htop # Simple Terminal Based System Monitor
    hyprpicker # Color Picker
    eog # For Image Viewing
    inxi # CLI System Information Tool
    killall # For Killing All Instances Of Programs
    libnotify # For Notifications
    lm_sensors # Used For Getting Hardware Temps
    lolcat # Add Colors To Your Terminal Command Output
    lshw # Detailed Hardware Information
    modrinth-app # Minecraft Modded Launcher
    mpv # Incredible Video Player
    ncdu # Disk Usage Analyzer With Ncurses Interface
    ncspot # Spotify Terminal Client
    nixfmt-rfc-style # Nix Formatter
    nwg-displays #configure monitor configs via GUI
    onefetch #provides zsaneyos build info on current system
    obsidian # Markdown Document Editor
    obs-studio # Video recording software
    pavucontrol # For Editing Audio Levels & Devices
    pciutils # Collection Of Tools For Inspecting PCI Devices
    picard # For Changing Music Metadata & Getting Cover Art
    pkg-config # Wrapper Script For Allowing Packages To Get Info On Others

    playerctl # Allows Changing Media Volume Through Scripts
    prismlauncher # Minecraft Launcher
    r2modman
    rhythmbox
    ripgrep # Improved Grep
    rust-analyzer
    rustup
    socat # Needed For Screenshots
    unrar # Tool For Handling .rar Files
    unzip # Tool For Handling .zip Files
    usbutils # Good Tools For USB Devices
    v4l-utils # Used For Things Like OBS Virtual Camera
    vesktop # Discord client
    vscode # Alternative code editor to nvim
    wget # Tool For Fetching Files With Links
    ytmdl # Tool For Downloading Audio From YouTube
  ];
}
