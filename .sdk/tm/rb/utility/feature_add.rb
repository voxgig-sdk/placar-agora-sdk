# PlacarAgora SDK utility: feature_add
module PlacarAgoraUtilities
  FeatureAdd = ->(ctx, f) {
    ctx.client.features << f
  }
end
