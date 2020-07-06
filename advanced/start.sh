#!/bin/bash

#!/bin/bash

API_COOKIE_KEY=`tr -dc 'a-zA-Z0-9_-' < /dev/urandom | head -c32`

cat > api/config/params-local.php << EOF
<?php
return [
];
EOF

cat > api/config/main-local.php << EOF
<?php
\$config = [
    'components' => [
        'request' => [
            'cookieValidationKey' => '${API_COOKIE_KEY}',
        ],
    ],
];
return \$config;
EOF

cat > common/config/main-local.php << EOF
<?php
return [
    'components' => [
        'db' => [
            'class' => 'yii\db\Connection',
            'dsn' => 'mysql:host=${MYSQL_HOST};dbname=${MYSQL_DATABASE}',
            'username' => '${MYSQL_USERNAME}',
            'password' => '${MYSQL_PASSWORD}',
            'charset' => 'utf8',
        ],
        'mailer' => [
            'class' => 'yii\swiftmailer\Mailer',
            'viewPath' => '@common/mail',
            'useFileTransport' => false,
            'transport' => [
                'class' => 'Swift_SmtpTransport',
                'host' => 'smtp.mandrillapp.com',
                'username' => '${MANDRILL_USERNAME}',
                'password' => '${MANDRILL_PASSWORD}',
                'port' => '2525',
                'encryption' => 'tls',
            ],
        ],
        'urlManager' => [
            'class' => 'yii\web\UrlManager',
            'showScriptName' => false,
            'enablePrettyUrl' => true,
            'rules' => [
            ],
            'hostInfo' => '${BASE_URL}'
        ]
    ],
];
EOF

php yii migrate --interactive=0

#set apache port
sed -s -i -e "s/80/${APACHE_PORT}/" /etc/apache2/ports.conf /etc/apache2/sites-available/*.conf

apachectl -D FOREGROUND