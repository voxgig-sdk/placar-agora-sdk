<?php
declare(strict_types=1);

// PlacarAgora SDK utility: result_headers

class PlacarAgoraResultHeaders
{
    public static function call(PlacarAgoraContext $ctx): ?PlacarAgoraResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result) {
            if ($response && is_array($response->headers)) {
                $result->headers = $response->headers;
            } else {
                $result->headers = [];
            }
        }
        return $result;
    }
}
