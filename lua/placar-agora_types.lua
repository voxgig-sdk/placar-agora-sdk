-- Typed models for the PlacarAgora SDK (LuaLS annotations).
--
-- GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
-- params (op.<name>.points[].args.params[]). Field/param types come from the
-- canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
-- @voxgig/apidef VALID_CANON). Annotations only — no runtime effect. Do not
-- edit by hand.

---@class Schedule
---@field away_team? table
---@field competition? string
---@field home_team? table
---@field match_id? string
---@field scheduled_time? string
---@field sport? string
---@field status? string
---@field venue? string

---@class ScheduleListMatch
---@field away_team? table
---@field competition? string
---@field home_team? table
---@field match_id? string
---@field scheduled_time? string
---@field sport? string
---@field status? string
---@field venue? string

---@class Score
---@field away_team? table
---@field competition? string
---@field home_team? table
---@field match_date? string
---@field match_id? string
---@field minute? string
---@field sport? string
---@field start_time? string
---@field status? string

---@class ScoreListMatch
---@field away_team? table
---@field competition? string
---@field home_team? table
---@field match_date? string
---@field match_id? string
---@field minute? string
---@field sport? string
---@field start_time? string
---@field status? string

local M = {}

return M
