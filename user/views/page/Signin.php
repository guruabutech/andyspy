<?php

/**
 * Created by PhpStorm.
 * User: Nk-concept
 * Date: 22/07/2017
 * Time: 01:10
 */
class Signin extends UnloggedPageModel
{
    public function printTitle()
    {
        echo Translator::getString("signin");
    }

    public function printContent()
    {
        ?>
        <form name="sign-in" class="sign-box ajax-form">
            <header class="sign-title"><? echo Translator::getString("signin"); ?></header>
            <?
            if (isset($_GET["key"], $_GET["username"])) {
                if (Visitor::getLoggedUser()->checkActionKey($_GET["key"], $_GET["username"])) {
                    try {
                        $Response = Visitor::getLoggedUser()->confirmEmail($_GET["username"]);
                        ?>
                        <div class="alert alert-<? echo $Response->get("type"); ?> sign-box">
                            <strong><? echo $Response->get("title"); ?></strong> <? echo $Response->get("message"); ?>
                        </div>
                        <?
                    } catch (UserFriendlyException $e) {
                        ?>
                        <div class="alert alert-danger sign-box">
                            <strong><? echo $e->getTitle(); ?></strong> <? echo $e->getMessage(); ?>
                        </div>
                        <?
                    }
                } else {
                    ?>
                    <div class="alert alert-danger sign-box">
                        <strong><? echo Translator::getString("failed"); ?></strong> <? echo Translator::getString("emailconfirmationrejectedpleasetypeegainlater"); ?>
                    </div>
                    <?
                }
            }
            ?>
            <div class="form-group">
                <input type="text" class="form-control" name="username" placeholder="<? echo Translator::getString("username"); ?>"/>
            </div>
            <div class="form-group">
                <input type="password" class="form-control" name="password" placeholder="<? echo Translator::getString("password"); ?>"/>
            </div>
            <div class="form-group">
                <div class="float-right reset">
                    <a href="<? echo Passwordrecovery::getUrl(); ?>"><? echo Translator::getString("resetpassword"); ?></a>
                </div>
            </div>
            <div class="form-group notification"></div>
            <button type="submit" class="btn btn-rounded"><? echo Translator::getString("signin"); ?></button>
            <p class="sign-note"><? echo Translator::getString("newtoourwebsite"); ?> <a href="<? echo Signup::getUrl(); ?>"><? echo Translator::getString("signup"); ?></a></p>
            <p class="sign-note"><? echo Translator::getString("troubleconfirmingyouremail"); ?><br><a href="<? echo Confirmationemail::getUrl(); ?>"><? echo Translator::getString("sendagain"); ?></a></p>
        </form>
        <?
    }
}