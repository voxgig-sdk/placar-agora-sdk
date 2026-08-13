# frozen_string_literal: true

# Typed models for the PlacarAgora SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Member types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Ruby types are unenforced; these YARD
# annotations document the shapes. Do not edit by hand.

# Schedule entity data model.
#
# @!attribute [rw] awayTeam
#   @return [Hash, nil]
#
# @!attribute [rw] competition
#   @return [String, nil]
#
# @!attribute [rw] homeTeam
#   @return [Hash, nil]
#
# @!attribute [rw] matchId
#   @return [String, nil]
#
# @!attribute [rw] scheduledTime
#   @return [String, nil]
#
# @!attribute [rw] sport
#   @return [String, nil]
#
# @!attribute [rw] status
#   @return [String, nil]
#
# @!attribute [rw] venue
#   @return [String, nil]
Schedule = Struct.new(
  :awayTeam,
  :competition,
  :homeTeam,
  :matchId,
  :scheduledTime,
  :sport,
  :status,
  :venue,
  keyword_init: true
)

# Request payload for Schedule#list.
#
# @!attribute [rw] awayTeam
#   @return [Hash, nil]
#
# @!attribute [rw] competition
#   @return [String, nil]
#
# @!attribute [rw] homeTeam
#   @return [Hash, nil]
#
# @!attribute [rw] matchId
#   @return [String, nil]
#
# @!attribute [rw] scheduledTime
#   @return [String, nil]
#
# @!attribute [rw] sport
#   @return [String, nil]
#
# @!attribute [rw] status
#   @return [String, nil]
#
# @!attribute [rw] venue
#   @return [String, nil]
ScheduleListMatch = Struct.new(
  :awayTeam,
  :competition,
  :homeTeam,
  :matchId,
  :scheduledTime,
  :sport,
  :status,
  :venue,
  keyword_init: true
)

# Score entity data model.
#
# @!attribute [rw] awayTeam
#   @return [Hash, nil]
#
# @!attribute [rw] competition
#   @return [String, nil]
#
# @!attribute [rw] homeTeam
#   @return [Hash, nil]
#
# @!attribute [rw] matchDate
#   @return [String, nil]
#
# @!attribute [rw] matchId
#   @return [String, nil]
#
# @!attribute [rw] minute
#   @return [String, nil]
#
# @!attribute [rw] sport
#   @return [String, nil]
#
# @!attribute [rw] startTime
#   @return [String, nil]
#
# @!attribute [rw] status
#   @return [String, nil]
Score = Struct.new(
  :awayTeam,
  :competition,
  :homeTeam,
  :matchDate,
  :matchId,
  :minute,
  :sport,
  :startTime,
  :status,
  keyword_init: true
)

# Request payload for Score#list.
#
# @!attribute [rw] awayTeam
#   @return [Hash, nil]
#
# @!attribute [rw] competition
#   @return [String, nil]
#
# @!attribute [rw] homeTeam
#   @return [Hash, nil]
#
# @!attribute [rw] matchDate
#   @return [String, nil]
#
# @!attribute [rw] matchId
#   @return [String, nil]
#
# @!attribute [rw] minute
#   @return [String, nil]
#
# @!attribute [rw] sport
#   @return [String, nil]
#
# @!attribute [rw] startTime
#   @return [String, nil]
#
# @!attribute [rw] status
#   @return [String, nil]
ScoreListMatch = Struct.new(
  :awayTeam,
  :competition,
  :homeTeam,
  :matchDate,
  :matchId,
  :minute,
  :sport,
  :startTime,
  :status,
  keyword_init: true
)

