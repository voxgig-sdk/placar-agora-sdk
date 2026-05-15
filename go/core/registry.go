package core

var UtilityRegistrar func(u *Utility)

var NewBaseFeatureFunc func() Feature

var NewTestFeatureFunc func() Feature

var NewScheduleEntityFunc func(client *PlacarAgoraSDK, entopts map[string]any) PlacarAgoraEntity

var NewScoreEntityFunc func(client *PlacarAgoraSDK, entopts map[string]any) PlacarAgoraEntity

