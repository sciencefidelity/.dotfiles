{ ... }:

{
  networking = {
    firewall.allowedTCPPorts = [ 6443 ];
  };

  services = {
    etcd = {
      enable = true;
    };

    k3s = {
      enable = true;
      role = "server";
      extraFlags = [
        "--write-kubeconfig-mode 0644" # Makes kubectl readable without sudo
      ];
    };
  };
}
