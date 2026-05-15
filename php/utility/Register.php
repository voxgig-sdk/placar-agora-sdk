<?php
declare(strict_types=1);

// PlacarAgora SDK utility registration

require_once __DIR__ . '/../core/UtilityType.php';
require_once __DIR__ . '/Clean.php';
require_once __DIR__ . '/Done.php';
require_once __DIR__ . '/MakeError.php';
require_once __DIR__ . '/FeatureAdd.php';
require_once __DIR__ . '/FeatureHook.php';
require_once __DIR__ . '/FeatureInit.php';
require_once __DIR__ . '/Fetcher.php';
require_once __DIR__ . '/MakeFetchDef.php';
require_once __DIR__ . '/MakeContext.php';
require_once __DIR__ . '/MakeOptions.php';
require_once __DIR__ . '/MakeRequest.php';
require_once __DIR__ . '/MakeResponse.php';
require_once __DIR__ . '/MakeResult.php';
require_once __DIR__ . '/MakePoint.php';
require_once __DIR__ . '/MakeSpec.php';
require_once __DIR__ . '/MakeUrl.php';
require_once __DIR__ . '/Param.php';
require_once __DIR__ . '/PrepareAuth.php';
require_once __DIR__ . '/PrepareBody.php';
require_once __DIR__ . '/PrepareHeaders.php';
require_once __DIR__ . '/PrepareMethod.php';
require_once __DIR__ . '/PrepareParams.php';
require_once __DIR__ . '/PreparePath.php';
require_once __DIR__ . '/PrepareQuery.php';
require_once __DIR__ . '/ResultBasic.php';
require_once __DIR__ . '/ResultBody.php';
require_once __DIR__ . '/ResultHeaders.php';
require_once __DIR__ . '/TransformRequest.php';
require_once __DIR__ . '/TransformResponse.php';

PlacarAgoraUtility::setRegistrar(function (PlacarAgoraUtility $u): void {
    $u->clean = [PlacarAgoraClean::class, 'call'];
    $u->done = [PlacarAgoraDone::class, 'call'];
    $u->make_error = [PlacarAgoraMakeError::class, 'call'];
    $u->feature_add = [PlacarAgoraFeatureAdd::class, 'call'];
    $u->feature_hook = [PlacarAgoraFeatureHook::class, 'call'];
    $u->feature_init = [PlacarAgoraFeatureInit::class, 'call'];
    $u->fetcher = [PlacarAgoraFetcher::class, 'call'];
    $u->make_fetch_def = [PlacarAgoraMakeFetchDef::class, 'call'];
    $u->make_context = [PlacarAgoraMakeContext::class, 'call'];
    $u->make_options = [PlacarAgoraMakeOptions::class, 'call'];
    $u->make_request = [PlacarAgoraMakeRequest::class, 'call'];
    $u->make_response = [PlacarAgoraMakeResponse::class, 'call'];
    $u->make_result = [PlacarAgoraMakeResult::class, 'call'];
    $u->make_point = [PlacarAgoraMakePoint::class, 'call'];
    $u->make_spec = [PlacarAgoraMakeSpec::class, 'call'];
    $u->make_url = [PlacarAgoraMakeUrl::class, 'call'];
    $u->param = [PlacarAgoraParam::class, 'call'];
    $u->prepare_auth = [PlacarAgoraPrepareAuth::class, 'call'];
    $u->prepare_body = [PlacarAgoraPrepareBody::class, 'call'];
    $u->prepare_headers = [PlacarAgoraPrepareHeaders::class, 'call'];
    $u->prepare_method = [PlacarAgoraPrepareMethod::class, 'call'];
    $u->prepare_params = [PlacarAgoraPrepareParams::class, 'call'];
    $u->prepare_path = [PlacarAgoraPreparePath::class, 'call'];
    $u->prepare_query = [PlacarAgoraPrepareQuery::class, 'call'];
    $u->result_basic = [PlacarAgoraResultBasic::class, 'call'];
    $u->result_body = [PlacarAgoraResultBody::class, 'call'];
    $u->result_headers = [PlacarAgoraResultHeaders::class, 'call'];
    $u->transform_request = [PlacarAgoraTransformRequest::class, 'call'];
    $u->transform_response = [PlacarAgoraTransformResponse::class, 'call'];
});
