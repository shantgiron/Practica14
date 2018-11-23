<!DOCTYPE html>
<html lang="en">

<#include "header.ftl">
       <div class="page-wrapper">
            <!-- Bread crumb -->
            <div class="row page-titles">
                <div class="col-md-5 align-self-center">
                    <h3 class="text-primary">Visor de Prácticas</h3> </div>
                
            </div>
            <!-- End Bread crumb -->
            <!-- Container fluid  -->
            <div class="container-fluid">
                <!-- Start Page Content -->
                <div class="row">
                    <#list practicas as practica>
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-title">
                                <h4>${practica.getName()} </h4>

                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Área</th>
                                                <th>Fecha de realización</th>
                                                </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>${practica.getArea()}</td>
                                                <td>${practica.getFechaCreacion()}</td>
                                                  </tr>

                                          
                                        </tbody>
                                    </table>
                                </div>
                                
                              </div>

                         <a href="/practicas/ver/${practica.getId()}"><i class = "fa fa-eye">Visualizar</i></a>
                            
                        </div>
                    </div>
                    </#list>
                    <!-- /# column -->
                </div>
                <!-- /# row -->
                <!-- End PAge Content -->
            </div>
            <!-- End Container fluid  -->
            <!-- footer -->
            <!-- End footer -->
        </div>
        <!-- End Page wrapper  -->

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



</html>