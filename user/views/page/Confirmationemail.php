<?php

/**
 * Created by PhpStorm.
 * User: Nk-concept
 * Date: 22/07/2017
 * Time: 01:10
 */
class Confirmationemail extends UnloggedPageModel
{
    public function printTitle()
    {
        echo Translator::getString("emailconfirmation");
    }

    public function printContent()
    {
        ?>
        <form name="resend-confirmation-mail" class="ajax-form sign-box reset-password-box">
            <header class="sign-title"><? echo Translator::getString("emailconfirmation"); ?></header>
            <div class="alert alert-info">
                <strong><? echo Translator::getString("note"); ?></strong>
                <? echo Translator::getString("confirmationmaildeliverytake20minuteswaitbeforeaskingforanother"); ?>
            </div>
            <div class="form-group">
                <input type="text" class="form-control" name="email" placeholder="<? echo Translator::getString("email"); ?>"/>
            </div>
            <div class="form-group notification"></div>
            <button type="submit" class="btn btn-rounded"><? echo Translator::getString("resend"); ?></button>
            <? echo Translator::getString("or"); ?> <a href="<? echo Signin::getUrl(); ?>"><? echo Translator::getString("signin"); ?></a>
        </form>
        <?
    }
}