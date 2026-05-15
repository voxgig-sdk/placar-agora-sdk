# PlacarAgora SDK utility: make_context
require_relative '../core/context'
module PlacarAgoraUtilities
  MakeContext = ->(ctxmap, basectx) {
    PlacarAgoraContext.new(ctxmap, basectx)
  }
end
