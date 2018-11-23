<!DOCTYPE html>
<html lang="en">
<#include "header.ftl">

<body class="fix-header fix-sidebar">

        <!-- Page wrapper  -->
        <div class="page-wrapper">
            <!-- Bread crumb -->
            <div class="row page-titles">
                <div class="col-md-5 align-self-center">
                    <h3 class="text-primary">Planos</h3> </div>
                
                
            </div>
            <!-- End Bread crumb -->
            <!-- Container fluid  -->
            <div class="container-fluid">
                <!-- Start Page Content -->
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="card-content">
                                    <!-- Left sidebar -->
                                    <div class="inbox-leftbar">

                                      <h2>Practicas</h2>
                                        <div class="mail-list mt-4">
                                            <#list practicas as practica>
                                            <a href="#" class="list-group-item border-0"><i class="mdi mdi-file-document-box font-18 align-middle mr-2"></i><b>${practica.getName()}</b></a>
                                             </#list>
                                        </div>

                                       

                                    </div>
                                    <!-- End Left sidebar -->
                                    <div class="inbox-rightbar">

                                       

                                        <div class="mt-4">
                                            <h5>Práctica #2: Medición con cinta</h5>

                                            <hr/>


                                            <p><img src="/images/plano.jpg"><img></p>
                                      

                                            <hr/>

                                        
                                        </div>
                                        <!-- card-box -->

                                   

                                      

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End PAge Content -->
            </div>
            <!-- End Container fluid  -->
            <!-- footer -->
            <!-- End footer -->
        </div>
        <!-- End Page wrapper  -->
    </div>
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

</body>

</html>