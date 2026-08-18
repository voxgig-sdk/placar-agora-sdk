
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


  main = {
    name: 'PlacarAgora',
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
          "type": "`$STRING`"
        },
        {
          "name": "homeTeam",
          "type": "`$OBJECT`"
        },
        {
          "name": "matchId",
          "type": "`$STRING`"
        },
        {
          "name": "scheduledTime",
          "type": "`$STRING`"
        },
        {
          "name": "sport",
          "type": "`$STRING`"
        },
        {
          "name": "status",
          "type": "`$STRING`"
        },
        {
          "name": "venue",
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
          "type": "`$STRING`"
        },
        {
          "name": "homeTeam",
          "type": "`$OBJECT`"
        },
        {
          "name": "matchDate",
          "type": "`$STRING`"
        },
        {
          "name": "matchId",
          "type": "`$STRING`"
        },
        {
          "name": "minute",
          "type": "`$STRING`"
        },
        {
          "name": "sport",
          "type": "`$STRING`"
        },
        {
          "name": "startTime",
          "type": "`$STRING`"
        },
        {
          "name": "status",
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

