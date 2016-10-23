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
    <script   src="https://code.jquery.com/jquery-2.2.4.min.js"   integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="   crossorigin="anonymous"></script>
</head>
<body>
<div id="chart_div"></div>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
    google.charts.load('current', {packages: ['corechart', 'bar']});
    google.charts.setOnLoadCallback(drawBasic);

    function drawBasic() {

        jQuery.get("list", function(thedata){
            var data = google.visualization.arrayToDataTable(thedata);
            var options = {
                title: 'Shelter Occupancy',
                hAxis: {
                    title: 'Occupancy',
                },
                vAxis: {
                    title: 'Count',
                }
            };

            //options = {};

            var chart = new google.visualization.ColumnChart(
                    document.getElementById('chart_div'));

            chart.draw(data, options);

        });


    }
</script>


</body>
</html>