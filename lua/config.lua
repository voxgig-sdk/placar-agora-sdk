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
      ["ratelimit"] = {
        ["options"] = {
          ["active"] = false,
          ["burst"] = 5,
          ["rate"] = 5,
        },
        ["optspec"] = {
          ["now"] = "`$FUNCTION`",
          ["sleep"] = "`$FUNCTION`",
        },
        ["strict"] = false,
        ["transport"] = "wrap",
      },
      ["retry"] = {
        ["options"] = {
          ["active"] = false,
          ["factor"] = 2,
          ["maxDelay"] = 2000,
          ["minDelay"] = 50,
          ["retries"] = 2,
          ["statuses"] = {
            408,
            425,
            429,
            500,
            502,
            503,
            504,
          },
        },
        ["optspec"] = {
          ["jitter"] = "`$BOOLEAN`",
          ["sleep"] = "`$FUNCTION`",
        },
        ["strict"] = false,
        ["transport"] = "wrap",
      },
      ["test"] = {
        ["options"] = {
          ["active"] = false,
        },
        ["optspec"] = {
          ["entity"] = "`$MAP`",
          ["net"] = "`$MAP`",
        },
        ["strict"] = false,
        ["transport"] = "base",
      },
      ["timeout"] = {
        ["options"] = {
          ["active"] = false,
          ["ms"] = 30000,
        },
        ["optspec"] = {
          ["clearTimer"] = "`$FUNCTION`",
          ["setTimer"] = "`$FUNCTION`",
        },
        ["strict"] = false,
        ["transport"] = "wrap",
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
            ["format"] = "date-time",
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
                ["segments"] = {
                  {
                    ["lit"] = "api",
                  },
                  {
                    ["lit"] = "upcoming-games",
                  },
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
                ["parts"] = {
                  "api",
                  "upcoming-games",
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
            ["format"] = "date-time",
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
            ["format"] = "date-time",
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
                ["segments"] = {
                  {
                    ["lit"] = "api",
                  },
                  {
                    ["lit"] = "final-results",
                  },
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
                ["parts"] = {
                  "api",
                  "final-results",
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
                ["segments"] = {
                  {
                    ["lit"] = "api",
                  },
                  {
                    ["lit"] = "live-scores",
                  },
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
                ["parts"] = {
                  "api",
                  "live-scores",
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
