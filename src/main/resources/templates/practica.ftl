<!DOCTYPE html>
<html lang="en">

<#include "header.ftl">

        <!-- Page wrapper  -->
        <div class="page-wrapper">
            <!-- Bread crumb -->
            <div class="row page-titles">
                    <h3 class="text-primary">${practica.getName()}</h3> </div>
            
            <!-- End Bread crumb -->
            <!-- Container fluid  -->
            <div class="container-fluid">
                <!-- Start Page Content -->
                
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Tabla de toma de datos</h4>
                                <hr>
                                <h6 class="card-subtitle">${practica.getLevantamiento().getTipo()}</h6>
                                <#if practica.getLevantamiento().getTipo() == "Cinta">
                                  <div class="table-responsive m-t-40">
                                      <table id="medidas" class="table table-bordered">
                                          <thead>
                                          <tr>
                                              <th>Distancia</th>
                                              <th>Angulos</th>
                                          <tbody>

                                          <tr>

                                          </tr>
                                          </tbody>
                                      </table>
                                  </div>
                                <#elseif practica.getLevantamiento().getTipo() == "Cinta y Brujula">
                                  <div class="table-responsive m-t-40">
                                      <table id="myTable" class="table table-bordered">
                                          <thead>
                                          <tr>
                                              <th>Distancia</th>
                                              <th>Angulos</th>
                                          </tr>
                                          </thead>
                                          <tbody>
                                          <tr>
                                              <td>158m</td>
                                              <td>50 00' 00"</td>
                                          </tr>

                                          </tbody>
                                      </table>
                                  </div>
                                <#elseif practica.getLevantamiento().getTipo() == "Radiacion">
                                <div class="table-responsive m-t-40">
                                    <table id="myTable" class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th>Estación</th>
                                            <th>Eje</th>
                                            <th>Distancia</th>
                                            <th>Azimut</th>
                                            <th>Observación</th>

                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>o</td>
                                            <td>Norte</td>
                                            <td> </td>
                                            <td>00 00'00"</td>
                                            <td> </td>
                                        </tr>

                                        </tbody>
                                    </table>
                                </div>
                                <#elseif practica.getLevantamiento().getTipo() == "Intereseccion de Visuales">
                                <div class="table-responsive m-t-40">
                                    <table id="myTable" class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th>Estación</th>
                                            <th>Eje</th>
                                            <th>Distancia</th>
                                            <th>Angulo</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>o</td>
                                            <td>Norte</td>
                                            <td> </td>
                                            <td>00 00'00"</td>
                                        </tr>

                                        </tbody>
                                    </table>
                                </div>
                                <#elseif practica.getLevantamiento().getTipo() == "Poligonos">
                                <div class="table-responsive m-t-40">
                                    <table id="myTable" class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th>Estación</th>
                                            <th>Eje</th>
                                            <th>Distancia</th>
                                            <th>Angulos</th>
                                            <th>Azimut</th>
                                            <th>Observación</th>

                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>o</td>
                                            <td>Norte</td>
                                            <td> </td>
                                            <td>00 00'00"</td>
                                            <td>00 00'00"</td>
                                            <td> </td>
                                        </tr>

                                        </tbody>
                                    </table>
                                </div>
                                </#if>
                            </div>
                        </div>





                <div id="planos" class="card">
                    <div class="card-body">

                        <form method="post" enctype='multipart/form-data' action="/practicas/subirplano/${practica.getId()}">
                            <h4 class="card-title">Plano</h4>
                            <hr>
                            <input type="file" id="subirplano" name="subirplano" accept="image/png, image/jpeg" class="form-control-file" style="opacity: 0">

                            <div class="text-right"><a href="javascript:void(0)" onclick="editarPlano()" class="fa fa-pencil ">Editar</a>
                           <a href="/practicas/eliminarPlano/${practica.getId()}" class="fa fa-eraser ">Eliminar</a></div>

                        <#if practica.getPlano()??>
                         <img src="data:image/jpeg;base64, ${practica.getPlano()}" class="img-fluid">
                            <#else>No hay planos adjuntos a esta práctica.
                        </#if>
                                   <div class="text-right">
                            <button id="botonplano" name="botonplano" class="btn btn btn-primary waves-effect waves-light w-md m-b-30" disabled>Guardar</button></div>




                        </form>
                    </div>

                </div>

                <div id="conclusiones" class="card">
                    <div class="card-body">
                        <h4 class="card-title ">Conclusiones</h4>
                        <hr>
                              <form method="POST" action="/practicas/subirconclusion/${practica.getId()}">
                                  <div class="text-right"><a href="javascript:void(0)" onclick="editarConclusion()" class="fa fa-pencil ">Editar</a>
                                      <a href="/practicas/eliminarConclusion/${practica.getId()}" class="fa fa-eraser">Eliminar</a></div>
                                  <textarea rows="4" cols="50" id="conclusiones_text" name="conclusiones_text" placeholder="No hay conclusiones en esta práctica" class="form-control" readonly><#if practica.getConclusion()??>${practica.getConclusion()}<#else></#if></textarea>
                            <br>
                                    <div class="text-right">
                            <button type="submit" id="botonconclusion" class="btn btn-primary waves-effect waves-light w-md m-b-30" disabled>Guardar</button>
                                </div>
                        </form>


                </div>
                </div>



                <div id="brigada" class="card">
                    <div class="card-body">
                        <h4 class="card-title ">Brigada</h4>
                        <hr>
                            <#list practica.getIntegrantes() as integrante>
                                <div class="form-inline">
                                    <div class="form-inline">
                                ${integrante.getNombre()}
                                        <div class="text-right">
                                            <form method="post" action="/practicas/eliminarIntegrante/${practica.getId()}/${integrante.getUsername()}/">
                                                <button type="submit" class="fa fa-close"></button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </#list>

                            <br>

                        <form method="POST" action="/practicas/invitar/${practica.getId()}/">
                            <div class="text-right"><a href="javascript:void(0)" onclick="editarBrigada()" class="fa fa-pencil ">Invitar</a>
                            <input type="text" id="invitar" name="invitar"  class="form-control">

                            <div class="text-right">
                                <button type="submit" id="botonbrigada" class="btn btn-primary waves-effect waves-light w-md m-b-30" disabled>Guardar</button>
                            </div>
                        </form>


                    </div>
                </div>


                <!-- End PAge Content -->
            </div>
            <!-- End Container fluid  -->
            <!-- footer -->
             <!-- End footer -->
        </div>
        <!-- End Page wrapper  -->
    
    <!-- End Wrapper -->
    <!-- All Jquery -->
    <script src="/js/lib/jquery/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="/js/lib/bootstrap/js/popper.min.js"></script>
    <script src="/js/lib/bootstrap/js/bootstrap.min.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="/js/jquery.slimscroll.js"></script>
    <!--Menu sidebar -->
    <script src="/js/sidebarmenu.js"></script>
    <!--stickey kit -->
    <script src="/js/lib/sticky-kit-master/dist/sticky-kit.min.js"></script>
    <!--Custom JavaScript -->
    <script src="/js/scripts.js"></script>


    <script src="/js/lib/datatables/datatables.min.js"></script>
    <script src="/js/lib/datatables/cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js"></script>
    <script src="/js/lib/datatables/cdn.datatables.net/buttons/1.2.2/js/buttons.flash.min.js"></script>
    <script src="/js/lib/datatables/cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
    <script src="/js/lib/datatables/cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
    <script src="/js/lib/datatables/cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>
    <script src="/js/lib/datatables/cdn.datatables.net/buttons/1.2.2/js/buttons.html5.min.js"></script>
    <script src="/js/lib/datatables/cdn.datatables.net/buttons/1.2.2/js/buttons.print.min.js"></script>
    <script src="/js/lib/datatables/datatables-init.js"></script>


