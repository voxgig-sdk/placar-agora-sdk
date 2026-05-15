# PlacarAgora SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/test_feature'


module PlacarAgoraFeatures
  def self.make_feature(name)
    case name
    when "base"
      PlacarAgoraBaseFeature.new
    when "test"
      PlacarAgoraTestFeature.new
    else
      PlacarAgoraBaseFeature.new
    end
  end
end
