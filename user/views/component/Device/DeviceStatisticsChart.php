<?php

/**
 * Created by PhpStorm.
 * User: Nk-concept
 * Date: 24/07/2017
 * Time: 20:55
 */
class DeviceStatisticsChart extends MediaDisplayer
{
    static function getContent(Row $data = null)
    {
        if (!parent::getContent()) return;
        DeviceStatisticsPanel::getHtml();
        $Data = new Row();
        $Data->addColumn(new Column("Sms", implode(",", Visitor::getLoggedUser()->getSelectedDevice()->getSmsCountPerMonth(Dtime::Now()->getYear())->toArray())));
        $Data->addColumn(new Column("Call", implode(",", Visitor::getLoggedUser()->getSelectedDevice()->getCallCountPerMonth(Dtime::Now()->getYear())->toArray())));
        StatisticChartPanel::getHtml($Data);
    }

    static function getJs(Row $data = null)
    {
    }
}