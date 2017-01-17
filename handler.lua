local BasePlugin = require "kong.plugins.base_plugin"
local CustomHandler = BasePlugin:extend()
local requests = require("requests")
local req_get_headers = ngx.req.get_headers
local responses = require "kong.tools.responses"

function CustomHandler:new()
  CustomHandler.super.new(self, "eh-authentication")
end

function CustomHandler:access(config)
  data = {
    secret_key = config.service_secret_key,
    token = req_get_headers()[config.jwt_key]
  }

  response = requests.post
  {
    url = config.service_url,
    data = data
  }

  if response.status_code == 200 then
    CustomHandler.super.access(self)
  else
    return responses.send_HTTP_UNAUTHORIZED()
  end
end

return CustomHandler
