<?php
define( 'WP_CACHE_KEY_SALT' , getenv('DOMAIN_NAME') );
define( 'DB_NAME', getenv('MYSQL_DATABASE'));
define( 'DB_USER', getenv('MYSQL_USER'));
define( 'DB_PASSWORD',getenv('MYSQL_USER_PASSWORD'));
define( 'DB_HOST', getenv('MYSQL_HOST'));
define('DB_CHARSET', 'utf8');
define( 'DB_COLLATE', '' );
define('AUTH_KEY','coloque-aqui-uma-chave-aleatoria');
define('SECURE_AUTH_KEY','coloque-aqui-uma-chave-aleatoria');
define('LOGGED_IN_KEY','coloque-aqui-uma-chave-aleatoria');
define('NONCE_KEY', 'coloque-aqui-uma-chave-aleatoria');
define('AUTH_SALT', 'coloque-aqui-uma-chave-aleatoria');
define('SECURE_AUTH_SALT', 'coloque-aqui-uma-chave-aleatoria');
define('LOGGED_IN_SALT','coloque-aqui-uma-chave-aleatoria');
define('NONCE_SALT', 'coloque-aqui-uma-chave-aleatoria');
$table_prefix = 'wp_';
define('WP_DEBUG', false);
if ( !defined('ABSPATH') )
    define('ABSPATH', dirname(__FILE__) . '/');
require_once(ABSPATH . 'wp-settings.php');
?>
