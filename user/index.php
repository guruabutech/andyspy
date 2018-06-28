<?
include "../php/framework/Loader.php";
session_start();
Loader::$classes_paths = Loader::load("../php");
Loader::$classes_paths = array_merge(Loader::$classes_paths, Loader::load("views/"));
spl_autoload_register(Loader::autoLoaderFunctionDescription());
DatabaseAccessor::setServer("andyspycdlmain.mysql.db");
DatabaseAccessor::setDbname("andyspycdlmain");
DatabaseAccessor::setUsername("andyspycdlmain");
DatabaseAccessor::setPassword("Niloxps2502");
AndySpy::setPhpPath("php/");
AndySpy::setDefaultDateFormat("Y-m-d");
AndySpy::setDefaultDateTimeFormat("Y-m-d h:i:s");
AndySpy::setHttpRequestListenerIndex("request");
AndySpy::setPageIndex("page");
AndySpy::setBaseUrl("http://www.user.andyspy.com/");
AndySpy::setDefaultPageClassName(Signin::class);
AndySpy::setNotFoundPageClassName(Notfound::class);
AndySpy::setPagesPath("views/page");
AndySpy::setHttpRequestExecuterSetterFunction(function () {
    return Visitor::getLoggedUser();
});
Translator::setLanguagesPath("../php/languages/");
Translator::setSessionIndex("language");
AndySpy::display();