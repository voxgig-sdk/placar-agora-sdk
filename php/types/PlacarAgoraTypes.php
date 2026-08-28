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
    public ?array $awayTeam = null;
    public ?string $competition = null;
    public ?array $homeTeam = null;
    public ?string $matchId = null;
    public ?string $scheduledTime = null;
    public ?string $sport = null;
    public ?string $status = null;
    public ?string $venue = null;
}

/** Request payload for Schedule#list. */
class ScheduleListMatch
{
    public ?string $date = null;
    public ?string $sport = null;
    public ?string $team = null;
}

/** Score entity data model. */
class Score
{
    public ?array $awayTeam = null;
    public ?string $competition = null;
    public ?array $homeTeam = null;
    public ?string $matchDate = null;
    public ?string $matchId = null;
    public ?string $minute = null;
    public ?string $sport = null;
    public ?string $startTime = null;
    public ?string $status = null;
}

/** Request payload for Score#list. */
class ScoreListMatch
{
    public ?string $date = null;
    public ?string $sport = null;
    public ?string $team = null;
}

