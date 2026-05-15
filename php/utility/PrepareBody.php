<?php
declare(strict_types=1);

// PlacarAgora SDK utility: prepare_body

class PlacarAgoraPrepareBody
{
    public static function call(PlacarAgoraContext $ctx): mixed
    {
        if ($ctx->op->input === 'data') {
            return ($ctx->utility->transform_request)($ctx);
        }
        return null;
    }
}
