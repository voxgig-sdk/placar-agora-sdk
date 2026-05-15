package voxgigplacaragorasdk

import (
	"github.com/voxgig-sdk/placar-agora-sdk/core"
	"github.com/voxgig-sdk/placar-agora-sdk/entity"
	"github.com/voxgig-sdk/placar-agora-sdk/feature"
	_ "github.com/voxgig-sdk/placar-agora-sdk/utility"
)

// Type aliases preserve external API.
type PlacarAgoraSDK = core.PlacarAgoraSDK
type Context = core.Context
type Utility = core.Utility
type Feature = core.Feature
type Entity = core.Entity
type PlacarAgoraEntity = core.PlacarAgoraEntity
type FetcherFunc = core.FetcherFunc
type Spec = core.Spec
type Result = core.Result
type Response = core.Response
type Operation = core.Operation
type Control = core.Control
type PlacarAgoraError = core.PlacarAgoraError

// BaseFeature from feature package.
type BaseFeature = feature.BaseFeature

func init() {
	core.NewBaseFeatureFunc = func() core.Feature {
		return feature.NewBaseFeature()
	}
	core.NewTestFeatureFunc = func() core.Feature {
		return feature.NewTestFeature()
	}
	core.NewScheduleEntityFunc = func(client *core.PlacarAgoraSDK, entopts map[string]any) core.PlacarAgoraEntity {
		return entity.NewScheduleEntity(client, entopts)
	}
	core.NewScoreEntityFunc = func(client *core.PlacarAgoraSDK, entopts map[string]any) core.PlacarAgoraEntity {
		return entity.NewScoreEntity(client, entopts)
	}
}

// Constructor re-exports.
var NewPlacarAgoraSDK = core.NewPlacarAgoraSDK
var TestSDK = core.TestSDK
var NewContext = core.NewContext
var NewSpec = core.NewSpec
var NewResult = core.NewResult
var NewResponse = core.NewResponse
var NewOperation = core.NewOperation
var MakeConfig = core.MakeConfig
var NewBaseFeature = feature.NewBaseFeature
var NewTestFeature = feature.NewTestFeature
