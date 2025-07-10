{home-manager.users.tomoyo = {pkgs,...}:{
home.packages = [pkgs.atool pkgs.httpie];

home.stateVersion = "25.05";
programs.home-manager.enable =true;
};}
