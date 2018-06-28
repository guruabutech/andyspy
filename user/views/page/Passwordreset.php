<?php

/**
 * Created by PhpStorm.
 * User: Nk-concept
 * Date: 22/07/2017
 * Time: 01:10
 */
class Passwordreset extends UnloggedPageModel
{
    public function printTitle()
    {
    }

    public function printContent()
    {
        ?>
        <form name="reset-password" class="ajax-form sign-box reset-password-box">
            <?
            if (isset($_GET["key"], $_GET["username"])) {
                if (Visitor::getLoggedUser()->checkActionKey($_GET["key"], $_GET["username"])) {
                    $User = new User();
                    $User->setUsername(HttpRequestGet::get("username")->getValue());
                    $User->load();
                    ?>
                    <header class="sign-title">Reset Password</header>
                    <div class="form-group">
                        <label>
                            <input disabled="disabled" type="text" class="form-control" name="username"
                                   value="<? echo $User->getUsername(); ?>"/>
                        </label>
                    </div>
                    <div class="form-group">
                        <label>
                            <input readonly="readonly" type="text" class="form-control" name="key"
                                   value="<? echo $User->getActionKey(); ?>"/>
                        </label>
                    </div>
                    <div class="form-group">
                        <label>
                            <input type="password" class="form-control" name="password" placeholder="Password"/>
                        </label>
                    </div>
                    <div class="form-group notification"></div>
                    <button type="submit" class="btn btn-rounded">Reset</button> or
                    <?
                }else{
                    ?>
                    <div class="alert alert-danger sign-box">
                        <strong>Failed</strong> Change request rejected
                    </div>
                    <?
                }
            }
            ?>

            <a href="<? echo Signin::getUrl(); ?>">Go back</a>
        </form>
        <?
    }
}