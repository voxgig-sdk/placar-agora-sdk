# PlacarAgora SDK feature factory

from placaragora_sdk.feature.base_feature import PlacarAgoraBaseFeature
from placaragora_sdk.feature.ratelimit_feature import PlacarAgoraRatelimitFeature
from placaragora_sdk.feature.retry_feature import PlacarAgoraRetryFeature
from placaragora_sdk.feature.test_feature import PlacarAgoraTestFeature
from placaragora_sdk.feature.timeout_feature import PlacarAgoraTimeoutFeature


_FEATURES = {
    "base": lambda: PlacarAgoraBaseFeature(),
    "ratelimit": lambda: PlacarAgoraRatelimitFeature(),
    "retry": lambda: PlacarAgoraRetryFeature(),
    "test": lambda: PlacarAgoraTestFeature(),
    "timeout": lambda: PlacarAgoraTimeoutFeature(),
}


def _make_feature(name):
    factory = _FEATURES.get(name)
    if factory is not None:
        return factory()
    return _FEATURES["base"]()


# True when this SDK was generated with the named feature class - the
# constructor's tolerance for extend-carried features reads this (an
# active name with no generated class must not become a BaseFeature
# stray when an extend instance carries it).
def _has_feature(name):
    return name in _FEATURES
