<?php
declare(strict_types=1);

// PlacarAgora SDK utility: feature_add

class PlacarAgoraFeatureAdd
{
    public static function call(PlacarAgoraContext $ctx, mixed $f): void
    {
        $ctx->client->features[] = $f;
    }
}
