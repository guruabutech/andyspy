<?php

/**
 * Created by PhpStorm.
 * User: Nk-concept
 * Date: 22/07/2017
 * Time: 13:52
 */
class SideMenu extends IComponents
{
    static function getContent(Row $data = null)
    {
        ?>
        <nav class="side-menu">
            <ul class="side-menu-list">
                <li class="grey">
                    <a href="<? echo Home::getUrl(); ?>">
                        <i class="font-icon font-icon-dashboard"></i>
                        <span class="lbl"><? echo Translator::getString("dashboard"); ?></span>
                    </a>
                </li>
                <li class="green">
                    <a href="<? echo Smshistory::getUrl(); ?>">
                        <i class="font-icon font-icon-mail"></i>
                        <span class="lbl"><? echo Translator::getString("smshistory"); ?></span>
                    </a>
                </li>
                <li class="grey-blue">
                    <a href="<? echo Callhistory::getUrl(); ?>">
                        <i class="font-icon font-icon-phone"></i>
                        <span class="lbl"><? echo Translator::getString("callhistory"); ?></span>
                    </a>
                </li>
                <li class="gold">
                    <a href="<? echo Properties::getUrl(); ?>">
                        <i class="font-icon font-icon-speed"></i>
                        <span class="lbl"><? echo Translator::getString("properties"); ?></span>
                    </a>
                </li>
            </ul>
        </nav>
        <?
    }

    static function getJs(Row $data = null)
    {
        // TODO: Implement getJs() method.
    }
}