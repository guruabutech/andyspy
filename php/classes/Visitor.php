<?php

/**
 * Created by PhpStorm.
 * User: Nk-concept
 * Date: 21/07/2017
 * Time: 20:14
 */
class Visitor implements HttpRequestExecuter
{
    /**
     * @return bool|User|Visitor
     */
    public static function getLoggedUser()
    {
        $LoggedUser = self::isLogged();
        return $LoggedUser ? $LoggedUser : new Visitor();
    }

    public static function isLogged()
    {
        if (is_array(($data = Session::get("user")))) {
            return self::getUser($data["username"], $data["password"]);
        }
        return false;
    }

    /**
     * @param $username
     * @param $password
     * @return User|bool
     */
    public static function getUser($username, $password)
    {
        $User = new User();
        $User->setUsername($username);
        $User->setPassword($password);
        $List = User::find($User);
        if ($List->length()) return $List->first()->first()->getValue();
        else return false;
    }

    /**
     * @param $username
     * @param $password
     * @return Response
     * @throws UserFriendlyException
     * @execution(index="sign-in",isAjax="true")
     */
    public function signin($username, $password)
    {
        if (!strlen($username)) throw new UserFriendlyException(Translator::getString("pleasetypeyourusername"), Translator::getString("failed"));
        if (!strlen($password)) throw new UserFriendlyException(Translator::getString("pleasetypeyourpassword"), Translator::getString("failed"));
        if (!$User = self::getUser($username, $password)) throw new UserFriendlyException(Translator::getString("wrongauthentificationinfo"), Translator::getString("failed"));
        if ($User->getStatus() == "NEW") throw new UserFriendlyException(Translator::getString("pleaseconfirmyouremail"), Translator::getString("failed"));
        if ($User->getStatus() == "BLACKLISTED") throw new UserFriendlyException(Translator::getString("youraccountisblacklisted"), Translator::getString("failed"));
        Session::put("user",
            array(
                "username" => $username,
                "password" => $password
            )
        );

        return new Response(
            array(
                "status" => true,
                "type" => "success",
                "title" => Translator::getString("success"),
                "message" => Translator::getString("youhavebeenloggedin"),
                "redirect" => Home::getUrl(),
                "timeBeforeRedirect"=>1000
            )
        );
    }

    /**
     * @param $email
     * @return Response
     * @throws UserFriendlyException
     * @execution(index="request-password-reset",isAjax="true")
     */
    public function requestPasswordReset($email)
    {
        if (!strlen($email)) throw new UserFriendlyException(Translator::getString("pleasetypeyouremail"), Translator::getString("failed"));
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) throw new UserFriendlyException(Translator::getString("pleasetypeavalidemail"), Translator::getString("failed"));

        $User = new User();
        $User->setEmail($email);
        $List = User::find($User);
        if (!$List->length()) throw new UserFriendlyException(Translator::getString("emailnotfound"), Translator::getString("failed"));
        /* @var $User User */
        $User = $List->first()->first()->getValue();

        /** BUILDING EMAIL **/
        $to = $email;

        $subject = Translator::getString("passwordrecoverymailsubject");

        $headers = "From: " . strip_tags(AndySpy::getEmail()) . "\r\n";
        $headers .= "Reply-To: " . strip_tags(AndySpy::getEmail()) . "\r\n";
        $headers .= "MIME-Version: 1.0\r\n";
        $headers .= "Content-Type: text/html; charset=ISO-8859-1\r\n";

        $Email = new EmailType1();
        $Email->setTitle("{$User->getUsername()},");
        $Email->setBody(Translator::getString("passwordrecoverymailbody"));
        $Email->setBtnHref(Passwordreset::getUrl(new Row(array("key" => $User->getActionKey(), "username" => $User->getUsername()))));
        $Email->setBtnText(Translator::getString("passwordrecoverymailbtntext"));
        $Email->setFrom(Translator::getString("passwordrecoverymailfrom"));
        $Email->setFooter(Translator::getString("passwordrecoverymailfooter"));

        $message = $Email->__toString();


        if (!@mail($to, $subject, $message, $headers)) throw new UserFriendlyException(Translator::getString("errorsendingmailpleasetryegainlater"), Translator::getString("failed"));

