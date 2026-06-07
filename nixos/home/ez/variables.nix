{ pkgs }:
{
  NIXPKGS_ALLOW_UNFREE = 1;
  EDITOR = "nvim";

  # lua
  HYPRLAND_DIR = "${pkgs.hyprland}/share/hypr";
  VIMRUNTIME = "${pkgs.neovim-unwrapped}/share/nvim/runtime";

  # gpu
  LIBVA_DRIVER_NAME = "nvidia";
  __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  GBM_BACKEND = "nvidia-drm";

  # ollama
  OLLAMA_FLASH_ATTENTION = 1;
  OLLAMA_KV_CACHE_TYPE = "q8_0";
}
