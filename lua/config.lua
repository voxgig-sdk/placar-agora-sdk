-- ProjectName SDK configuration

local function make_config()
  return {
    main = {
      name = "PlacarAgora",
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
      auth = {
        prefix = "Bearer",
      },
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
            ["active"] = true,
            ["name"] = "away_team",
            ["req"] = false,
            ["type"] = "`$OBJECT`",
            ["index$"] = 0,
          },
          {
            ["active"] = true,
            ["name"] = "competition",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 1,
          },
          {
            ["active"] = true,
            ["name"] = "home_team",
            ["req"] = false,
            ["type"] = "`$OBJECT`",
            ["index$"] = 2,
          },
          {
            ["active"] = true,
            ["name"] = "match_id",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 3,
          },
          {
            ["active"] = true,
            ["name"] = "scheduled_time",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 4,
          },
          {
            ["active"] = true,
            ["name"] = "sport",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 5,
          },
          {
            ["active"] = true,
            ["name"] = "status",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 6,
          },
          {
            ["active"] = true,
            ["name"] = "venue",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 7,
          },
        },
        ["name"] = "schedule",
        ["op"] = {
          ["list"] = {
            ["input"] = "data",
            ["name"] = "list",
            ["points"] = {
              {
                ["active"] = true,
                ["args"] = {
                  ["query"] = {
                    {
                      ["active"] = true,
                      ["kind"] = "query",
                      ["name"] = "date",
                      ["orig"] = "date",
                      ["reqd"] = false,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["active"] = true,
                      ["kind"] = "query",
                      ["name"] = "sport",
                      ["orig"] = "sport",
                      ["reqd"] = false,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["active"] = true,
                      ["kind"] = "query",
                      ["name"] = "team",
                      ["orig"] = "team",
                      ["reqd"] = false,
                      ["type"] = "`$STRING`",
                    },
                  },
                },
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
                  ["res"] = "`body`",
                },
                ["index$"] = 0,
              },
            },
            ["key$"] = "list",
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
      ["score"] = {
        ["fields"] = {
          {
            ["active"] = true,
            ["name"] = "away_team",
            ["req"] = false,
            ["type"] = "`$OBJECT`",
            ["index$"] = 0,
          },
          {
            ["active"] = true,
            ["name"] = "competition",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 1,
          },
          {
            ["active"] = true,
            ["name"] = "home_team",
            ["req"] = false,
            ["type"] = "`$OBJECT`",
            ["index$"] = 2,
          },
          {
            ["active"] = true,
            ["name"] = "match_date",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 3,
          },
          {
            ["active"] = true,
            ["name"] = "match_id",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 4,
          },
          {
            ["active"] = true,
            ["name"] = "minute",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 5,
          },
          {
            ["active"] = true,
            ["name"] = "sport",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 6,
          },
          {
            ["active"] = true,
            ["name"] = "start_time",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 7,
          },
          {
            ["active"] = true,
            ["name"] = "status",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 8,
          },
        },
        ["name"] = "score",
        ["op"] = {
          ["list"] = {
            ["input"] = "data",
            ["name"] = "list",
            ["points"] = {
              {
                ["active"] = true,
                ["args"] = {
                  ["query"] = {
                    {
                      ["active"] = true,
                      ["kind"] = "query",
                      ["name"] = "date",
                      ["orig"] = "date",
                      ["reqd"] = false,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["active"] = true,
                      ["kind"] = "query",
                      ["name"] = "sport",
                      ["orig"] = "sport",
                      ["reqd"] = false,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["active"] = true,
                      ["kind"] = "query",
                      ["name"] = "team",
                      ["orig"] = "team",
                      ["reqd"] = false,
                      ["type"] = "`$STRING`",
                    },
                  },
                },
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
                  ["res"] = "`body`",
                },
                ["index$"] = 0,
              },
              {
                ["active"] = true,
                ["args"] = {
                  ["query"] = {
                    {
                      ["active"] = true,
                      ["kind"] = "query",
                      ["name"] = "sport",
                      ["orig"] = "sport",
                      ["reqd"] = false,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["active"] = true,
                      ["kind"] = "query",
                      ["name"] = "team",
                      ["orig"] = "team",
                      ["reqd"] = false,
                      ["type"] = "`$STRING`",
                    },
                  },
                },
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
                  ["res"] = "`body`",
                },
                ["index$"] = 1,
              },
            },
            ["key$"] = "list",
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
