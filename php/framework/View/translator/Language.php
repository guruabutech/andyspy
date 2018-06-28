<?php

/**
 * Created by PhpStorm.
 * User: Nk-concept
 * Date: 23/07/2017
 * Time: 13:09
 */
class Language
{
    private $name, $flag, $strings;

    /**
     * Language constructor.
     * @param $name
     * @param $flag
     * @param $strings
     */
    public function __construct($name, $flag, $strings)
    {
        $this->name = $name;
        $this->flag = $flag;
        $this->strings = new Row($strings);
    }

    /**
     * @return mixed
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * @param mixed $name
     */
    public function setName($name)
    {
        $this->name = $name;
    }

    /**
     * @return mixed
     */
    public function getFlag()
    {
        return $this->flag;
    }

    /**
     * @param mixed $flag
     */
    public function setFlag($flag)
    {
        $this->flag = $flag;
    }

    /**
     * @return Row
     */
    public function getStrings()
    {
        return $this->strings;
    }

    /**
     * @param mixed $strings
     */
    public function setStrings($strings)
    {
        $this->strings = $strings;
    }

    public function getString($index)
    {
        if (!$this->strings->indexExists($index)) return "{{$index}}";
        else return $this->strings->getColumn($index)->getValue();
    }

}