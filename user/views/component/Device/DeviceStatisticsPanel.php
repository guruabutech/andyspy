<?php

/**
 * Created by PhpStorm.
 * User: Nk-concept
 * Date: 22/07/2017
 * Time: 13:52
 */
class DeviceStatisticsPanel extends IComponents
{
    static function getContent(Row $data = null)
    {
        ?>
        <div class="row">
            <div class="col-sm-6">
                <a href="<? echo Smshistory::getUrl(); ?>">
                    <article class="statistic-box yellow">
                        <div>
                            <div
                                class="number"><? echo Visitor::getLoggedUser()->getSelectedDevice()->getSmsList()->length(); ?></div>
                            <div class="caption">
                                <div><? echo Translator::getString("sms"); ?></div>
                            </div>
                        </div>
                    </article>
                </a>
            </div>
            <div class="col-sm-6">
                <a href="<? echo Callhistory::getUrl(); ?>">
                    <article class="statistic-box green">
                        <div>
                            <div
                                class="number"><? echo Visitor::getLoggedUser()->getSelectedDevice()->getCallList()->length(); ?></div>
                            <div class="caption">
                                <div><? echo Translator::getString("call"); ?></div>
                            </div>
                        </div>
                    </article>
                </a>
            </div>
        </div>
        <?
    }

    static function getJs(Row $data = null)
    {
        // TODO: Implement getJs() method.
    }
}