<?php

/**
 * Created by PhpStorm.
 * User: Nk-concept
 * Date: 22/07/2017
 * Time: 01:10
 */
class Signup extends UnloggedPageModel
{
    public function printTitle()
    {
        echo Translator::getString("signup");
    }

    public function printContent()
    {
        ?>
        <form name="sign-up" class="ajax-form sign-box">
            <header class="sign-title"><? echo Translator::getString("signup"); ?></header>
            <div class="form-group">
                <input type="text" class="form-control" name="fname" placeholder="<? echo Translator::getString("firstname"); ?>"/>
            </div>
            <div class="form-group">
                <input type="text" class="form-control" name="lname" placeholder="<? echo Translator::getString("lastname"); ?>"/>
            </div>
            <div class="form-group">
                <input type="text" class="form-control" name="email" placeholder="<? echo Translator::getString("email"); ?>"/>
            </div>
            <div class="form-group">
                <input type="text" class="form-control" name="username" placeholder="<? echo Translator::getString("username"); ?>"/>
            </div>
            <div class="form-group">
                <input type="password" class="form-control" name="password" placeholder="<? echo Translator::getString("password"); ?>"/>
            </div>
            <div class="form-group notification"></div>
            <button type="submit" class="btn btn-rounded btn-success sign-up"><? echo Translator::getString("signup"); ?></button>
            <p class="sign-note"><? echo Translator::getString("alreadyhaveanaccount"); ?> <a href="<? echo Signin::getUrl(); ?>"><? echo Translator::getString("signin"); ?></a></p>
        </form>
        <?
    }
}