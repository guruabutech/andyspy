<?php

/**
 * Created by PhpStorm.
 * User: Nk-concept
 * Date: 23/07/2017
 * Time: 22:55
 */
class SmsConversation extends IComponents
{
    static function getContent(Row $data = null)
    {
        /* @var $SmsList Table */
        $SmsList = $data->getColumn("SmsList")->getValue();
        /* @var $Sms Sms */
        $Sms = $SmsList->first()->first()->getValue();
        ?>
        <div class="chat-area-header">
            <div class="chat-list-item">
                <div class="chat-list-item-name">
                    <span class="name"><? echo $Sms->getContact(); ?></span>
                </div>
                <div
                    class="chat-list-item-txt writing"><? echo (new Dtime($Sms->getDate()))->getElapsedString(null, true); ?></div>
            </div>
            <div class="chat-area-header-action">
                <div class="dropdown dropdown-typical">
                    <a class="dropdown-toggle dropdown-toggle-txt" id="dd-chat-action" data-target="#" href
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="lbl"><? echo Translator::getString("actions"); ?></span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dd-chat-action">
                        <a class="dropdown-item no-nowrap"
                           href="javascript:deleteConversation(<? echo $Sms->getThreadId(); ?>); "><? echo Translator::getString("deleteconversation"); ?></a>
                    </div>
                </div>
            </div>
        </div>

        <div class="chat-dialog-area scrollable-block">
            <?
            while ($SmsList->hasNext()) {
                /* @var $Sms Sms */
                $Sms = $SmsList->next()->first()->getValue();
                $Sms->setReviewed(1);
                $Sms->save();
                ?>
                <div data-id="<? echo $Sms->getId(); ?>" data-id_device="<? echo $Sms->getIdDevice(); ?>"
                     class="chat-message <? echo $Sms->getWarning() == "Y" ? "text-danger" : ""; ?>"
                     style="background-color: <? echo $Sms->getType() == "RECEIVED" ? "#ebf7ee" : "#ddeefb"; ?>;">
                    <div class="chat-message-header">
                        <div class="tbl-row">
                            <div
                                class="tbl-cell tbl-cell-name"><? echo Translator::getString($Sms->getType() == "SENT" ? "sent" : "received"); ?></div>
                            <div
                                class="tbl-cell tbl-cell-date"><? echo (new Dtime($Sms->getDate()))->getElapsedString(null, true); ?></div>
                        </div>
                    </div>
                    <div class="chat-message-content">
                        <div class="chat-message-txt"><? echo nl2br($Sms->getBody()); ?></div>
                    </div>
                </div>
                <?
            }
            ?>
        </div>
        <?
    }

    static function getJs(Row $data = null)
    {
        ?>
        <script>
            $(".chat-message").contextmenu(function () {
                var sms = $(this);
                swal({
                        title: "<? echo Translator::getString("togglesmswarning") ?>",
                        text: "<? echo Translator::getString("thisactionisnotreversable") ?>",
                        type: "info",
                        showCancelButton: true,
                        cancelButtonText: "<? echo Translator::getString("cancel") ?>",
                        confirmButtonColor: "#DD6B55",
                        confirmButtonText: "<? echo Translator::getString("yes") ?>",
                        closeOnConfirm: false,
                        showLoaderOnConfirm: true
                    },
                    function () {
                        $.getJSON("", {
                            request: "toggle-sms-warning",
                            id_sms: sms.data("id"),
                            id_device: sms.data("id_device")
                        }, function (json) {
                            if( onRequestResponse(json) ) sms.toggleClass("text-danger");
                        })
                    });
                return false;
            });
            function deleteConversation(thread_id) {
                swal({
                        title: "<? echo Translator::getString("areyousure") ?>",
                        text: "<? echo Translator::getString("thisactionisnotreversable") ?>",
                        type: "warning",
                        showCancelButton: true,
                        cancelButtonText: "<? echo Translator::getString("cancel") ?>",
                        confirmButtonColor: "#DD6B55",
                        confirmButtonText: "<? echo Translator::getString("yes") ?>",
                        closeOnConfirm: false,
                        showLoaderOnConfirm: true
                    },
                    function () {
                        $.getJSON("", {request: "delete-conversation", thread_id: thread_id}, function (json) {
                            onRequestResponse(json);
                        })
                    });
            }
        </script>
        <?
    }
}