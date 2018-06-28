<?php

/**
 * Created by PhpStorm.
 * User: Nk-concept
 * Date: 22/07/2017
 * Time: 01:09
 */
abstract class UnloggedPageModel extends IPageModel
{
    public function printHead()
    {
        ?>
        <head lang="en">
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
            <meta http-equiv="x-ua-compatible" content="ie=edge">
            <title><? static::printTitle(); ?></title>

            <script src="assets/js/lib/jquery/jquery.min.js"></script>
            <script src="assets/js/lib/audiojs/audio.min.js"></script>
            <? static::printCss(); ?>
        </head>
        <?
    }

    public function printBody()
    {
        ?>
        <body>

        <div class="page-center">
            <div class="page-center-in">
                <div class="container-fluid">
                    <? static::printContent(); ?>
                </div>
            </div>
        </div>

        <? static::printJs(); ?>

        </body>
        <?
    }

    public function printCss()
    {
        ?>
        <link href="assets/img/favicon.144x144.png" rel="apple-touch-icon" type="image/png" sizes="144x144">
        <link href="assets/img/favicon.114x114.png" rel="apple-touch-icon" type="image/png" sizes="114x114">
        <link href="assets/img/favicon.72x72.png" rel="apple-touch-icon" type="image/png" sizes="72x72">
        <link href="assets/img/favicon.57x57.png" rel="apple-touch-icon" type="image/png">
        <link href="assets/img/favicon.png" rel="icon" type="image/png">
        <link href="assets/img/favicon.ico" rel="shortcut icon">

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <link rel="stylesheet" href="assets/css/separate/pages/login.min.css">
        <link rel="stylesheet" href="assets/css/lib/font-awesome/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/lib/bootstrap/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/separate/pages/chat.min.css">
        <link rel="stylesheet" href="assets/css/separate/pages/messenger.min.css">
        <link rel="stylesheet" href="assets/css/lib/bootstrap-sweetalert/sweetalert.css">
        <link rel="stylesheet" href="assets/css/separate/vendor/sweet-alert-animations.min.css">
        <link href="assets/css/lib/charts-c3js/c3.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="assets/css/main.css">
        <?
    }

    public function printJs()
    {
        ?>
        <script src="assets/js/custom.js"></script>
        <script src="assets/js/lib/form/jquery.form.min.js"></script>
        <script src="assets/js/lib/tether/tether.min.js"></script>
        <script src="assets/js/lib/charts-c3js/c3.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
        <script src="assets/js/lib/bootstrap-sweetalert/sweetalert.min.js"></script>
        <script src="assets/js/lib/d3/d3.min.js"></script>
        <script src="assets/js/plugins.js"></script>
        <script type="text/javascript" src="assets/js/lib/match-height/jquery.matchHeight.min.js"></script>
        <script>
            $(function () {
                $('.page-center').matchHeight({
                    target: $('html')
                });

                $(window).resize(function () {
                    setTimeout(function () {
                        $('.page-center').matchHeight({remove: true});
                        $('.page-center').matchHeight({
                            target: $('html')
                        });
                    }, 100);
                });
            });
        </script>
        <script src="assets/js/app.js"></script>
        <?
    }

    public function display()
    {
        if (Visitor::isLogged()) header("Location:" . Home::getUrl());
        ?>
        <!DOCTYPE html>
        <html>
        <?
        static::printHead();
        static::printBody();
        ?>
        </html>
        <?
    }
}