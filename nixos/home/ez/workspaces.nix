{
  config,
  inputs,
  lib,
  osConfig,
  ...
}:
let
  hostname = osConfig.networking.hostName;
  baseConfig = builtins.readFile (inputs.self + /hypr/workspaces.conf);
  hostConfig =
    if hostname == "leyndell" then
      builtins.readFile (inputs.self + /hypr/leyndell/workspaces.conf)
    else
      builtins.readFile (inputs.self + /hypr/nokron/workspaces.conf);
in
{
  xdg.configFile."hypr/workspaces.conf".text = hostConfig + "\n" + baseConfig;
}
