<!DOCTYPE html>
<html lang="en">

<#include "header.ftl">
        <!-- Page wrapper  -->
        <div class="page-wrapper">



            <!-- End Bread crumb -->
            <!-- Container fluid  -->
            <div class="container-fluid">
                <!-- Start Page Content -->

                        <div class="card">
                            <div class="card-body">
                                <div class="card-content">


                                      <h2>Peticiones</h2>
                                    <table class="table">
                                        <thead>
                                        <tr>
                                            <th>De</th>
                                            <th>Practica</th>
                                            <th>Opciones</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <#list peticiones as peticion>
                                            <td>${peticion.getFromUser()}</td>
                                                <td>${peticion.getPractica().getName()}</td>
                                                <td>
                                                    <div class="form-group">
                                                        <div class="button-group">
                                                          <form method="post" action="/peticiones/aceptar/${peticion.getId()}/">
                                                              <button type="submit">Aceptar</button>
                                                          </form>
                                                            <form method="post" action="/peticiones/borrar/${peticion.getId()}/">
                                                                <button type="submit">Rechazar</button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </td>
                                            </#list>
                                        </tr>


                                        </tbody>
                                    </table>
                                       

                                    </div>
                                    <!-- End Left sidebar -->

                                    </div>
                                </div>
                            </div>
                        </div>

<!-- End Wrapper -->
    <!-- All Jquery -->
    <script src="js/lib/jquery/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="js/lib/bootstrap/js/popper.min.js"></script>
    <script src="js/lib/bootstrap/js/bootstrap.min.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="js/jquery.slimscroll.js"></script>
    <!--Menu sidebar -->
    <script src="js/sidebarmenu.js"></script>
    <!--stickey kit -->
    <script src="js/lib/sticky-kit-master/dist/sticky-kit.min.js"></script>
    <!--Custom JavaScript -->
    <script src="js/scripts.js"></script>

</body>

<script>

</script>

</html>