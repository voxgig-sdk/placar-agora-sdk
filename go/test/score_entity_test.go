package sdktest

import (
	"encoding/json"
	"os"
	"path/filepath"
	"runtime"
	"strings"
	"testing"
	"time"

	sdk "github.com/voxgig-sdk/placar-agora-sdk/go"
	"github.com/voxgig-sdk/placar-agora-sdk/go/core"

	vs "github.com/voxgig-sdk/placar-agora-sdk/go/utility/struct"
)

func TestScoreEntity(t *testing.T) {
	t.Run("instance", func(t *testing.T) {
		testsdk := sdk.TestSDK(nil, nil)
		ent := testsdk.Score(nil)
		if ent == nil {
			t.Fatal("expected non-nil ScoreEntity")
		}
	})

	t.Run("basic", func(t *testing.T) {
		setup := scoreBasicSetup(nil)
		// Per-op sdk-test-control.json skip — basic test exercises a flow
		// with multiple ops; skipping any op skips the whole flow.
		_mode := "unit"
		if setup.live {
			_mode = "live"
		}
		for _, _op := range []string{"list"} {
			if _shouldSkip, _reason := isControlSkipped("entityOp", "score." + _op, _mode); _shouldSkip {
				if _reason == "" {
					_reason = "skipped via sdk-test-control.json"
				}
				t.Skip(_reason)
				return
			}
		}
		// The basic flow consumes synthetic IDs from the fixture. In live mode
		// without an *_ENTID env override, those IDs hit the live API and 4xx.
		if setup.syntheticOnly {
			t.Skip("live entity test uses synthetic IDs from fixture — set PLACARAGORA_TEST_SCORE_ENTID JSON to run live")
			return
		}
		client := setup.client

		// Bootstrap entity data from existing test data (no create step in flow).
		scoreRef01DataRaw := vs.Items(core.ToMapAny(vs.GetPath("existing.score", setup.data)))
		var scoreRef01Data map[string]any
		if len(scoreRef01DataRaw) > 0 {
			scoreRef01Data = core.ToMapAny(scoreRef01DataRaw[0][1])
		}
		// Discard guards against Go's unused-var check when the flow's steps
		// happen not to consume the bootstrap data (e.g. list-only flows).
		_ = scoreRef01Data

		// LIST
		scoreRef01Ent := client.Score(nil)
		scoreRef01Match := map[string]any{}

		scoreRef01ListResult, err := scoreRef01Ent.List(scoreRef01Match, nil)
		if err != nil {
			t.Fatalf("list failed: %v", err)
		}
		_, scoreRef01ListOk := scoreRef01ListResult.([]any)
		if !scoreRef01ListOk {
			t.Fatalf("expected list result to be an array, got %T", scoreRef01ListResult)
		}

	})
}

func scoreBasicSetup(extra map[string]any) *entityTestSetup {
	loadEnvLocal()

	_, filename, _, _ := runtime.Caller(0)
	dir := filepath.Dir(filename)

	entityDataFile := filepath.Join(dir, "..", "..", ".sdk", "test", "entity", "score", "ScoreTestData.json")

	entityDataSource, err := os.ReadFile(entityDataFile)
	if err != nil {
		panic("failed to read score test data: " + err.Error())
	}

	var entityData map[string]any
	if err := json.Unmarshal(entityDataSource, &entityData); err != nil {
		panic("failed to parse score test data: " + err.Error())
	}

	options := map[string]any{}
	options["entity"] = entityData["existing"]

	client := sdk.TestSDK(options, extra)

	// Generate idmap via transform, matching TS pattern.
	idmap := vs.Transform(
		[]any{"score01", "score02", "score03"},
		map[string]any{
			"`$PACK`": []any{"", map[string]any{
				"`$KEY`": "`$COPY`",
				"`$VAL`": []any{"`$FORMAT`", "upper", "`$COPY`"},
			}},
		},
	)

	// Detect ENTID env override before envOverride consumes it. When live
	// mode is on without a real override, the basic test runs against synthetic
	// IDs from the fixture and 4xx's. Surface this so the test can skip.
	entidEnvRaw := os.Getenv("PLACARAGORA_TEST_SCORE_ENTID")
	idmapOverridden := entidEnvRaw != "" && strings.HasPrefix(strings.TrimSpace(entidEnvRaw), "{")

	env := envOverride(map[string]any{
		"PLACARAGORA_TEST_SCORE_ENTID": idmap,
		"PLACARAGORA_TEST_LIVE":      "FALSE",
		"PLACARAGORA_TEST_EXPLAIN":   "FALSE",
		"PLACARAGORA_APIKEY":         "NONE",
	})

	idmapResolved := core.ToMapAny(env["PLACARAGORA_TEST_SCORE_ENTID"])
	if idmapResolved == nil {
		idmapResolved = core.ToMapAny(idmap)
	}

	if env["PLACARAGORA_TEST_LIVE"] == "TRUE" {
		mergedOpts := vs.Merge([]any{
			map[string]any{
				"apikey": env["PLACARAGORA_APIKEY"],
			},
			extra,
		})
		client = sdk.NewPlacarAgoraSDK(core.ToMapAny(mergedOpts))
	}

	live := env["PLACARAGORA_TEST_LIVE"] == "TRUE"
	return &entityTestSetup{
		client:        client,
		data:          entityData,
		idmap:         idmapResolved,
		env:           env,
		explain:       env["PLACARAGORA_TEST_EXPLAIN"] == "TRUE",
		live:          live,
		syntheticOnly: live && !idmapOverridden,
		now:           time.Now().UnixMilli(),
	}
}
