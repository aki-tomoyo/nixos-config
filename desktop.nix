{ config , lib , pkgs , ...}:
{
i18n.inputMethod.fcitx5={
  waylandFrontend = true;
  plasma6Support = true;
  addons = with pkgs; [fcitx5-rime fcitx5-mozc-ut ];
};
services = {
  displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
    };
  };
  desktopManager.plasma6.enable = true;
};
}
