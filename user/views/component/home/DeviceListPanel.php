<?php

/**
 * Created by PhpStorm.
 * User: Nk-concept
 * Date: 22/07/2017
 * Time: 13:52
 */
class DeviceListPanel extends IComponents
{
    static function getContent(Row $data = null)
    {
        ?>
        <section class="box-typical box-typical-max-280 scrollable">
            <header class="box-typical-header">
                <div class="tbl-row">
                    <div class="tbl-cell tbl-cell-title">
                        <h3><? echo Translator::getString("devicelist"); ?></h3>
                    </div>
                </div>
            </header>
            <div class="box-typical-body">
                <div class="table-responsive">
                    <table class="table table-hover">
                        <tbody>
                        <?
                        $DeviceList = Visitor::getLoggedUser()->getDeviceList();
                        while ($DeviceList->hasNext()) {
                            /* @var $Device Device */
                            $Device = $DeviceList->next()->first()->getValue();
                            ?>
                            <tr>
                                <td>
                                    <a href="<? echo Devicestatistics::getUrl(new Row(array(AndySpy::getHttpRequestListenerIndex() => "select-device", "id_device" => $Device->getId()))); ?>"><? echo $Device->getName(); ?></a>
                                </td>
                                <td><? echo $Device->getSyncTimeInterval() . " " . Translator::getString("seconds"); ?></td>
                                <td>
                                    <span class="text-primary"><i class="fa fa-wifi"></i> <? echo Translator::getString("wifi"); ?></span>
                                    |
                                    <br>
                                    <span class="<? echo $Device->getAllowedSyncNetwork()==2 ? "text-primary":""; ?>"><i class="fa fa-signal"></i> <? echo Translator::getString("internet"); ?></span>
                                </td>
                                <td>
                                    <div
                                        class="font-11 color-blue-grey-lighter uppercase"><? echo Translator::getString("thismonth"); ?></div>
                                    <?
                                    $current_month_communication_cost = $Device->getCurrentMonthCommunicationCost();
                                    $last_month_communication_cost = $Device->getLastMonthCommunicationCost();
                                    if ($current_month_communication_cost == 0 or $last_month_communication_cost == 0) {
                                        echo Translator::getString("none");
                                    } else {
                                        $percentage = ($current_month_communication_cost / $last_month_communication_cost) * 100;
                                        echo $percentage > 0 ? "+" : ($percentage < 0 ? "-" : "");
                                        echo "$percentage%";
                                    }
                                    ?>
                                </td>
                                <td>
                                    <button onclick="inbindDevice(<? echo $Device->getId(); ?>)" type="button" class="btn btn-rounded btn-inline btn-danger-outline"><? echo Translator::getString("inbind"); ?></button>
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
            function inbindDevice(id_device) {
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
                        $.getJSON("", {request: "inbind-device", id_device: id_device}, function (json) {
                            onRequestResponse(json);
                        })
                    });
            }
        </script>
        <?
    }
}