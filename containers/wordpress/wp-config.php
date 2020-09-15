<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'db_wordpress' );

/** MySQL database username */
define( 'DB_USER', 'db_user' );

/** MySQL database password */
define( 'DB_PASSWORD', 'db_password' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'VWsJ4riWXqPs5ipZ=2>Km~5.raTB2`Jl5ZX!URiL|@Q$;%QlvBFQYb]$6+;j#}HA');
define('SECURE_AUTH_KEY',  ':bR`-A-E [s$BIk&RDSX/p{_:3*{g;Sd}_<3d4_||6LxN+j,,vI@=RI <AFyW?^B');
define('LOGGED_IN_KEY',    '7c;h7wSDqg@N>(8mh;7k[f,-&0@3SIGf=0hUDhjK?s|#^:nAt~Lh}1&i/l&;GKyp');
define('NONCE_KEY',        'Gz2B^~|c$-vz<kv!u0O$IM8[wLjj3jer%zaDc$iU?Mf,f.0b4PXkm`20C5TH)/QK');
define('AUTH_SALT',        ',nS]q#M(pBA!GThP{Z)N)Y{TG#xsu{$bX6ZeQHZ2~ X[!xTFVnQO5hU?oRSeZPo!');
define('SECURE_AUTH_SALT', 'Z+n+.jX!J?%e1|.EMlvToqfE$T&+~}Y/Z3vR$5L&zy+Q)-TBWlpv]}6Jg+h!9Ub(');
define('LOGGED_IN_SALT',   'i#`U!%1SUJO:9$sDtx5kNnVoZ%-fpBG5,E@+@71a]wk9mg,uia|v44UmS5%g@3U(');
define('NONCE_SALT',       'pzeT{ws%<t|C^s-T:!4YF6CEq}`4o+MeVp{ibK{jQ!0t5=][=_E>RMZi;Iu9qk>W');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
