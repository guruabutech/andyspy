<?php

/**
 * Created by PhpStorm.
 * User: Nk-concept
 * Date: 22/07/2017
 * Time: 01:10
 */
class Home extends LoggedPageModel
{
    public function printTitle()
    {
        // TODO: Implement printTitle() method.
    }

    public function printContent()
    {
        $DeviceList = Visitor::getLoggedUser()->getDeviceList();
        if (!$DeviceList->length()) DeviceBendSupport::getHtml();
        else {
            ?>
            <div class="row">
                <div class="col-xs-6">
                    <? DeviceListPanel::getHtml(); ?>
                </div>
                <div class="col-xl-6">
                    <? StatisticsPanel::getHtml(); ?>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <?
                    $Data=new Row();
                    $Data->addColumn(new Column("Devices",implode(",",Visitor::getLoggedUser()->getDeviceCountPerMonth(Dtime::Now()->getYear())->toArray())));
                    $Data->addColumn(new Column("Sms",implode(",",Visitor::getLoggedUser()->getSmsCountPerMonth(Dtime::Now()->getYear())->toArray())));
                    $Data->addColumn(new Column("Call",implode(",",Visitor::getLoggedUser()->getCallCountPerMonth(Dtime::Now()->getYear())->toArray())));
                    $Data->addColumn(new Column("Warnings",implode(",",Visitor::getLoggedUser()->getWarningsCountPerMonth(Dtime::Now()->getYear())->toArray())));
                    $Data->addColumn(new Column("Both",implode(",",Visitor::getLoggedUser()->getCallAndSmsCountPerMonth(Dtime::Now()->getYear())->toArray())));
                    StatisticChartPanel::getHtml($Data);
                    ?>
                </div>
            </div>
            <?
        }
    }
}