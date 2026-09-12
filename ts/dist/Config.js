"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.FEATURE_PLUGINS = exports.config = void 0;
const TestFeature_1 = require("./feature/test/TestFeature");
const FEATURE_CLASS = {
    test: TestFeature_1.TestFeature,
};
// Per-feature plugin DEFINITIONS (voxgig/plugin `Definition` values), from
// the model's active plugin groups. A feature that takes a `plugins` option
// (secrets over sekreto) reads its own entry; a feature with no plugins has
// none. Named imports above make each definition statically reachable, so
// an SDK carries exactly the plugin modules its model selects — the same
// leanness the old side-effect registry imports bought, without a registry.
const FEATURE_PLUGINS = {};
exports.FEATURE_PLUGINS = FEATURE_PLUGINS;
class Config {
    makeFeature(fn) {
        const fc = FEATURE_CLASS[fn];
        const fi = new fc();
        // TODO: errors etc
        return fi;
    }
    // False for a feature added at runtime via options.extend (station's
    // adopt path) - the constructor uses this to skip makeFeature for names
    // no generated class backs.
    hasFeature(fn) {
        return null != FEATURE_CLASS[fn];
    }
    main = {
        name: 'PlacarAgora',
        slug: "placar-agora",
        version: "0.0.1",
        target: "ts",
    };
    feature = {
        test: {
            "options": {
                "active": false
            },
            "transport": "base"
        },
    };
    options = {
        base: "https://golfeito.asamkt.com.br",
        headers: {
            "content-type": "application/json"
        },
        entity: {
            schedule: {},
            score: {},
        }
    };
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
                    "format": "date-time",
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
                            "segments": [
                                {
                                    "lit": "api"
                                },
                                {
                                    "lit": "upcoming-games"
                                }
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
                            },
                            "parts": [
                                "api",
                                "upcoming-games"
                            ]
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
                    "format": "date-time",
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
                    "format": "date-time",
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
                            "segments": [
                                {
                                    "lit": "api"
                                },
                                {
                                    "lit": "final-results"
                                }
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
                            },
                            "parts": [
                                "api",
                                "final-results"
                            ]
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
                            "segments": [
                                {
                                    "lit": "api"
                                },
                                {
                                    "lit": "live-scores"
                                }
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
                            },
                            "parts": [
                                "api",
                                "live-scores"
                            ]
                        }
                    ]
                }
            },
            "relations": {
                "ancestors": []
            }
        }
    };
}
const config = new Config();
exports.config = config;
//# sourceMappingURL=Config.js.map