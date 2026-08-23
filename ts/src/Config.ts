
import { BaseFeature } from './feature/base/BaseFeature'
import { TestFeature } from './feature/test/TestFeature'



const FEATURE_CLASS: Record<string, typeof BaseFeature> = {
   test: TestFeature,

}


class Config {

  makeFeature(this: any, fn: string) {
    const fc = FEATURE_CLASS[fn]
    const fi = new fc()
    // TODO: errors etc
    return fi
  }

  // False for a feature added at runtime via options.extend (station's
  // adopt path) - the constructor uses this to skip makeFeature for names
  // no generated class backs.
  hasFeature(this: any, fn: string) {
    return null != FEATURE_CLASS[fn]
  }


  main = {
    name: 'PlacarAgora',
        slug: "placar-agora",
    version: "0.0.1",
    target: "ts",

  }


  feature = {
     test:     {
      "options": {
        "active": false
      }
    },

  }


  options = {
    base: "https://golfeito.asamkt.com.br",

    headers: {
      "content-type": "application/json"
    },

    entity: {
      
      schedule: {
      },

      score: {
      },

    }
  }


  entity = {
    "schedule": {
      "fields": [
        {
          "name": "awayTeam",
          "type": "`$OBJECT`"
        },
        {
          "name": "competition",
          "short": "Name of the competition or league",
          "type": "`$STRING`"
        },
        {
          "name": "homeTeam",
          "type": "`$OBJECT`"
        },
        {
          "name": "matchId",
          "short": "Unique identifier for the match",
          "type": "`$STRING`"
        },
        {
          "name": "scheduledTime",
          "short": "Scheduled start time of the match",
          "type": "`$STRING`"
        },
        {
          "name": "sport",
          "short": "Type of sport",
          "type": "`$STRING`"
        },
        {
          "name": "status",
          "short": "Match status",
          "type": "`$STRING`"
        },
        {
          "name": "venue",
          "short": "Venue where the match will be played",
          "type": "`$STRING`"
        }
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
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "sport",
                    "orig": "sport",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "team",
                    "orig": "team",
                    "type": "`$STRING`"
                  }
                ]
              },
              "kind": "http",
              "method": "GET",
              "orig": "/api/upcoming-games",
              "parts": [
                "api",
                "upcoming-games"
              ],
              "select": {
                "exist": [
                  "date",
                  "sport",
                  "team"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body.matches`"
              }
            }
          ]
        }
      },
      "relations": {
        "ancestors": []
      }
    },
    "score": {
      "fields": [
        {
          "name": "awayTeam",
          "type": "`$OBJECT`"
        },
        {
          "name": "competition",
          "short": "Name of the competition or league",
          "type": "`$STRING`"
        },
        {
          "name": "homeTeam",
          "type": "`$OBJECT`"
        },
        {
          "name": "matchDate",
          "short": "Date and time when the match took place",
          "type": "`$STRING`"
        },
        {
          "name": "matchId",
          "short": "Unique identifier for the match",
          "type": "`$STRING`"
        },
        {
          "name": "minute",
          "short": "Current minute of the match",
          "type": "`$STRING`"
        },
        {
          "name": "sport",
          "short": "Type of sport",
          "type": "`$STRING`"
        },
        {
          "name": "startTime",
          "short": "Match start time",
          "type": "`$STRING`"
        },
        {
          "name": "status",
          "short": "Match status",
          "type": "`$STRING`"
        }
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
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "sport",
                    "orig": "sport",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "team",
                    "orig": "team",
                    "type": "`$STRING`"
                  }
                ]
              },
              "kind": "http",
              "method": "GET",
              "orig": "/api/final-results",
              "parts": [
                "api",
                "final-results"
              ],
              "select": {
                "exist": [
                  "date",
                  "sport",
                  "team"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body.matches`"
              }
            },
            {
              "args": {
                "query": [
                  {
                    "kind": "query",
                    "name": "sport",
                    "orig": "sport",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "team",
                    "orig": "team",
                    "type": "`$STRING`"
                  }
                ]
              },
              "kind": "http",
              "method": "GET",
              "orig": "/api/live-scores",
              "parts": [
                "api",
                "live-scores"
              ],
              "select": {
                "exist": [
                  "sport",
                  "team"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body.matches`"
              }
            }
          ]
        }
      },
      "relations": {
        "ancestors": []
      }
    }
  }
}


const config = new Config()

export {
  config
}

