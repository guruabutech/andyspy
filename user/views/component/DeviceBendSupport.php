<?php

/**
 * Created by PhpStorm.
 * User: Nk-concept
 * Date: 23/07/2017
 * Time: 15:51
 */
class DeviceBendSupport extends IComponents
{
    static function getContent(Row $data = null)
    {
        ?>
        <section class="card card-red">
            <header class="card-header card-header-xl">
                <? echo Translator::getString("youraccounthasnobendeddevices"); ?>
            </header>
            <div class="card-block">
                <p class="card-text">
                    <? echo Translator::getString("youhavecreatedanaccountbutitdoesnothaveanybendeddevices"); ?><br><br>
                    <b><? echo Translator::getString("howtobenddevices"); ?></b><br><br>
                    <? echo Translator::getString("wanttobendandroiddevice"); ?><br>
                    <a href=""><i
                            class="fa fa-arrow-right"></i> <? echo Translator::getString("howtobendanandroiddevice"); ?>
                    </a>
                </p>
            </div>
        </section>
        <?
    }

    static function getJs(Row $data = null)
    {
        // TODO: Implement getJs() method.
    }
}