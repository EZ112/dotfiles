{ ... }:
{
  programs.bash.shellAliases = {
    ll = "ls -la";
    sw-boot = "sudo /run/current-system/bin/switch-to-configuration boot";
    nrs = "sudo nixos-rebuild switch --flake $HOME/dotfiles#$(hostname)";
    ncg = "sudo nix-collect-garbage -d && nix-collect-garbage -d";
    smt = "sudo systemd-manager-tui";
    llm-sync = "ollama create qwen-$(hostname) -f $HOME/dotfiles/ai/llm/$(hostname)/Modelfile";
  };
}
