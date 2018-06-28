<?php

/**
 * Created by PhpStorm.
 * User: Nk-concept
 * Date: 25/08/2017
 * Time: 16:23
 */
class PropertiesPanel extends MediaDisplayer
{
    static function getContent(Row $data = null)
    {
        if (!parent::getContent()) return;
        ?>
        <section class="card card-blue">
            <header class="card-header">
                <? echo Translator::getString("properties"); ?>
            </header>
            <div class="card-block">
                <div class="checkbox-bird green"  onclick="return false;">
                    <input type="checkbox" readonly="readonly" id="syncronised" <? echo Visitor::getLoggedUser()->getSelectedDevice()->getSync()=="Y" ? "checked='checked'":""; ?>>
                    <label for="syncronised"><? echo Translator::getString("syncronised"); ?></label>
                </div>
                <form name="update-properties" class="ajax-form">
                    <table id="table-sm" class="table table-bordered table-hover table-sm">
                        <thead>
                        <tr>
                            <th width="1">
                                <? echo Translator::getString("property"); ?>
                            </th>
                            <th>
                                <? echo Translator::getString("value"); ?>
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>
                                <? echo Translator::getString("synctimeinterval"); ?>
                            </td>
                            <td>
                                <select name="sync_time_interval" class="form-control">
                                    <option><? echo Translator::getString("synctimeinterval"); ?></option>
                                    <?
                                    foreach( array(30,180,300,900,1800) As $time ){
                                        ?>
                                        <option value="<? echo $time ?>" <? if( Visitor::getLoggedUser()->getSelectedDevice()->getSyncTimeInterval()==$time ) echo "selected='selected'"; ?>"><? echo $time ?> <? echo Translator::getString("seconds"); ?></option>
                                        <?
                                    }
                                    ?>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <? echo Translator::getString("allowedsyncnetwork"); ?>
                            </td>
                            <td>
                                <div class="checkbox-toggle">
                                    <input type="checkbox" name="allowed_sync_network" value="2" <? if( Visitor::getLoggedUser()->getSelectedDevice()->getAllowedSyncNetwork()==2 ) echo "checked='checked'"; ?> id="allowed-sync-network"/>
                                    <label for="allowed-sync-network"><? echo Translator::getString("mobiledataallowed"); ?></label>
                                </div>

                                <div class="alert alert-info alert-fill alert-border-left alert-close alert-dismissible fade in" role="alert">
                                    <? echo Translator::getString("wifiisalwaysallowed"); ?>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table><br>

                    <button type="submit" class="btn btn-rounded btn-inline"><? echo Translator::getString("save"); ?></button>
                </form>
            </div>
        </section>
        <?
    }

    static function getJs(Row $data = null)
    {
    }
}