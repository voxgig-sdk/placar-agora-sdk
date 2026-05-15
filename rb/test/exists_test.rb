# PlacarAgora SDK exists test

require "minitest/autorun"
require_relative "../PlacarAgora_sdk"

class ExistsTest < Minitest::Test
  def test_create_test_sdk
    testsdk = PlacarAgoraSDK.test(nil, nil)
    assert !testsdk.nil?
  end
end
