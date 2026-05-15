-- PlacarAgora SDK error

local PlacarAgoraError = {}
PlacarAgoraError.__index = PlacarAgoraError


function PlacarAgoraError.new(code, msg, ctx)
  local self = setmetatable({}, PlacarAgoraError)
  self.is_sdk_error = true
  self.sdk = "PlacarAgora"
  self.code = code or ""
  self.msg = msg or ""
  self.ctx = ctx
  self.result = nil
  self.spec = nil
  return self
end


function PlacarAgoraError:error()
  return self.msg
end


function PlacarAgoraError:__tostring()
  return self.msg
end


return PlacarAgoraError
