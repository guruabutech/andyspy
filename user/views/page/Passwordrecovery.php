<?php

/**
 * Created by PhpStorm.
 * User: Nk-concept
 * Date: 22/07/2017
 * Time: 01:10
 */
class Passwordrecovery extends UnloggedPageModel
{
    public function printTitle()
    {
    }

    public function printContent()
    {
        ?>
        <form name="request-password-reset" class="ajax-form sign-box reset-password-box">
            <header class="sign-title"><? echo Translator::getString("passwordrecovery"); ?></header>
            <div class="form-group">
                <input type="text" class="form-control" name="email" placeholder="<? echo Translator::getString("email"); ?>"/>
            </div>
            <div class="form-group notification"></div>
            <button type="submit" class="btn btn-rounded"><? echo Translator::getString("reset"); ?></button>
            <? echo Translator::getString("or"); ?> <a href="<? echo Signin::getUrl(); ?>"><? echo Translator::getString("signin"); ?></a>
        </form>
        <?
    }
}