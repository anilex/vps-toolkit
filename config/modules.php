<?php

return [
    'enabled' => [
        'Automysqlbackup' => \App\Modules\Software\Automysqlbackup::class,
        'BaseTools' => \App\Modules\Software\BaseTools::class,
        'Certbot' => \App\Modules\Software\Certbot::class,
        'MariaDB' => \App\Modules\Software\MariaDB::class,
        'Nginx' => \App\Modules\Software\Nginx::class,
        'NodeJS' => \App\Modules\Software\Nodejs::class,
        'PHP' => \App\Modules\Software\PHP::class,
        'PostgreSQL' => \App\Modules\Software\PostgreSQL::class,
        'Transmission' => \App\Modules\Software\Transmission::class,
    ],
];