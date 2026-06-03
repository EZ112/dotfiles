{
  config,
  inputs,
  lib,
  osConfig,
  ...
}:
let
  hostname = osConfig.networking.hostName;
  baseConfig = builtins.readFile (inputs.self + /hypr/workspaces.lua);
  hostConfig =
    if hostname == "leyndell" then
      builtins.readFile (inputs.self + /hypr/leyndell/workspaces.lua)
    else
      builtins.readFile (inputs.self + /hypr/nokron/workspaces.lua);
in
{
  xdg.configFile."hypr/workspaces.lua".text = hostConfig + "\n" + baseConfig;
}
