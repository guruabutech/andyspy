<?php

/**
 * Created by PhpStorm.
 * User: Nk-concept
 * Date: 22/07/2017
 * Time: 01:10
 */
class Smshistory extends LoggedPageModel
{
    public function printTitle()
    {
        echo Translator::getString("smshistory");
    }

    public function printContent()
    {
        SmsHistoryPanel::getHtml(new Row(array("Device" => Visitor::getLoggedUser()->getSelectedDevice())));
    }
}