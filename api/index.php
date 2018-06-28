<?
include "../php/framework/Loader.php";
session_start();
Loader::$classes_paths = Loader::load("../php");
spl_autoload_register(Loader::autoLoaderFunctionDescription());
DatabaseAccessor::setServer("andyspycdlmain.mysql.db");
DatabaseAccessor::setDbname("andyspycdlmain");
DatabaseAccessor::setUsername("andyspycdlmain");
DatabaseAccessor::setPassword("Niloxps2502");
AndySpy::setPhpPath("php/");
AndySpy::setDefaultDateFormat("Y-m-d");
AndySpy::setDefaultDateTimeFormat("Y-m-d h:i:s");
AndySpy::setHttpRequestListenerIndex("request");
Translator::setLanguagesPath("../php/languages/");
AndySpy::setHttpRequestExecuterSetterFunction(function () {
    return new Api();
});
AndySpy::display(false);
die((new Response(array("status" => false, "request" => $_REQUEST["request"])))->toJson());