<?php

/**
 * Created by PhpStorm.
 * User: Nk-concept
 * Date: 22/07/2017
 * Time: 13:52
 */
class SiteHeader extends IComponents
{
    static function getContent(Row $data = null)
    {
        ?>
        <header class="site-header">
            <div class="container-fluid">
                <a href="#" class="site-logo" style="background-color: #e4e4e4;">
                    <img class="hidden-md-down" src="assets/img/logo.png" alt="">
                    <img class="hidden-lg-up" src="assets/img/logo.png" alt="">
                </a>
                <button class="hamburger hamburger--htla">
                    <span><? echo Translator::getString("togglemenu"); ?></span>
                </button>
                <div class="site-header-content">
                    <div class="site-header-content-in">
                        <div class="site-header-shown">

                            <div class="dropdown dropdown-lang">
                                <button class="dropdown-toggle" type="button" data-toggle="dropdown"
                                        aria-haspopup="true" aria-expanded="false">
                                    <span
                                        class="flag-icon flag-icon-<? echo Translator::getCurrentLanguage()->getFlag(); ?>"></span>
                                </button>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <div class="dropdown-menu-col">
                                        <?
                                        $LanguageList = Translator::getLanguages();
                                        while ($LanguageList->hasNext()) {
                                            /* @var $Language Language */
                                            $Language = $LanguageList->next()->first()->getValue();
                                            if ($LanguageList->getInternalPointer() > ($LanguageList->length() / 2)) echo "</div><div class=\"dropdown-menu-col\">";
                                            ?>
                                            <a class="dropdown-item <? echo $Language->getFlag() == Translator::getCurrentLanguage()->getFlag() ? "current" : ""; ?>"
                                               href="<? echo AndySpy::getRefreshUrl(new Row(array(AndySpy::getHttpRequestListenerIndex() => "change-language", "language" => $Language->getFlag()))); ?>"><span
                                                    class="flag-icon flag-icon-<? echo $Language->getFlag(); ?>"></span><? echo $Language->getName(); ?>
                                            </a>
                                            <?
                                        }
                                        ?>
                                    </div>

                                </div>
                            </div>

                            <div class="dropdown user-menu">
                                <button class="dropdown-toggle" id="dd-user-menu" type="button" data-toggle="dropdown"
                                        aria-haspopup="true" aria-expanded="false">
                                    <img src="assets/img/avatar-2-64.png" alt="">
                                </button>
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dd-user-menu">
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item"
                                       href="<? echo Signin::getUrl(new Row(array(AndySpy::getHttpRequestListenerIndex() => "sign-out"))); ?>"><span
                                            class="font-icon glyphicon glyphicon-log-out"></span><? echo Translator::getString("logout"); ?>
                                    </a>
                                </div>
                            </div>

                            <button type="button" class="burger-right">
                                <i class="font-icon-menu-addl"></i>
                            </button>
                        </div>

                        <div class="mobile-menu-right-overlay"></div>
                        <div class="site-header-collapsed">
                            <div class="site-header-collapsed-in">
                                <div class="dropdown">
                                    <button class="btn btn-rounded dropdown-toggle" id="dd-header-add" type="button"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <? echo Visitor::getLoggedUser()->getSelectedDevice() ? Visitor::getLoggedUser()->getSelectedDevice()->getName() : Translator::getString("device"); ?>
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="dd-header-add">
                                        <?
                                        $DeviceList = Visitor::getLoggedUser()->getDeviceList();
                                        while ($DeviceList->hasNext()) {
                                            /* @var $Device Device */
                                            $Device = $DeviceList->next()->first()->getValue();
                                            ?>
                                            <a class="dropdown-item"
                                               href="<? echo AndySpy::getRefreshUrl(new Row(array(AndySpy::getHttpRequestListenerIndex() => "select-device", "id_device" => $Device->getId()))); ?>"><? echo $Device->getName(); ?></a>
                                            <?
                                        }
                                        ?>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <?
    }

    static function getJs(Row $data = null)
    {
        // TODO: Implement getJs() method.
    }
}