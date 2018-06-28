<?php

/**
 * Created by PhpStorm.
 * User: Nk-concept
 * Date: 23/07/2017
 * Time: 15:51
 */
class SmsThreadList extends MediaDisplayer
{
    static function getContent(Row $data = null)
    {
        /* @var $Device Device */
        $Device = $data->getColumn("Device")->getValue();
        ?>
        <section class="chat-list">
            <div class="chat-list-in scrollable-block">
                <?
                $LastSmsForEachThread = $Device->getLastSmsForEachThread();
                if ($LastSmsForEachThread->hasNext()) {
                    while ($LastSmsForEachThread->hasNext()) {
                        /* @var $Sms Sms */
                        $Sms = $LastSmsForEachThread->next()->first()->getValue();
                        ?>
                        <div
                            class="chat-list-item <? echo HttpRequestGet::get("thread_id")->getValue() == $Sms->getThreadId() ? "selected" : ""; ?>"
                            style="cursor: pointer;"
                            onclick="window.location.href='<? echo Smshistory::getUrl(new Row(array("thread_id" => $Sms->getThreadId()))) ?>'">
                            <div class="chat-list-item-header">
                                <div class="chat-list-item-name">
                                    <span class="name"><? echo $Sms->getContact(); ?></span>
                                </div>
                                <div
                                    class="chat-list-item-date"><? echo (new Dtime(intval($Sms->getDate())))->getElapsedString(null, true); ?></div>
                            </div>
                            <div class="chat-list-item-cont">
                                <div class="chat-list-item-txt"><? echo $Sms->getBody(); ?>
                                </div>
                                <?
                                $count = $Device->getUnreviewedSmsCount($Sms->getThreadId());
                                if ($count) echo "<div class=\"chat-list-item-count\">$count</div>";
                                ?>
                            </div>
                        </div>
                        <?
                    }
                } else {
                    ?>
                    <div class="chat-list-search">
                        <? echo Translator::getString("nosms"); ?>
                    </div>
                    <?
                }
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