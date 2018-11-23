<#include "header.ftl">

        <div class="page-wrapper">
            <!-- Bread crumb -->
            <div class="row page-titles">
                <div class="col-md-5 align-self-center">
                    <h3 class="text-primary">Información Relevante</h3> </div>

            </div>
            <!-- End Bread crumb -->
            <!-- Container fluid  -->
            <div class="container-fluid">

                <select class="form-control" id="ajaxselect">
                <option value="">Seleccione una pràctica..</option>
                    <#list practicas as practica>
                    <option value="${practica.getId()}">${practica.getName()}</option>
                    </#list>
                </select>


                <div class="row">
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-title">
                                <h4>Actividad por usuario </h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">

                                    <canvas id="cambios"></canvas>
                                       </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-title">
                                <h4>Grafico del terreno </h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">

                                    <canvas id="plano"></canvas>
                                    <div class="text-right">
                                    <button id="export" onclick="exportButton()" class="btn btn-primary" disabled>Exportar a CSV</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                    <div class="row">
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-title">
                                <h4>Historial </h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Descripción</th>
                                                <th>Estado</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <#list practicas as practica>
                                            <tr>
                                                <td>
                                                	${practica.getId()}
                                                </td>
                                                <td>${practica.getName()}</td>
                                                <td><span class="badge badge-success">Finalizado</span></td>

                                            </tr>
                                            <#else>
                                            </#list>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-title">
                                    <h4>Conclusiones </h4>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">

                                        <div id="concl"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>


            </div>





                <!-- End PAge Content -->

        <!-- End Page wrapper  -->
    </div>

<script>

    var nombres = [];
    var frecuencias = [];
    var address;
    var estruct = {
        id: Number,
        x: Number,
        y: Number,
        deleted: Boolean
    };

    function exportButton(){

        $.ajax({
            url: '/puntos/' + address,
            error: function () {
                console.log("An error ocurred.");
            },
            success: function (data) {

                estruct = JSON.stringify(data);
                exportToCsv("puntosADibujar", estruct);

            },
            type: 'GET'
        });

    }

    $('#ajaxselect').on('change',function(){

        $('#export').prop('disabled',false);
        address = $(this).val();
        $.ajax({
            url: '/practica/'+address,
            error: function () {
                console.log("An error ocurred.");
            },
            success: function (data) {

                $.ajax({
                    url: '/puntos/' + address,
                    error: function () {
                        console.log("An error ocurred.");
                    },
                    success: function (data) {

                        var x = new Chart(document.getElementById("plano"), {

                            type: 'scatter',
                            data: {
                                datasets: [{
                                    data: [{
                                        x: 1,
                                        y: 1
                                    }, {
                                        x: 3,
                                        y: 7
                                    }, {
                                        x: 6,
                                        y: 5
                                    }, { // add same data as the first one, to draw the closing line
                                        x: 1,
                                        y: 1
                                    }],
                                    borderColor: 'black',
                                    borderWidth: 1,
                                    pointBackgroundColor: ['#000', '#00bcd6', '#d300d6'],
                                    pointBorderColor: ['#000', '#00bcd6', '#d300d6'],
                                    pointRadius: 5,
                                    pointHoverRadius: 5,
                                    fill: false,
                                    tension: 0,
                                    showLine: true
                                }]
                            },
                            options: {
                                legend: false,
                                tooltips: false,
                                scales: {
                                    xAxes: [{
                                        ticks: {
                                            min: 0,
                                            max: 10
                                        },
                                        gridLines: {
                                            color: '#888',
                                            drawOnChartArea: false
                                        }
                                    }],
                                    yAxes: [{
                                        ticks: {
                                            min: 0,
                                            max: 8,
                                            padding: 10
                                        },
                                        gridLines: {
                                            color: '#888',
                                            drawOnChartArea: false
                                        }
                                    }]
                                }
                            }

                           });
                    },
                    type: 'GET'
                });

                document.getElementById('concl').innerHTML = data["conclusion"];
                $.ajax({
                    url: '/nombres/'+address,
                    error: function () {
                        console.log("An error ocurred.");
                    },
                    success: function (data) {
                            nombres = data;
                            frecuencias =[];

                        $.ajax({
                            url: '/frecuencia/'+address,
                            error: function () {
                                console.log("An error ocurred.");
                            },
                            success: function (data) {
                                for(var i=0; i<nombres.length; i++){
                                    frecuencias.push(data[nombres[i]]);}

                                new Chart(document.getElementById("cambios"), {
                                    type: 'bar',
                                    data: {
                                        labels: nombres,
                                        datasets: [

                                            {
                                                label: "Distancias",
                                                backgroundColor: ["#3e95cd"],
                                                data: frecuencias
                                            },
                                            {
                                                label: "Ángulos",
                                                backgroundColor: '#D6E9C6',
                                                data: [1]
                                            }
                                        ]
                                    },
                                    options: {
                                        legend: { display: false },
                                        title: {
                                            display: false,
                                            text: 'Predicted world population (millions) in 2050'
                                        },
                                        scales: {
                                            xAxes: [{
                                                ticks: {
                                                    min: 0,
                                                    max: 10,

                                                },
                                                stacked: true,
                                                gridLines: {
                                                    color: '#888',
                                                    drawOnChartArea: false
                                                }
                                            }],
                                            yAxes: [{
                                                ticks: {
                                                    min: 0,
                                                    max: 50,

                                                    padding: 5
                                                },
                                                stacked: true,
                                                gridLines: {
                                                    color: '#888',
                                                    drawOnChartArea: false
                                                }
                                            }]
                                        }
                                    }
                                });


                            },
                            type: 'GET'
                        });




                    },
                    type: 'GET'
                });




            },
            type: 'GET'
        });

        });



    function exportToCsv(filename, rows) {
        var processRow = function (row) {
            var finalVal = '';
            for (var j = 0; j < row.length; j++) {
                var innerValue = row[j] === null ? '' : row[j].toString();
                if (row[j] instanceof Date) {
                    innerValue = row[j].toLocaleString();
                };
                var result = innerValue.replace(/"/g, '""');
                if (result.search(/("|,|\n)/g) >= 0)
                    result = '"' + result + '"';
                if (j > 0)
                    finalVal += ',';
                finalVal += result;
            }
            return finalVal + '\n';
        };

        var csvFile = '';
        for (var i = 0; i < rows.length; i++) {
            csvFile += processRow(rows[i]);
        }

        var blob = new Blob([csvFile], { type: 'text/csv;charset=utf-8;' });
        if (navigator.msSaveBlob) { // IE 10+
            navigator.msSaveBlob(blob, filename);
        } else {
            var link = document.createElement("a");
            if (link.download !== undefined) { // feature detection
                // Browsers that support HTML5 download attribute
                var url = URL.createObjectURL(blob);
                link.setAttribute("href", url);
                link.setAttribute("download", filename);
                link.style.visibility = 'hidden';
                document.body.appendChild(link);
                link.click();
                document.body.removeChild(link);
            }
        }
    }

</script>
