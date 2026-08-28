// Typed models for the PlacarAgora SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.

export interface Schedule {
  awayTeam?: Record<string, any>
  competition?: string
  homeTeam?: Record<string, any>
  matchId?: string
  scheduledTime?: string
  sport?: string
  status?: string
  venue?: string
}

export interface ScheduleListMatch {
  date?: string
  sport?: string
  team?: string
}

export interface Score {
  awayTeam?: Record<string, any>
  competition?: string
  homeTeam?: Record<string, any>
  matchDate?: string
  matchId?: string
  minute?: string
  sport?: string
  startTime?: string
  status?: string
}

export interface ScoreListMatch {
  date?: string
  sport?: string
  team?: string
}

