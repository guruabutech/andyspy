<?php

/**
 * Created by PhpStorm.
 * User: Nk-concept
 * Date: 23/07/2017
 * Time: 12:22
 */
abstract class Translator
{
    private static $languages_path, $session_index;

    /**
     * @return mixed
     */
    public static function getLanguagesPath()
    {
        return self::$languages_path;
    }

    /**
     * @param mixed $languages_path
     */
    public static function setLanguagesPath($languages_path)
    {
        self::$languages_path = $languages_path;
    }

    /**
     * @return mixed
     */
    public static function getSessionIndex()
    {
        return self::$session_index;
    }

    /**
     * @param mixed $session_index
     */
    public static function setSessionIndex($session_index)
    {
        self::$session_index = $session_index;
    }

    public static function getLanguages()
    {
        $LanguageList = new Table();
        $files = glob(Translator::getLanguagesPath() . "*.json", GLOB_BRACE);
        foreach ($files as $file) {
            $json = file_get_contents($file);
            $array = json_decode($json, true);
            if (isset($array["name"], $array["flag"], $array["strings"]) && is_array($array["strings"])) {
                $LanguageList->addRow(
                    new Row(
                        array(
                            new Language($array["name"], $array["flag"], $array["strings"])
                        ),
                        $array["flag"]
                    )
                );
            }
        }
        if (!$LanguageList->length()) throw new Exception("No language found");
        return $LanguageList;
    }

    /**
     * @return Language
     */
    public static function getCurrentLanguage()
    {
        $LanguageList = Translator::getLanguages();
        if (Session::has(Translator::getSessionIndex())) {
            $flag = Session::get(Translator::getSessionIndex());
            if ($LanguageList->indexExists($flag)) return $LanguageList->getRow($flag)->first()->getValue();
        } else return $LanguageList->first()->first()->getValue();
    }

    public static function getString($index)
    {
        return Translator::getCurrentLanguage()->getString($index);
    }
}