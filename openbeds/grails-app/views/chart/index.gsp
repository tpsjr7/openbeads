<%--
  Created by IntelliJ IDEA.
  User: tedsandersjr
  Date: 10/23/16
  Time: 8:13 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>
<body>
<div id="chart_div"></div>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
    google.charts.load('current', {packages: ['corechart', 'bar']});
    google.charts.setOnLoadCallback(drawBasic);

    function drawBasic() {

        var data = google.visualization.arrayToDataTable([
            ['Day Of Month', 'Fill Hour Of Day'],
            [1,            10, ],
            [2,            11, ],
            [3,            8, ],
            [4,            9, ],
            [5,            9, ],
            [6,            7, ],
            [7,            7, ],
            [8,            6.5, ],
            [9,            7.5, ],
            [10,            8, ],
            [11,            9, ],
            [12,            9, ],
            [13,            10, ],
            [14,            10.5, ],
            [15,            7, ],
            [16,            7.5, ],
            [17,            8, ],
            [18,            9, ],
            [19,            8, ],
            [20,            7, ],
            [21,            7, ],
            [22,            8, ],
            [23,            8, ],
            [24,            9, ],
            [25,            8.5, ],
            [26,            7, ],
            [27,            7.5, ],
            [28,            8, ],
            [29,            9, ],
            [30,            7, ],
            [31,            7.5, ],
        ]);


        var options = {
            title: 'Shelter Full Ocupancy Times',
            hAxis: {
                title: 'Day of Month',
                // format: 'd',
                vviewWindow: {
                    min: [1, 30, 0],
                    max: [14, 30, 0]
                }
            },
            vAxis: {
                title: 'Fill Time',
            }
        };

        //options = {};

        var chart = new google.visualization.ColumnChart(
                document.getElementById('chart_div'));

        chart.draw(data, options);
    }
</script>


</body>
</html>