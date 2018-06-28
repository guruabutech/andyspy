<?php

/**
 * Created by Nkconcept.
 * Date: 17/06/2017
 * Time: 20:50
 */
class HttpRequestPost
{
    /**
     * @param $index
     * @return Column
     */
    public static function get( $index )
    {
        return new Column( $index,$_POST[ $index ] );
    }
    /**
     * @param $index
     * @param $value
     */
    public static function set($index, $value )
    {
        $_POST[ $index ]=$value;
    }

    public static function getAll()
    {
        return new Row($_POST);
    }
}