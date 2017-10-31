<?php

namespace App\Modules\Software;

use App\Modules\Concerns\HasService;

class Nginx extends AbstractAptGetSoftware
{
    use HasService;

    protected $name = 'Nginx';
    protected $description = '';

    protected $repository = 'nginx/development';

    protected $packages = [
        'nginx',
    ];

    protected $executable = 'nginx';
    protected $service = 'nginx';

    protected $dependencies = [];

    public function getVersion(): string
    {
        return ''.`nginx -v`;
    }
}
