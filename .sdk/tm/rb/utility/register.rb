# PlacarAgora SDK utility registration
require_relative '../core/utility_type'
require_relative 'clean'
require_relative 'done'
require_relative 'make_error'
require_relative 'feature_add'
require_relative 'feature_hook'
require_relative 'feature_init'
require_relative 'fetcher'
require_relative 'make_fetch_def'
require_relative 'make_context'
require_relative 'make_options'
require_relative 'make_request'
require_relative 'make_response'
require_relative 'make_result'
require_relative 'make_point'
require_relative 'make_spec'
require_relative 'make_url'
require_relative 'param'
require_relative 'prepare_auth'
require_relative 'prepare_body'
require_relative 'prepare_headers'
require_relative 'prepare_method'
require_relative 'prepare_params'
require_relative 'prepare_path'
require_relative 'prepare_query'
require_relative 'result_basic'
require_relative 'result_body'
require_relative 'result_headers'
require_relative 'transform_request'
require_relative 'transform_response'

PlacarAgoraUtility.registrar = ->(u) {
  u.clean = PlacarAgoraUtilities::Clean
  u.done = PlacarAgoraUtilities::Done
  u.make_error = PlacarAgoraUtilities::MakeError
  u.feature_add = PlacarAgoraUtilities::FeatureAdd
  u.feature_hook = PlacarAgoraUtilities::FeatureHook
  u.feature_init = PlacarAgoraUtilities::FeatureInit
  u.fetcher = PlacarAgoraUtilities::Fetcher
  u.make_fetch_def = PlacarAgoraUtilities::MakeFetchDef
  u.make_context = PlacarAgoraUtilities::MakeContext
  u.make_options = PlacarAgoraUtilities::MakeOptions
  u.make_request = PlacarAgoraUtilities::MakeRequest
  u.make_response = PlacarAgoraUtilities::MakeResponse
  u.make_result = PlacarAgoraUtilities::MakeResult
  u.make_point = PlacarAgoraUtilities::MakePoint
  u.make_spec = PlacarAgoraUtilities::MakeSpec
  u.make_url = PlacarAgoraUtilities::MakeUrl
  u.param = PlacarAgoraUtilities::Param
  u.prepare_auth = PlacarAgoraUtilities::PrepareAuth
  u.prepare_body = PlacarAgoraUtilities::PrepareBody
  u.prepare_headers = PlacarAgoraUtilities::PrepareHeaders
  u.prepare_method = PlacarAgoraUtilities::PrepareMethod
  u.prepare_params = PlacarAgoraUtilities::PrepareParams
  u.prepare_path = PlacarAgoraUtilities::PreparePath
  u.prepare_query = PlacarAgoraUtilities::PrepareQuery
  u.result_basic = PlacarAgoraUtilities::ResultBasic
  u.result_body = PlacarAgoraUtilities::ResultBody
  u.result_headers = PlacarAgoraUtilities::ResultHeaders
  u.transform_request = PlacarAgoraUtilities::TransformRequest
  u.transform_response = PlacarAgoraUtilities::TransformResponse
}
