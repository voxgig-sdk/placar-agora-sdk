<?php
declare(strict_types=1);

// PlacarAgora SDK feature factory

require_once __DIR__ . '/feature/BaseFeature.php';
require_once __DIR__ . '/feature/TestFeature.php';


class PlacarAgoraFeatures
{
    public static function make_feature(string $name)
    {
        switch ($name) {
            case "base":
                return new PlacarAgoraBaseFeature();
            case "test":
                return new PlacarAgoraTestFeature();
            default:
                return new PlacarAgoraBaseFeature();
        }
    }
}
