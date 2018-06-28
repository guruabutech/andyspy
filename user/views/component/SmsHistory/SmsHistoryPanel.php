<?php

/**
 * Created by PhpStorm.
 * User: Nk-concept
 * Date: 23/07/2017
 * Time: 15:51
 */
class SmsHistoryPanel extends MediaDisplayer
{
    static function getContent(Row $data = null)
    {
        if (!parent::getContent()) return;
        $Device = Visitor::getLoggedUser()->getSelectedDevice();
        $Device->getId();
        ?>
        <div class="box-typical chat-container">
            <?
                SmsThreadList::getHtml(new Row(array("Device" => $Device)));
                SmsConversationArea::getHtml(new Row(array("Device" => $Device)));
            ?>
        </div>
        <?
    }

    static function getJs(Row $data = null)
    {
        // TODO: Implement getJs() method.
    }
}