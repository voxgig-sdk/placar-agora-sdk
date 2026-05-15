package = "voxgig-sdk-placar-agora"
version = "0.0-1"
source = {
  url = "git://github.com/voxgig-sdk/placar-agora-sdk.git"
}
description = {
  summary = "PlacarAgora SDK for Lua",
  license = "MIT"
}
dependencies = {
  "lua >= 5.3",
  "dkjson >= 2.5",
  "dkjson >= 2.5",
}
build = {
  type = "builtin",
  modules = {
    ["placar-agora_sdk"] = "placar-agora_sdk.lua",
    ["config"] = "config.lua",
    ["features"] = "features.lua",
  }
}
