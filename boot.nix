{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}:
{
  fileSystems = {
    "/boot" = {
      device = "/dev/disk/by-uuid/17CC-17B0";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    };
    "/" = {
      device = "/dev/mapper/nixroot";
      fsType = "btrfs";
      options = [
        "compress=zstd"
        "noatime"
      ];
    };
  };
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    initrd = {
      availableKernelModules = [
        "xhci_pci"
        "thunderbolt"
        "nvme"
        "uas"
        "uhci_hcd"
        "ehci_hcd"
        "ehci_pci"
        "ohci_hcd"
        "ohci_pci"
        "xhci_hcd"
        "xhci_pci"
        "usbhid"
        "hid_generic"
        "hid_lenovo"
        "hid_apple"
        "hid_roccat"
        "hid_logitech_hidpp"
        "hid_logitech_dj"
        "hid_microsoft"
        "hid_cherry"
        "hid_corsair"
      ];
      luks.devices.nixroot.device = "/dev/disk/by-uuid/4007340f-3928-4caf-9302-3e039c0cde2f";
    };
    loader = {
      systemd-boot = {
        enable = true;
      };
      efi.canTouchEfiVariables = true;
    };
    kernelModules = [ "kvm-intel" ];
  };
}
