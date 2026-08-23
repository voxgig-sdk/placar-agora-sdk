-- PlacarAgora SDK configuration

-- Build a fresh, fully materialised config table. Every call rebuilds the
-- whole structure, so prefer require("config_shared") unless you need a
-- private copy you intend to mutate.
local function make_config()
  return {
    main = {
      name = "PlacarAgora",
      slug = "placar-agora",
      version = "0.0.1",
      target = "lua",
    },
    feature = {
      ["test"] = {
        ["options"] = {
          ["active"] = false,
        },
      },
    },
    options = {
      base = "https://golfeito.asamkt.com.br",
      headers = {
        ["content-type"] = "application/json",
      },
      entity = {
        ["schedule"] = {},
        ["score"] = {},
      },
    },
    entity = {
      ["schedule"] = {
        ["fields"] = {
          {
            ["name"] = "awayTeam",
            ["type"] = "`$OBJECT`",
          },
          {
            ["name"] = "competition",
            ["short"] = "Name of the competition or league",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "homeTeam",
            ["type"] = "`$OBJECT`",
          },
          {
            ["name"] = "matchId",
            ["short"] = "Unique identifier for the match",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "scheduledTime",
            ["short"] = "Scheduled start time of the match",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "sport",
            ["short"] = "Type of sport",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "status",
            ["short"] = "Match status",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "venue",
            ["short"] = "Venue where the match will be played",
            ["type"] = "`$STRING`",
          },
        },
        ["name"] = "schedule",
        ["op"] = {
          ["list"] = {
            ["input"] = "data",
            ["name"] = "list",
            ["points"] = {
              {
                ["args"] = {
                  ["query"] = {
                    {
                      ["kind"] = "query",
                      ["name"] = "date",
                      ["orig"] = "date",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "sport",
                      ["orig"] = "sport",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "team",
                      ["orig"] = "team",
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/api/upcoming-games",
                ["parts"] = {
                  "api",
                  "upcoming-games",
                },
                ["select"] = {
                  ["exist"] = {
                    "date",
                    "sport",
                    "team",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.matches`",
                },
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
      ["score"] = {
        ["fields"] = {
          {
            ["name"] = "awayTeam",
            ["type"] = "`$OBJECT`",
          },
          {
            ["name"] = "competition",
            ["short"] = "Name of the competition or league",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "homeTeam",
            ["type"] = "`$OBJECT`",
          },
          {
            ["name"] = "matchDate",
            ["short"] = "Date and time when the match took place",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "matchId",
            ["short"] = "Unique identifier for the match",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "minute",
            ["short"] = "Current minute of the match",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "sport",
            ["short"] = "Type of sport",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "startTime",
            ["short"] = "Match start time",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "status",
            ["short"] = "Match status",
            ["type"] = "`$STRING`",
          },
        },
        ["name"] = "score",
        ["op"] = {
          ["list"] = {
            ["input"] = "data",
            ["name"] = "list",
            ["points"] = {
              {
                ["args"] = {
                  ["query"] = {
                    {
                      ["kind"] = "query",
                      ["name"] = "date",
                      ["orig"] = "date",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "sport",
                      ["orig"] = "sport",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "team",
                      ["orig"] = "team",
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/api/final-results",
                ["parts"] = {
                  "api",
                  "final-results",
                },
                ["select"] = {
                  ["exist"] = {
                    "date",
                    "sport",
                    "team",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.matches`",
                },
              },
              {
                ["args"] = {
                  ["query"] = {
                    {
                      ["kind"] = "query",
                      ["name"] = "sport",
                      ["orig"] = "sport",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "team",
                      ["orig"] = "team",
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/api/live-scores",
                ["parts"] = {
                  "api",
                  "live-scores",
                },
                ["select"] = {
                  ["exist"] = {
                    "sport",
                    "team",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.matches`",
                },
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
    },
  }
end


local function make_feature(name)
  local features = require("features")
  local factory = features[name]
  if factory ~= nil then
    return factory()
  end
  return features.base()
end


-- Attach make_feature to the SDK class
local function setup_sdk(SDK)
  SDK._make_feature = make_feature
end


return make_config
