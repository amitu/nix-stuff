{ lib, ... }: {
  # This file was populated at runtime with the networking
  # details gathered from the active system.
  networking = {
    nameservers = [ "8.8.8.8" ];
    defaultGateway = "167.71.224.1";
    defaultGateway6 = "";
    dhcpcd.enable = false;
    usePredictableInterfaceNames = lib.mkForce true;
    interfaces = {
      eth0 = {
        ipv4.addresses = [
          { address="167.71.230.93"; prefixLength=20; }
          { address="10.47.0.5"; prefixLength=16; }
        ];
        ipv6.addresses = [
          { address="fe80::f4bd:29ff:fe71:dac5"; prefixLength=64; }
        ];
      };
      
    };
  };
  services.udev.extraRules = ''
    ATTR{address}=="f6:bd:29:71:da:c5", NAME="eth0"
  '';
}
