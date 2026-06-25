{ pkgs, hostName, ... }:
let
  commonVariables = {
    NIXPKGS_ALLOW_UNFREE = 1;
    EDITOR = "nvim";

    # lua
    HYPRLAND_DIR = "${pkgs.hyprland}/share/hypr";
    VIMRUNTIME = "${pkgs.neovim-unwrapped}/share/nvim/runtime";

    # ollama
    OLLAMA_FLASH_ATTENTION = 1;
    OLLAMA_KV_CACHE_TYPE = "q8_0";
  };

  hosts = {
    leyndell = {
      # gpu
      LIBVA_DRIVER_NAME = "nvidia";
      GBM_BACKEND = "nvidia-drm";
      NVD_BACKEND = "direct";
      QSG_RENDER_LOOP = "basic";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      __GL_MaxFramesAllowed = "1";

      # qt
      QML_IMPORT_PATH = "${pkgs.qt6.qtmultimedia}/lib/qt-6/qml";
      QT_FFMPEG_DECODING_HW_DEVICE_TYPES = "cuda,vdpau,vaapi";
      QT_FFMPEG_HW_ALLOW_PROFILE_MISMATCH = "1";
    };
    nokron = { };
  };
in
commonVariables // (hosts.${hostName} or { })
