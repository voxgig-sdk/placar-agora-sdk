# PlacarAgora SDK utility: make_context

from core.context import PlacarAgoraContext


def make_context_util(ctxmap, basectx):
    return PlacarAgoraContext(ctxmap, basectx)
