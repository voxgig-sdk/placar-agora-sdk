<?php
declare(strict_types=1);

// PlacarAgora SDK exists test

require_once __DIR__ . '/../placaragora_sdk.php';

use PHPUnit\Framework\TestCase;

class ExistsTest extends TestCase
{
    public function test_create_test_sdk(): void
    {
        $testsdk = PlacarAgoraSDK::test(null, null);
        $this->assertNotNull($testsdk);
    }
}
