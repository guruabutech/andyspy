<?php

/**
 * Created by PhpStorm.
 * User: Nk-concept
 * Date: 23/07/2017
 * Time: 22:55
 */
class SmsConversationArea extends IComponents
{
    static function getContent(Row $data = null)
    {
        /* @var $Device Device */
        $Device = $data->getColumn("Device")->getValue();
        ?>
        <section class="chat-area">
            <div class="chat-area-in">
                <?
                if (HttpRequestGet::has("thread_id")) {
                    $SmsList = $Device->getSmsList(new Sms(null, null, HttpRequestGet::get("thread_id")->getValue()));
                    $SmsList->orderByFunction(function (Row $row1, Row $row2) {
                        /* @var $Sms1 Sms */
                        $Sms1 = $row1->first()->getValue();
                        /* @var $Sms2 Sms */
                        $Sms2 = $row2->first()->getValue();
                        if ($Sms1->getDate() > $Sms2->getDate()) return 1;
                        else if ($Sms2->getDate() > $Sms1->getDate()) return -1;
                        else return 0;
                    });
                    if ($SmsList->length()) SmsConversation::getHtml(new Row(array("SmsList" => $SmsList)));
                    else SmsConversationEmpty::getHtml();
                } else SmsConversationEmpty::getHtml();
                ?>
            </div>
        </section>
        <?
    }

    static function getJs(Row $data = null)
    {
        // TODO: Implement getJs() method.
    }
}