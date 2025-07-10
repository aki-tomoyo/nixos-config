{config, pkgs, ... }:{
nixpkgs.config.allowUnfree = true;
nix.settings.substituters=["https://mirrors.ustc.edu.cn/nix-channels/store"];
nix.settings.allowed-users=["tomoyo"];
imports = [<home-manager/nixos> ./hardware-configuration.nix ./boot.nix ./desktop.nix ./users.nix ];
users = {
  users.tomoyo = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager" "audio" "video" "lp" "plugdev" "bluetooth" "seat" "systemd-logind" "adm" "kvm" "libvirt"];
  };
};
networking.networkmanager.enable = true;
environment.systemPackages = with pkgs;[
neofetch curl wget git rsync rclone home-manager
zed-editor vivaldi bitwarden-desktop telegram-desktop 
fcitx5 fcitx5-rime fcitx5-mozc-ut 
kdePackages.fcitx5-with-addons];
time.timeZone = "Asia/Hong_Kong";
i18n.defaultLocale = "en_US.UTF-8";

system.stateVersion = "25.05";
}
