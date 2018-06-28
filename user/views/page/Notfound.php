<?php

/**
 * Created by PhpStorm.
 * User: Nk-concept
 * Date: 22/07/2017
 * Time: 01:10
 */
class Notfound extends UnloggedPageModel
{
    public function printTitle()
    {
        echo Translator::getString("404");
    }

    public function printContent()
    {
        // TODO: Implement printContent() method.
    }

    public function display()
    {
        ?>
        <!DOCTYPE html>
        <html>
        <?
        static::printHead();
        static::printBody();
        ?>
        </html>
        <?
    }


}