        return new Response(
            array(
                "status" => true,
                "type" => "success",
                "title" => Translator::getString("success"),
                "message" => Translator::getString("passwordrecoverymailissenttoyou")
            )
        );
    }

    /**
     * @param $username
     * @param $key
     * @param $password
     * @return Response
     * @throws UserFriendlyException
     * @execution(index="reset-password",isAjax="true")
     */
    public function resetUserPassword($username, $key, $password)
    {
        if (!strlen($username)) throw new UserFriendlyException(Translator::getString("usernameismissing"), Translator::getString("failed"));
        if (!strlen($key)) throw new UserFriendlyException(Translator::getString("actionkeyismissing"), Translator::getString("failed"));
        if (!strlen($password)) throw new UserFriendlyException(Translator::getString("pleaseenteryournewpassword"), Translator::getString("failed"));
        if (strlen($password) < 8) throw new UserFriendlyException(Translator::getString("yourpasswordmustcontain8charactersatleast"), Translator::getString("failed"));
        if (!User::columnValueExists("username", $username)) throw new UserFriendlyException(Translator::getString("usernamedoesnotexist"), Translator::getString("failed"));
        $User = new User();
        $User->setUsername($username);
        $User->load();
        if ($User->getActionKey() != $key) throw new UserFriendlyException(Translator::getString("resetpasswordrejected"), Translator::getString("failed"));
        if ($User->getPassword() == md5($password)) throw new UserFriendlyException(Translator::getString("passwordmustbedifferentfromthecurrentone"), Translator::getString("failed"));


        $User->setPassword($password);
        $User->save();

        return new Response(
            array(
                "status" => true,
                "type" => "success",
                "title" => "Success",
                "message" => Translator::getString("yourpasswordhasbeenchanged")
            )
        );
    }

    /**
     * @param $fname
     * @param $lname
     * @param $username
     * @param $email
     * @param $password
     * @return Response
     * @throws UserFriendlyException
     * @execution(index="sign-up",isAjax="true")
     */
    public function signup($fname, $lname, $username, $email, $password)
    {
        if (!strlen($fname)) throw new UserFriendlyException(Translator::getString("pleasetypeyourusername"), Translator::getString("failed"));
        if (!strlen($lname)) throw new UserFriendlyException(Translator::getString("pleasetypeyourlastname"), Translator::getString("failed"));
        if (!strlen($email)) throw new UserFriendlyException(Translator::getString("pleasetypeyouremail"), Translator::getString("failed"));
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) throw new UserFriendlyException(Translator::getString("invalidemailformat"), Translator::getString("failed"));
        if (User::columnValueExists("email", $email)) throw new UserFriendlyException(Translator::getString("emailalreadyregistered"), Translator::getString("failed"));
        if (!strlen($username)) throw new UserFriendlyException(Translator::getString("pleasetypeyourusername"), Translator::getString("failed"));
        if (strlen($username) > 10) throw new UserFriendlyException(Translator::getString("usernamemaxlengthis10characters"), Translator::getString("failed"));
        if (User::columnValueExists("username", $username)) throw new UserFriendlyException(Translator::getString("usernametaken"), Translator::getString("failed"));
        if (!strlen($password)) throw new UserFriendlyException(Translator::getString("pleasetypeyourpassword"), Translator::getString("failed"));
        if (strlen($password) < 8) throw new UserFriendlyException(Translator::getString("yourpasswordmustcontain8charactersatleast"), Translator::getString("failed"));

        $User = new User();
        $User->setFname($fname);
        $User->setLname($lname);
        $User->setUsername($username);
        $User->setEmail($email);
        $User->setPassword($password);
        User::insert($User);
        $User->load();

        $this->sendConfirmationMail($email, $User);

        return new Response(
            array(
                "status" => true,
                "type" => "info",
                "title" => "Success",
                "message" => Translator::getString("anmailissenttoyouuseittoconfirmyouremailaddress"),
                "keepFormData" => true
            )
        );
    }

    private function sendConfirmationMail($email, User $User)
    {
        $to = $email;

        $subject = Translator::getString("confirmationmailsubject");

        $headers = "From: " . strip_tags(AndySpy::getEmail()) . "\r\n";
        $headers .= "Reply-To: " . strip_tags(AndySpy::getEmail()) . "\r\n";
        $headers .= "MIME-Version: 1.0\r\n";
        $headers .= "Content-Type: text/html; charset=ISO-8859-1\r\n";

        $Email = new EmailType1();
        $Email->setTitle(Translator::getString("confirmationmailtitle"));
        $Email->setBody(Translator::getString("confirmationmailbody"));
        $Email->setBtnHref(Signin::getUrl(new Row(array("key" => $User->getActionKey(), "username" => $User->getUsername()))));
        $Email->setBtnText(Translator::getString("confirmationmailbtntext"));
        $Email->setFrom(Translator::getString("confirmationmailfrom"));
        $Email->setFooter(Translator::getString("confirmationmailfooter"));

        $message = $Email->__toString();

        if (!@mail($to, $subject, $message, $headers)) throw new UserFriendlyException(Translator::getString("errorsendingmailpleasetryagainlater"), Translator::getString("failed"));
    }

    /**
     * @param $username
     * @return Response
     * @throws UserFriendlyException
     * @execution(index="confirm-email",isAjax="false")
     */
    public function confirmEmail($username)
    {
        if (!strlen($username)) throw new UserFriendlyException(Translator::getString("usernameismissing"), Translator::getString("failed"));
        if (!User::columnValueExists("username", $username)) throw new UserFriendlyException(Translator::getString("usernamedoesnotexist"), Translator::getString("failed"));
        $User = new User();
        $User->setUsername($username);
        $User->load();
        if ($User->getStatus() == "BLACKLISTED") throw new UserFriendlyException(Translator::getString("youraccountisblacklisted"), Translator::getString("failed"));
        if ($User->getStatus() == "CONFIRMED") throw new UserFriendlyException(Translator::getString("youremailwasalreadyconfirmed"), Translator::getString("failed"));

        $User->setStatus("CONFIRMED");
        $User->save();


        return new Response(
            array(
                "status" => true,
                "type" => "success",
                "title" => "Success",
                "message" => Translator::getString("youremailisconfirmedyoucansigninnow")
            )
        );
    }

    /**
     * @param $email
     * @return Response
     * @throws UserFriendlyException
     * @execution(index="resend-confirmation-mail",isAjax="true")
     */
    public function resendConfirmationMail($email)
    {
        if (!strlen($email)) throw new UserFriendlyException(Translator::getString("pleasetypeyouremail"), "Failed");
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) throw new UserFriendlyException(Translator::getString("pleasetypeavalidemail"), "Failed");
        if (!User::columnValueExists("email", $email)) throw new UserFriendlyException(Translator::getString("emailnotfound"), "Failed");
        $User = new User();
        $User->setEmail($email);
        $User->load();
        if ($User->getStatus() == "BLACKLISTED") throw new UserFriendlyException(Translator::getString("youraccountisblacklisted"), "Failed");
        if ($User->getStatus() == "CONFIRMED") throw new UserFriendlyException(Translator::getString("youremailwasalreadyconfirmed"), "Failed");

        $this->sendConfirmationMail($email, $User);

        return new Response(
            array(
                "status" => true,
                "type" => "info",
                "title" => "Success",
                "message" => Translator::getString("anmailissenttoyouuseittoconfirmyouremailaddress"),
                "keepFormData" => true
            )
        );
    }

    public function checkActionKey($key, $username)
    {
        if (!User::columnValueExists("username", $username)) return false;
        $User = new User();
        $User->setUsername($username);
        $User->load();
        if ($User->getStatus() == "BLACKLISTED") return false;
        if ($User->getActionKey() != $key) return false;
        return true;
    }

    /**
     * @param $language
     * @return Response
     * @throws UserFriendlyException
     * @execution(index="change-language",isAjax="false")
     */
    public function changeLanguage($language)
    {
        if (!strlen($language)) throw new UserFriendlyException("", "");
        $Languages = Translator::getLanguages();
        if (!$Languages->indexExists($language)) throw new UserFriendlyException("", "");
        Session::put(Translator::getSessionIndex(), $language);
        return new Response(array("status" => true));
    }
}