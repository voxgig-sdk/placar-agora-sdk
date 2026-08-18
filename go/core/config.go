package core

import (
	"sync"
)

// MakeConfig builds a fresh, fully materialised config map. Every call
// rebuilds the whole structure, so prefer SharedConfig unless you need a
// private copy you intend to mutate.
func MakeConfig() map[string]any {
	return map[string]any{
		"main": map[string]any{
			"name": "PlacarAgora",
		},
		"feature": map[string]any{
			"test": map[string]any{
				"options": map[string]any{
					"active": false,
				},
			},
		},
		"options": map[string]any{
			"base": "https://golfeito.asamkt.com.br",
			"headers": map[string]any{
				"content-type": "application/json",
			},
			"entity": map[string]any{
				"schedule": map[string]any{},
				"score": map[string]any{},
			},
		},
		"entity": map[string]any{
			"schedule": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "awayTeam",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "competition",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "homeTeam",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "matchId",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "scheduledTime",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "sport",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "status",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "venue",
						"type": "`$STRING`",
					},
				},
				"name": "schedule",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "date",
											"orig": "date",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "sport",
											"orig": "sport",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "team",
											"orig": "team",
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/upcoming-games",
								"parts": []any{
									"api",
									"upcoming-games",
								},
								"select": map[string]any{
									"exist": []any{
										"date",
										"sport",
										"team",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.matches`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"score": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "awayTeam",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "competition",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "homeTeam",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "matchDate",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "matchId",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "minute",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "sport",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "startTime",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "status",
						"type": "`$STRING`",
					},
				},
				"name": "score",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "date",
											"orig": "date",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "sport",
											"orig": "sport",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "team",
											"orig": "team",
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/final-results",
								"parts": []any{
									"api",
									"final-results",
								},
								"select": map[string]any{
									"exist": []any{
										"date",
										"sport",
										"team",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.matches`",
								},
							},
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "sport",
											"orig": "sport",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "team",
											"orig": "team",
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/live-scores",
								"parts": []any{
									"api",
									"live-scores",
								},
								"select": map[string]any{
									"exist": []any{
										"sport",
										"team",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.matches`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
		},
	}
}

var (
	sharedConfigOnce sync.Once
	sharedConfigVal  map[string]any
)

// SharedConfig returns the process-wide config, built once on first use.
// The SDK reads the config on every request and never writes to it, so one
// instance is shared by every client rather than rebuilt per client.
//
// The returned map is shared: treat it as read-only. Callers that need to
// mutate should use MakeConfig, which always returns a fresh copy.
func SharedConfig() map[string]any {
	sharedConfigOnce.Do(func() {
		sharedConfigVal = MakeConfig()
	})
	return sharedConfigVal
}

func makeFeature(name string) Feature {
	switch name {
	case "test":
		if NewTestFeatureFunc != nil {
			return NewTestFeatureFunc()
		}
	default:
		if NewBaseFeatureFunc != nil {
			return NewBaseFeatureFunc()
		}
	}
	return nil
}
