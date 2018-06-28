<?php

/**
 * Created by PhpStorm.
 * User: Nk-concept
 * Date: 23/07/2017
 * Time: 22:55
 */
class SmsConversationEmpty extends IComponents
{
    static function getContent(Row $data = null)
    {
        ?>
        <div class="chat-area-header">
            <div class="clean"><? echo Translator::getString("nocontact"); ?></div>
        </div>
        <div class="chat-dialog-area">
            <div class="chat-dialog-clean">
                <div class="chat-dialog-clean-in">
                    <i class="font-icon font-icon-mail-2"></i>
                    <div class="caption"><? echo Translator::getString("selectacontact"); ?></div>
                    <div
                        class="txt"><? echo Translator::getString("toreviewsmspleaseselectaconversationontheleftside"); ?>
                    </div>
                </div>
            </div>
        </div>
        <?
    }

    static function getJs(Row $data = null)
    {
        // TODO: Implement getJs() method.
    }
}