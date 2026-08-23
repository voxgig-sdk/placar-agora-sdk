# PlacarAgora SDK configuration

module PlacarAgoraConfig
  # Return the process-wide config, built once on first use. The SDK reads
  # the config on every request and never writes to it, so one instance is
  # shared by every client rather than rebuilt per client.
  #
  # The returned hash is shared: treat it as read-only. Callers that need to
  # mutate should use make_config, which always returns a fresh copy.
  def self.shared_config
    @shared_config ||= make_config
  end


  # Build a fresh, fully materialised config hash. Every call rebuilds the
  # whole structure, so prefer shared_config unless you need a private copy
  # you intend to mutate.
  def self.make_config
    {
      "main" => {
        "name" => "PlacarAgora",
        "slug" => "placar-agora",
        "version" => "0.0.1",
        "target" => "rb",
      },
      "feature" => {
        "test" => {
          "options" => {
            "active" => false,
          },
        },
      },
      "options" => {
        "base" => "https://golfeito.asamkt.com.br",
        "headers" => {
          "content-type" => "application/json",
        },
        "entity" => {
          "schedule" => {},
          "score" => {},
        },
      },
      "entity" => {
        "schedule" => {
          "fields" => [
            {
              "name" => "awayTeam",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "competition",
              "short" => "Name of the competition or league",
              "type" => "`$STRING`",
            },
            {
              "name" => "homeTeam",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "matchId",
              "short" => "Unique identifier for the match",
              "type" => "`$STRING`",
            },
            {
              "name" => "scheduledTime",
              "short" => "Scheduled start time of the match",
              "type" => "`$STRING`",
            },
            {
              "name" => "sport",
              "short" => "Type of sport",
              "type" => "`$STRING`",
            },
            {
              "name" => "status",
              "short" => "Match status",
              "type" => "`$STRING`",
            },
            {
              "name" => "venue",
              "short" => "Venue where the match will be played",
              "type" => "`$STRING`",
            },
          ],
          "name" => "schedule",
          "op" => {
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "args" => {
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "date",
                        "orig" => "date",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "sport",
                        "orig" => "sport",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "team",
                        "orig" => "team",
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/upcoming-games",
                  "parts" => [
                    "api",
                    "upcoming-games",
                  ],
                  "select" => {
                    "exist" => [
                      "date",
                      "sport",
                      "team",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.matches`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "score" => {
          "fields" => [
            {
              "name" => "awayTeam",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "competition",
              "short" => "Name of the competition or league",
              "type" => "`$STRING`",
            },
            {
              "name" => "homeTeam",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "matchDate",
              "short" => "Date and time when the match took place",
              "type" => "`$STRING`",
            },
            {
              "name" => "matchId",
              "short" => "Unique identifier for the match",
              "type" => "`$STRING`",
            },
            {
              "name" => "minute",
              "short" => "Current minute of the match",
              "type" => "`$STRING`",
            },
            {
              "name" => "sport",
              "short" => "Type of sport",
              "type" => "`$STRING`",
            },
            {
              "name" => "startTime",
              "short" => "Match start time",
              "type" => "`$STRING`",
            },
            {
              "name" => "status",
              "short" => "Match status",
              "type" => "`$STRING`",
            },
          ],
          "name" => "score",
          "op" => {
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "args" => {
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "date",
                        "orig" => "date",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "sport",
                        "orig" => "sport",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "team",
                        "orig" => "team",
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/final-results",
                  "parts" => [
                    "api",
                    "final-results",
                  ],
                  "select" => {
                    "exist" => [
                      "date",
                      "sport",
                      "team",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.matches`",
                  },
                },
                {
                  "args" => {
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "sport",
                        "orig" => "sport",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "team",
                        "orig" => "team",
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/live-scores",
                  "parts" => [
                    "api",
                    "live-scores",
                  ],
                  "select" => {
                    "exist" => [
                      "sport",
                      "team",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.matches`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
      },
    }
  end


  def self.make_feature(name)
    require_relative 'features'
    PlacarAgoraFeatures.make_feature(name)
  end
end
