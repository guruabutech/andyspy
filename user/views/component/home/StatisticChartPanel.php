<?php

/**
 * Created by PhpStorm.
 * User: Nk-concept
 * Date: 22/07/2017
 * Time: 13:52
 */
class StatisticChartPanel extends IComponents
{
    static function getContent(Row $data = null)
    {
        ?>
        <section class="card">
            <header class="card-header">
                <? echo Translator::getString("chart"); ?>
            </header>
            <div class="card-block">
                <div id="combination-chart"></div>
            </div>
        </section>
        <?
    }

    static function getJs(Row $data = null)
    {

        ?>
        <script>
            $(document).ready(function () {
                var combinationChart = c3.generate({
                    bindto: '#combination-chart',
                    data: {
                        columns: [
                            <?
                            echo implode(",", $data->toArrayByFunction(function (Column $column) {
                                return "['{$column->getIndex()}',{$column->getValue()}]";
                            }));
                            ?>
                        ],
                        type: 'line'
                    }
                });
            });
        </script>
        <?
    }
}