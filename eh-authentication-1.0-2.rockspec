package = "eh-authentication"
version = "1.0-2"
source = {
  url = 'http://employmenthero.com'
}
description = {
  summary = "Employment Hero Kong plugin for authentication",
  license = "MIT/X11"
}
dependencies = {
  "lua ~> 5.1",
  "luasocket ~> 2.0.2",
  "lua-requests ~> 1.1-1"
}
build = {
  type = "builtin",
  modules = {
    ["kong.plugins.eh-authentication.handler"] = "handler.lua",
    ["kong.plugins.eh-authentication.schema"] = "schema.lua"
  }
}
