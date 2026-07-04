<?php
declare(strict_types=1);

// Typed models for the PlacarAgora SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
//
// These are documentation-grade value objects (PHP 8 typed properties),
// registered on the composer classmap autoload. The SDK boundary exchanges
// assoc-arrays; these classes name the shapes for tooling and typed callers.

/** Schedule entity data model. */
class Schedule
{
    public ?array $away_team = null;
    public ?string $competition = null;
    public ?array $home_team = null;
    public ?string $match_id = null;
    public ?string $scheduled_time = null;
    public ?string $sport = null;
    public ?string $status = null;
    public ?string $venue = null;
}

/** Match filter for Schedule#list (any subset of Schedule fields). */
class ScheduleListMatch
{
    public ?array $away_team = null;
    public ?string $competition = null;
    public ?array $home_team = null;
    public ?string $match_id = null;
    public ?string $scheduled_time = null;
    public ?string $sport = null;
    public ?string $status = null;
    public ?string $venue = null;
}

/** Score entity data model. */
class Score
{
    public ?array $away_team = null;
    public ?string $competition = null;
    public ?array $home_team = null;
    public ?string $match_date = null;
    public ?string $match_id = null;
    public ?string $minute = null;
    public ?string $sport = null;
    public ?string $start_time = null;
    public ?string $status = null;
}

/** Match filter for Score#list (any subset of Score fields). */
class ScoreListMatch
{
    public ?array $away_team = null;
    public ?string $competition = null;
    public ?array $home_team = null;
    public ?string $match_date = null;
    public ?string $match_id = null;
    public ?string $minute = null;
    public ?string $sport = null;
    public ?string $start_time = null;
    public ?string $status = null;
}

