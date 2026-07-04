// Typed models for the PlacarAgora SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.

export interface Schedule {
  away_team?: Record<string, any>
  competition?: string
  home_team?: Record<string, any>
  match_id?: string
  scheduled_time?: string
  sport?: string
  status?: string
  venue?: string
}

export type ScheduleListMatch = Partial<Schedule>

export interface Score {
  away_team?: Record<string, any>
  competition?: string
  home_team?: Record<string, any>
  match_date?: string
  match_id?: string
  minute?: string
  sport?: string
  start_time?: string
  status?: string
}

export type ScoreListMatch = Partial<Score>

