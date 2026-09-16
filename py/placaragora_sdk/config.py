# PlacarAgora SDK configuration


# The sekreto plugin DEFINITIONS the model selected per feature, imported
# above by name from the modules the catalogue's active `plugin.def`
# entries declare. Handed to each feature (secrets builds its Sekreto
# with them): a provider kind not listed here is unknown to that SDK.
FEATURE_PLUGINS = {
}


_shared_config = None


def shared_config():
    """Return the process-wide config, built once on first use.

    The SDK reads the config on every request and never writes to it, so one
    instance is shared by every client rather than rebuilt per client.

    The returned dict is shared: treat it as read-only. Callers that need to
    mutate should use make_config, which always returns a fresh copy.
    """
    global _shared_config
    if _shared_config is None:
        _shared_config = make_config()
    return _shared_config


def make_config():
    """Build a fresh, fully materialised config dict.

    Every call rebuilds the whole structure, so prefer shared_config unless
    you need a private copy you intend to mutate.
    """
    return {
        "main": {
            "name": "PlacarAgora",
            "slug": "placar-agora",
            "version": "0.0.1",
            "target": "py",
        },
        "feature": {
            "ratelimit": {
        "options": {
          "active": False,
          "burst": 5,
          "rate": 5,
        },
        "optspec": {
          "now": "`$FUNCTION`",
          "sleep": "`$FUNCTION`",
        },
        "strict": False,
        "transport": "wrap",
      },
            "retry": {
        "options": {
          "active": False,
          "factor": 2,
          "maxDelay": 2000,
          "minDelay": 50,
          "retries": 2,
          "statuses": [
            408,
            425,
            429,
            500,
            502,
            503,
            504,
          ],
        },
        "optspec": {
          "jitter": "`$BOOLEAN`",
          "sleep": "`$FUNCTION`",
        },
        "strict": False,
        "transport": "wrap",
      },
            "test": {
        "options": {
          "active": False,
        },
        "optspec": {
          "entity": "`$MAP`",
          "net": "`$MAP`",
        },
        "strict": False,
        "transport": "base",
      },
            "timeout": {
        "options": {
          "active": False,
          "ms": 30000,
        },
        "optspec": {
          "clearTimer": "`$FUNCTION`",
          "setTimer": "`$FUNCTION`",
        },
        "strict": False,
        "transport": "wrap",
      },
        },
        "options": {
            "base": "https://golfeito.asamkt.com.br",
            "headers": {
        "content-type": "application/json",
      },
            "entity": {
                "schedule": {},
                "score": {},
            },
        },
        "entity": {
      "schedule": {
        "fields": [
          {
            "name": "awayTeam",
            "type": "`$OBJECT`",
          },
          {
            "name": "competition",
            "short": "Name of the competition or league",
            "type": "`$STRING`",
          },
          {
            "name": "homeTeam",
            "type": "`$OBJECT`",
          },
          {
            "name": "matchId",
            "short": "Unique identifier for the match",
            "type": "`$STRING`",
          },
          {
            "format": "date-time",
            "name": "scheduledTime",
            "short": "Scheduled start time of the match",
            "type": "`$STRING`",
          },
          {
            "name": "sport",
            "short": "Type of sport",
            "type": "`$STRING`",
          },
          {
            "name": "status",
            "short": "Match status",
            "type": "`$STRING`",
          },
          {
            "name": "venue",
            "short": "Venue where the match will be played",
            "type": "`$STRING`",
          },
        ],
        "name": "schedule",
        "op": {
          "list": {
            "input": "data",
            "name": "list",
            "points": [
              {
                "args": {
                  "query": [
                    {
                      "kind": "query",
                      "name": "date",
                      "orig": "date",
                      "type": "`$STRING`",
                    },
                    {
                      "kind": "query",
                      "name": "sport",
                      "orig": "sport",
                      "type": "`$STRING`",
                    },
                    {
                      "kind": "query",
                      "name": "team",
                      "orig": "team",
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "GET",
                "orig": "/api/upcoming-games",
                "segments": [
                  {
                    "lit": "api",
                  },
                  {
                    "lit": "upcoming-games",
                  },
                ],
                "select": {
                  "exist": [
                    "date",
                    "sport",
                    "team",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body.matches`",
                },
                "parts": [
                  "api",
                  "upcoming-games",
                ],
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "score": {
        "fields": [
          {
            "name": "awayTeam",
            "type": "`$OBJECT`",
          },
          {
            "name": "competition",
            "short": "Name of the competition or league",
            "type": "`$STRING`",
          },
          {
            "name": "homeTeam",
            "type": "`$OBJECT`",
          },
          {
            "format": "date-time",
            "name": "matchDate",
            "short": "Date and time when the match took place",
            "type": "`$STRING`",
          },
          {
            "name": "matchId",
            "short": "Unique identifier for the match",
            "type": "`$STRING`",
          },
          {
            "name": "minute",
            "short": "Current minute of the match",
            "type": "`$STRING`",
          },
          {
            "name": "sport",
            "short": "Type of sport",
            "type": "`$STRING`",
          },
          {
            "format": "date-time",
            "name": "startTime",
            "short": "Match start time",
            "type": "`$STRING`",
          },
          {
            "name": "status",
            "short": "Match status",
            "type": "`$STRING`",
          },
        ],
        "name": "score",
        "op": {
          "list": {
            "input": "data",
            "name": "list",
            "points": [
              {
                "args": {
                  "query": [
                    {
                      "kind": "query",
                      "name": "date",
                      "orig": "date",
                      "type": "`$STRING`",
                    },
                    {
                      "kind": "query",
                      "name": "sport",
                      "orig": "sport",
                      "type": "`$STRING`",
                    },
                    {
                      "kind": "query",
                      "name": "team",
                      "orig": "team",
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "GET",
                "orig": "/api/final-results",
                "segments": [
                  {
                    "lit": "api",
                  },
                  {
                    "lit": "final-results",
                  },
                ],
                "select": {
                  "exist": [
                    "date",
                    "sport",
                    "team",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body.matches`",
                },
                "parts": [
                  "api",
                  "final-results",
                ],
              },
              {
                "args": {
                  "query": [
                    {
                      "kind": "query",
                      "name": "sport",
                      "orig": "sport",
                      "type": "`$STRING`",
                    },
                    {
                      "kind": "query",
                      "name": "team",
                      "orig": "team",
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "GET",
                "orig": "/api/live-scores",
                "segments": [
                  {
                    "lit": "api",
                  },
                  {
                    "lit": "live-scores",
                  },
                ],
                "select": {
                  "exist": [
                    "sport",
                    "team",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body.matches`",
                },
                "parts": [
                  "api",
                  "live-scores",
                ],
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
    },
    }
