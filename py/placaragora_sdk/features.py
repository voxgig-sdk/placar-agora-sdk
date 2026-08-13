# PlacarAgora SDK feature factory

from placaragora_sdk.feature.base_feature import PlacarAgoraBaseFeature
from placaragora_sdk.feature.test_feature import PlacarAgoraTestFeature


def _make_feature(name):
    features = {
        "base": lambda: PlacarAgoraBaseFeature(),
        "test": lambda: PlacarAgoraTestFeature(),
    }
    factory = features.get(name)
    if factory is not None:
        return factory()
    return features["base"]()
