<?php
declare(strict_types=1);

// PlacarAgora SDK utility: make_context

require_once __DIR__ . '/../core/Context.php';

class PlacarAgoraMakeContext
{
    public static function call(array $ctxmap, ?PlacarAgoraContext $basectx): PlacarAgoraContext
    {
        return new PlacarAgoraContext($ctxmap, $basectx);
    }
}
