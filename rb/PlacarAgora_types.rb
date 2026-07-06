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
# @!attribute [rw] away_team
#   @return [Hash, nil]
#
# @!attribute [rw] competition
#   @return [String, nil]
#
# @!attribute [rw] home_team
#   @return [Hash, nil]
#
# @!attribute [rw] match_id
#   @return [String, nil]
#
# @!attribute [rw] scheduled_time
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
  :away_team,
  :competition,
  :home_team,
  :match_id,
  :scheduled_time,
  :sport,
  :status,
  :venue,
  keyword_init: true
)

# Request payload for Schedule#list.
#
# @!attribute [rw] away_team
#   @return [Hash, nil]
#
# @!attribute [rw] competition
#   @return [String, nil]
#
# @!attribute [rw] home_team
#   @return [Hash, nil]
#
# @!attribute [rw] match_id
#   @return [String, nil]
#
# @!attribute [rw] scheduled_time
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
  :away_team,
  :competition,
  :home_team,
  :match_id,
  :scheduled_time,
  :sport,
  :status,
  :venue,
  keyword_init: true
)

# Score entity data model.
#
# @!attribute [rw] away_team
#   @return [Hash, nil]
#
# @!attribute [rw] competition
#   @return [String, nil]
#
# @!attribute [rw] home_team
#   @return [Hash, nil]
#
# @!attribute [rw] match_date
#   @return [String, nil]
#
# @!attribute [rw] match_id
#   @return [String, nil]
#
# @!attribute [rw] minute
#   @return [String, nil]
#
# @!attribute [rw] sport
#   @return [String, nil]
#
# @!attribute [rw] start_time
#   @return [String, nil]
#
# @!attribute [rw] status
#   @return [String, nil]
Score = Struct.new(
  :away_team,
  :competition,
  :home_team,
  :match_date,
  :match_id,
  :minute,
  :sport,
  :start_time,
  :status,
  keyword_init: true
)

# Request payload for Score#list.
#
# @!attribute [rw] away_team
#   @return [Hash, nil]
#
# @!attribute [rw] competition
#   @return [String, nil]
#
# @!attribute [rw] home_team
#   @return [Hash, nil]
#
# @!attribute [rw] match_date
#   @return [String, nil]
#
# @!attribute [rw] match_id
#   @return [String, nil]
#
# @!attribute [rw] minute
#   @return [String, nil]
#
# @!attribute [rw] sport
#   @return [String, nil]
#
# @!attribute [rw] start_time
#   @return [String, nil]
#
# @!attribute [rw] status
#   @return [String, nil]
ScoreListMatch = Struct.new(
  :away_team,
  :competition,
  :home_team,
  :match_date,
  :match_id,
  :minute,
  :sport,
  :start_time,
  :status,
  keyword_init: true
)

