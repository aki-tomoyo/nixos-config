{
  config,
  lib,
  pkgs,
  ...
}:
{
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    fira-code
    noto-fonts
  ];
  programs.xwayland.enable = true;
  i18n = {
    extraLocales = [ "zh_CN.UTF-8/UTF-8" ];
    inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5 = {
        waylandFrontend = true;
        plasma6Support = true;
        addons = with pkgs; [
          kdePackages.fcitx5-with-addons
          fcitx5-chinese-addons
          fcitx5-configtool
          fcitx5-rime
          fcitx5-mozc-ut
        ];
      };
    };
  };
  services = {
    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
      };
    };
    desktopManager.plasma6.enable = true;
    pipewire.enable = true;
  };
}
