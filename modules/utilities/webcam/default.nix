{ config, pkgs, ... }:

let
  startWebcam = pkgs.writeShellScriptBin "cam" /*bash*/ ''
    systemctl restart webcam
    # debug
    # echo "hello" &> /home/matt/test.txt
  '';
in
{
  boot = {
    extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback.out ];
    kernelModules = [ "v4l2loopback" ];
    extraModprobeConfig = ''
      options v4l2loopback exclusive_caps=1 card_label="Virtual Camera
    '';
  };

  environment = {
    systemPackages = with pkgs; [
      ffmpeg
      gphoto2
      mpv
    ];
  };

  services.udev.extraRules = ''
    ACTION=="add",  \
    SUBSYSTEM=="usb", \
    ATTR{idVendor}=="04a9", \
    ATTR{idProduct}=="317b",  \
    RUN+="${startWebcam}/bin/start-webcam"
  '';

  systemd.services.webcam = {
    enable = true;
    script = /*bash*/''
      ${pkgs.gphoto2}/bin/gphoto2 --stdout --capture-movie | \
      ${pkgs.ffmpeg}/bin/ffmpeg -i - -vcodec rawvideo -pix_fmt yuv420 v4l2 /dev/video0
    '';
  };
}
