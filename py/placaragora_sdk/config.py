# PlacarAgora SDK configuration


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
        },
        "feature": {
            "test": {
        "options": {
          "active": False,
        },
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
            "type": "`$STRING`",
          },
          {
            "name": "homeTeam",
            "type": "`$OBJECT`",
          },
          {
            "name": "matchId",
            "type": "`$STRING`",
          },
          {
            "name": "scheduledTime",
            "type": "`$STRING`",
          },
          {
            "name": "sport",
            "type": "`$STRING`",
          },
          {
            "name": "status",
            "type": "`$STRING`",
          },
          {
            "name": "venue",
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
                "parts": [
                  "api",
                  "upcoming-games",
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
            "type": "`$STRING`",
          },
          {
            "name": "homeTeam",
            "type": "`$OBJECT`",
          },
          {
            "name": "matchDate",
            "type": "`$STRING`",
          },
          {
            "name": "matchId",
            "type": "`$STRING`",
          },
          {
            "name": "minute",
            "type": "`$STRING`",
          },
          {
            "name": "sport",
            "type": "`$STRING`",
          },
          {
            "name": "startTime",
            "type": "`$STRING`",
          },
          {
            "name": "status",
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
                "parts": [
                  "api",
                  "final-results",
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
                "parts": [
                  "api",
                  "live-scores",
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
