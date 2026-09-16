# PlacarAgora SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/ratelimit_feature'
require_relative 'feature/retry_feature'
require_relative 'feature/test_feature'
require_relative 'feature/timeout_feature'


module PlacarAgoraFeatures
  def self.make_feature(name)
    case name
    when "base"
      PlacarAgoraBaseFeature.new
    when "ratelimit"
      PlacarAgoraRatelimitFeature.new
    when "retry"
      PlacarAgoraRetryFeature.new
    when "test"
      PlacarAgoraTestFeature.new
    when "timeout"
      PlacarAgoraTimeoutFeature.new
    else
      PlacarAgoraBaseFeature.new
    end
  end
end
