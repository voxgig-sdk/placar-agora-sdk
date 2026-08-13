-- Typed models for the PlacarAgora SDK (LuaLS annotations).
--
-- GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
-- params (op.<name>.points[].args.params[]). Field/param types come from the
-- canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
-- @voxgig/apidef VALID_CANON). Annotations only — no runtime effect. Do not
-- edit by hand.

---@class Schedule
---@field awayTeam? table
---@field competition? string
---@field homeTeam? table
---@field matchId? string
---@field scheduledTime? string
---@field sport? string
---@field status? string
---@field venue? string

---@class ScheduleListMatch
---@field awayTeam? table
---@field competition? string
---@field homeTeam? table
---@field matchId? string
---@field scheduledTime? string
---@field sport? string
---@field status? string
---@field venue? string

---@class Score
---@field awayTeam? table
---@field competition? string
---@field homeTeam? table
---@field matchDate? string
---@field matchId? string
---@field minute? string
---@field sport? string
---@field startTime? string
---@field status? string

---@class ScoreListMatch
---@field awayTeam? table
---@field competition? string
---@field homeTeam? table
---@field matchDate? string
---@field matchId? string
---@field minute? string
---@field sport? string
---@field startTime? string
---@field status? string

local M = {}

return M
