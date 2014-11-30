<?php
// Configuration
require_once('config.php');

// Startup
require_once(DIR_SYSTEM . 'startup.php');

// Load the application classes
require_once(DIR_SYSTEM . 'library/currency.php');
require_once(DIR_SYSTEM . 'library/user.php');

// Page Time
$time = (time() + microtime());

// Loader
$loader = new Loader();
Registry::set('load', $loader);

// Config
$config = new Config();
Registry::set('config', $config);

// Database
$db = new DB(DB_DRIVER, DB_HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
Registry::set('db', $db);

// Settings
$query = $db->query("SELECT * FROM " . DB_PREFIX . "setting");
 
foreach ($query->rows as $setting) {
	$config->set($setting['key'], $setting['value']);
}

// Request
$request = new Request();
Registry::set('request', $request);

// Response
$response = new Response();
$response->addHeader('Content-Type', 'text/html; charset=UTF-8');
Registry::set('response', $response);

// Session
Registry::set('session', new Session());

// Cache
Registry::set('cache', new Cache());

// Url
Registry::set('url', new Url());

// Language
$language = new Language($config->get('config_admin_language'));
Registry::set('language', $language);

// Document
Registry::set('document', new Document());

// Currency
Registry::set('currency', new Currency());

// User
Registry::set('user', new User());

// Front Controller
$controller = new Front();

// Login
$controller->addPreAction(new Router('common/login/check'));

// Permission
$controller->addPreAction(new Router('common/permission/check'));

// Router
if (isset($request->get['route'])) {
	$action = new Router($request->get['route']);
} else {
	$action = new Router('common/home');
}

// Dispatch
$controller->dispatch($action, new Router('error/not_found'));

// Output
$response->output();

// Parse Time
if ($config->get('config_parse_time')) {
	echo sprintf($language->get('text_time'), round((time() + microtime()) - $time, 4));
}
?>