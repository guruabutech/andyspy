<?php

/**
 * Created by PhpStorm.
 * User: Nk-concept
 * Date: 22/07/2017
 * Time: 01:09
 */
abstract class LoggedPageModel extends UnloggedPageModel
{
    public function printBody()
    {
        ?>
        <body class="with-side-menu theme-picton-blue-white-ebony">
        <? SiteHeader::getContent(); ?>

        <div class="mobile-menu-left-overlay"></div>
        <? SideMenu::getContent(); ?>

        <div class="page-content">
            <div class="container-fluid">
                <? static::printContent(); ?>
            </div>
        </div>

        <? static::printJs(); ?>
        </body>
        <?
    }

    public function display()
    {
        if (!Visitor::isLogged()) header("Location:" . Signin::getUrl());
        ?>
        <!DOCTYPE html>
        <html>
        <?
        self::printHead();
        self::printBody();
        ?>
        </html>
        <?
    }

}