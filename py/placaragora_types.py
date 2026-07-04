# Typed models for the PlacarAgora SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Field/param types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Do not edit by hand.

from __future__ import annotations

from dataclasses import dataclass
from typing import Optional, Any


@dataclass
class Schedule:
    away_team: Optional[dict] = None
    competition: Optional[str] = None
    home_team: Optional[dict] = None
    match_id: Optional[str] = None
    scheduled_time: Optional[str] = None
    sport: Optional[str] = None
    status: Optional[str] = None
    venue: Optional[str] = None


@dataclass
class ScheduleListMatch:
    away_team: Optional[dict] = None
    competition: Optional[str] = None
    home_team: Optional[dict] = None
    match_id: Optional[str] = None
    scheduled_time: Optional[str] = None
    sport: Optional[str] = None
    status: Optional[str] = None
    venue: Optional[str] = None


@dataclass
class Score:
    away_team: Optional[dict] = None
    competition: Optional[str] = None
    home_team: Optional[dict] = None
    match_date: Optional[str] = None
    match_id: Optional[str] = None
    minute: Optional[str] = None
    sport: Optional[str] = None
    start_time: Optional[str] = None
    status: Optional[str] = None


@dataclass
class ScoreListMatch:
    away_team: Optional[dict] = None
    competition: Optional[str] = None
    home_team: Optional[dict] = None
    match_date: Optional[str] = None
    match_id: Optional[str] = None
    minute: Optional[str] = None
    sport: Optional[str] = None
    start_time: Optional[str] = None
    status: Optional[str] = None

