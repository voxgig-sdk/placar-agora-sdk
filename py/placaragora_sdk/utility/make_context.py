# PlacarAgora SDK utility: make_context

from placaragora_sdk.core.context import PlacarAgoraContext


def make_context_util(ctxmap, basectx):
    return PlacarAgoraContext(ctxmap, basectx)
