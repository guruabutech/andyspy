<?php

/**
 * Created by PhpStorm.
 * User: Nk-concept
 * Date: 23/07/2017
 * Time: 18:19
 */
class MediaDisplayer extends IComponents
{
    static function getContent(Row $data = null)
    {
        if (!$Device = Visitor::getLoggedUser()->getSelectedDevice()) {
            if (!Visitor::getLoggedUser()->getDeviceList()->length()) DeviceBendSupport::getHtml();
            else {
                ?>
                <section class="card card-blue">
                    <header class="card-header card-header-xl">
                        <? echo Translator::getString("selectdevice"); ?>
                    </header>
                    <div class="card-block">
                        <p class="card-text">
                            <? echo Translator::getString("inordertoviewdevicemediapleaseselectadevice"); ?><br><br>
                            <b><? echo Translator::getString("listofdevices"); ?></b><br><br>
                            <?
                            $DeviceList = Visitor::getLoggedUser()->getDeviceList();
                            while ($DeviceList->hasNext()) {
                                /* @var $Device Device */
                                $Device = $DeviceList->next()->first()->getValue();
                                ?>
                                <a href="<? echo AndySpy::getRefreshUrl(new Row(array(AndySpy::getHttpRequestListenerIndex() => "select-device", "id_device" => $Device->getId()))); ?>"><i
                                        class="fa fa-arrow-right"></i> <? echo $Device->getName(); ?></a>
                                <?
                            }
                            ?>
                        </p>
                    </div>
                </section>
                <?
            }
            return false;
        } else return true;
    }

    static function getJs(Row $data = null)
    {
        // TODO: Implement getJs() method.
    }
}