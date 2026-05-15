# PlacarAgora SDK feature factory

from feature.base_feature import PlacarAgoraBaseFeature
from feature.test_feature import PlacarAgoraTestFeature


def _make_feature(name):
    features = {
        "base": lambda: PlacarAgoraBaseFeature(),
        "test": lambda: PlacarAgoraTestFeature(),
    }
    factory = features.get(name)
    if factory is not None:
        return factory()
    return features["base"]()
