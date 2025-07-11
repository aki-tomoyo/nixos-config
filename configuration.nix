{ config, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  nix.settings.substituters = [ "https://mirrors.ustc.edu.cn/nix-channels/store" ];
  nix.settings.allowed-users = [ "tomoyo" ];
  imports = [
    <home-manager/nixos>
    ./hardware-configuration.nix
    ./boot.nix
    ./desktop.nix
    ./users.nix
  ];
  users = {
    users.tomoyo = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "networkmanager"
        "audio"
        "video"
        "lp"
        "plugdev"
        "bluetooth"
        "seat"
        "systemd-logind"
        "adm"
        "kvm"
        "libvirt"
      ];
    };
  };
  networking.networkmanager.enable = true;
  environment.systemPackages = with pkgs; [
    neofetch
    curl
    wget
    git
    rsync
    rclone
    home-manager

    nil
    vivaldi
    bitwarden-desktop
    telegram-desktop
    mozcdic-ut-skk-jisyo
    mozcdic-ut-sudachidict
    mozcdic-ut-personal-names
    v2rayn
    goldendict-ng
    aichat
    strawberry
    anki-bin
    mpv
    syncthingtray
    koreader
    calibre
    kazumi
  ];
  time.timeZone = "Asia/Hong_Kong";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocales = [ "zh_CN.UTF-8/UTF-8" ];
  };
  system.stateVersion = "25.05";
}
