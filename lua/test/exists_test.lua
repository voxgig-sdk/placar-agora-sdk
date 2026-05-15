-- ProjectName SDK exists test

local sdk = require("placar-agora_sdk")

describe("PlacarAgoraSDK", function()
  it("should create test SDK", function()
    local testsdk = sdk.test(nil, nil)
    assert.is_not_nil(testsdk)
  end)
end)
