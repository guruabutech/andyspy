<?php

/**
 * Created by PhpStorm.
 * User: Nk-concept
 * Date: 22/07/2017
 * Time: 01:10
 */
class Properties extends LoggedPageModel
{
    public function printTitle()
    {
        // TODO: Implement printTitle() method.
    }

    public function printContent()
    {
        PropertiesPanel::getHtml();
    }
}