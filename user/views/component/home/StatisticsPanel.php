<?php

/**
 * Created by PhpStorm.
 * User: Nk-concept
 * Date: 22/07/2017
 * Time: 13:52
 */
class StatisticsPanel extends IComponents
{
    static function getContent(Row $data = null)
    {
        ?>
        <div class="row">
            <div class="col-sm-6">
                <article class="statistic-box purple">
                    <div>
                        <div
                            class="number"><? echo Visitor::getLoggedUser()->getDeviceList()->length(); ?></div>
                        <div class="caption">
                            <div><? echo Translator::getString("device"); ?></div>
                        </div>
                    </div>
                </article>
            </div>
            <div class="col-sm-6">
                <article class="statistic-box yellow">
                    <div>
                        <div
                            class="number"><? echo Visitor::getLoggedUser()->getSmsListByDevice()->length(); ?></div>
                        <div class="caption">
                            <div><? echo Translator::getString("sms"); ?></div>
                        </div>
                    </div>
                </article>
            </div>
            <div class="col-sm-6">
                <article class="statistic-box green">
                    <div>
                        <div
                            class="number"><? echo Visitor::getLoggedUser()->getCallListByDevice()->length(); ?></div>
                        <div class="caption">
                            <div><? echo Translator::getString("call"); ?></div>
                        </div>
                    </div>
                </article>
            </div>
            <div class="col-sm-6">
                <article class="statistic-box red">
                    <div>
                        <div
                            class="number"><? echo Visitor::getLoggedUser()->getSmsListByDevice(new Sms(null,null,null,null,null,null,null,null,null,"Y"))->length()+Visitor::getLoggedUser()->getCallListByDevice(new Call(null,null,null,null,null,null,null,null,"Y"))->length(); ?></div>
                        <div class="caption">
                            <div><? echo Translator::getString("warnings"); ?></div>
                        </div>
                    </div>
                </article>
            </div>
        </div>
        <?
    }

    static function getJs(Row $data = null)
    {
        // TODO: Implement getJs() method.
    }
}