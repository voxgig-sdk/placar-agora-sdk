<?php
declare(strict_types=1);

// PlacarAgora SDK base feature

class PlacarAgoraBaseFeature
{
    public string $version;
    public string $name;
    public bool $active;

    public function __construct()
    {
        $this->version = '0.0.1';
        $this->name = 'base';
        $this->active = true;
    }

    public function get_version(): string { return $this->version; }
    public function get_name(): string { return $this->name; }
    public function get_active(): bool { return $this->active; }

    public function init(PlacarAgoraContext $ctx, array $options): void {}
    public function PostConstruct(PlacarAgoraContext $ctx): void {}
    public function PostConstructEntity(PlacarAgoraContext $ctx): void {}
    public function SetData(PlacarAgoraContext $ctx): void {}
    public function GetData(PlacarAgoraContext $ctx): void {}
    public function GetMatch(PlacarAgoraContext $ctx): void {}
    public function SetMatch(PlacarAgoraContext $ctx): void {}
    public function PrePoint(PlacarAgoraContext $ctx): void {}
    public function PreSpec(PlacarAgoraContext $ctx): void {}
    public function PreRequest(PlacarAgoraContext $ctx): void {}
    public function PreResponse(PlacarAgoraContext $ctx): void {}
    public function PreResult(PlacarAgoraContext $ctx): void {}
    public function PreDone(PlacarAgoraContext $ctx): void {}
    public function PreUnexpected(PlacarAgoraContext $ctx): void {}
}
