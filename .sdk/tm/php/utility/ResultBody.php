<?php
declare(strict_types=1);

// PlacarAgora SDK utility: result_body

class PlacarAgoraResultBody
{
    public static function call(PlacarAgoraContext $ctx): ?PlacarAgoraResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result && $response && $response->json_func && $response->body) {
            $result->body = ($response->json_func)();
        }
        return $result;
    }
}
