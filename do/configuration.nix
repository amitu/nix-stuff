{ pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./networking.nix # generated at runtime by nixos-infect
    <home-manager/nixos>
  ];

  system.autoUpgrade.enable = true;
  system.autoUpgrade.channel = https://nixos.org/channels/nixos-19.03;

  environment.systemPackages = with pkgs;
    [ curl
      wget
      htop
      nixpkgs-fmt
      zsh
      direnv
      vim
      home-manager
      git
      mkpasswd
    ];

  services.postgresql.package = pkgs.postgresql_11;
  services.postgresql.enable = true;

  users.users.amitu = {
    isNormalUser = true;
    home = "/home/amitu";
    shell = pkgs.zsh;
    description = "Amit Upadhyay";
    extraGroups = [ "wheel" "networkmanager" ];
    hashedPassword = "$6$ZHec5umTGxr/sLb$5STbnvKrE.5xuDfpLpIlPSXzNGYPUvOmqnZQKi0UFz2.wQo9dHE3Pl1LDMeobDuf8ezWPJmpT/D9iqEOlbXLB1";
    openssh.authorizedKeys.keys = [ 
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDRB9IHqcHbugFZAY9X6uSNwHtcWl7dAtWN/2A+id4Zc1l3GX5wD+ZUZxLGJEv2xlyU9K2sGpJVBqRwL4YmZTyNLA2CtkkIoLxd+bSMFl+HjU+UfOY1xF24tEqWoxhefL/1LZYBqFTi1HPI8YGd+TJ2JvFx8cjhwCNUlVqrvOFLqYTiN+YqcENrbs1Ge2zRF4fHcHuvL1JjyfDxoaoHiV8kliHf4ZWJBp1tjLCkbV85YbAOFgd8byUBtY9Y5gqPidF940UeiFnbXgU1EdyVb9piVk6yuedyZBGgqRGr+83cV7poa3K6t0q5rb3+DqI5uosyEXeHDw70BzeWyLEFPg+9 amitu2@amitu.com"
    ];
  };
  users.mutableUsers = false;
  home-manager.users.amitu = { pkgs, ... }: {
    programs.emacs = {
      enable = true;
      extraPackages = epkgs: [
        epkgs.nix-mode
        epkgs.magit
      ];
    };
    home.packages = [ pkgs.httpie ];
    programs.git = {
      enable = true;
      userName = "Amit Upadhyay";
      userEmail = "upadhyay@gmail.com";
    };
    programs.zsh = {
      enable = true;
    };
    
  };
  home-manager.useUserPackages = true;
  programs.zsh = {
     enable = true;
     autosuggestions.enable = true;
     syntaxHighlighting = {
       enable = true;
       highlighters = [ "main" "brackets" "cursor" ];
     };
     ohMyZsh = {
       enable = true;
       plugins = [ "git" ];
       theme = "robbyrussell";
       customPkgs = with pkgs; [
         pkgs.nix-zsh-completions
       ];
     };
  };

  boot.cleanTmpDir = true;
  networking.hostName = "amitu";
  networking.firewall.allowPing = true;
  services.openssh.enable = true;
  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDRB9IHqcHbugFZAY9X6uSNwHtcWl7dAtWN/2A+id4Zc1l3GX5wD+ZUZxLGJEv2xlyU9K2sGpJVBqRwL4YmZTyNLA2CtkkIoLxd+bSMFl+HjU+UfOY1xF24tEqWoxhefL/1LZYBqFTi1HPI8YGd+TJ2JvFx8cjhwCNUlVqrvOFLqYTiN+YqcENrbs1Ge2zRF4fHcHuvL1JjyfDxoaoHiV8kliHf4ZWJBp1tjLCkbV85YbAOFgd8byUBtY9Y5gqPidF940UeiFnbXgU1EdyVb9piVk6yuedyZBGgqRGr+83cV7poa3K6t0q5rb3+DqI5uosyEXeHDw70BzeWyLEFPg+9 amitu2@amitu.com"
  ];
}