</body>



<script>
    function cargar() {
        var distancias = []
        var angulos = []
    <#list distancias as distancia>
            distancias.push(${distancia.getValor()})
        </#list>
      <#list angulos as angulo>
            angulos.push(${angulo.getValor()})
      </#list>


        var markup = "";
        for (var i = 0; i < Math.max(distancias.length,angulos.length); i++) {
           if(i+1 > distancias.length){
            markup += "<tr><td></td><td>" + angulos[i] + "</td></tr>";
               }
               else if(i+1 > angulos.length){
               markup += "<tr><td>"+ distancias[i] +"</td><td></td></tr>";
           }

           else{


               markup += "<tr><td>"+ distancias[i] +"</td><td>"+angulos[i]+"</td></tr>";
           }


           }

        $("#medidas tbody").html(markup);
    }

    $(function() {
        cargar();
    });

    function editarConclusion(){
        $('#conclusiones_text').prop('readonly',false)


        $('#botonconclusion').prop('disabled',false)
    }

    function editarBrigada(){
        $('#invitar').prop('readonly',false)


        $('#botonbrigada').prop('disabled',false)
    }

    function editarPlano(){
        document.getElementById('subirplano').style.opacity = "1.0";
        $('#botonplano').prop('disabled',false)
    }
</script>

</html>