<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="images/favicon.png">
    <title>TopogrAPP</title>
    <!-- Bootstrap Core CSS -->
    <link href="/css/lib/bootstrap/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->

    <link href="/css/lib/calendar2/semantic.ui.min.css" rel="stylesheet">
    <link href="/css/lib/calendar2/pignose.calendar.min.css" rel="stylesheet">
    <link href="/css/lib/owl.carousel.min.css" rel="stylesheet" />
    <link href="/css/lib/owl.theme.default.min.css" rel="stylesheet" />
    <link href="/css/helper.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:** -->
    <!--[if lt IE 9]>
    <script src="https:**oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https:**oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<body class="fix-header fix-sidebar">

<div class="main-wrapper">
    <div class="row">
        <div class="col-md-3">

    <div class="card p-30">

        <div class="card-body">
            <h4 class="card-title">Inicio de Sesion</h4>
<form method="post"  action="/login"">
    <li ><input type="text" name="username" id="username" class="form-control" style="width:92.5%" placeholder="Nombre de Usuario"/></li>
    <li><input type="password" name="password" id="password" class="form-control" style="width:92.5%" placeholder="Contraseña"/></li>
    <button type="submit" class="btn btn-primary btn-xs">Iniciar Sesión</button>


</form>



            </div>
    </div>
        </div>
    </div>

    <div class="row">

        <div class="col-md-3">
            <div class="card p-30">
                <div class="media">


                    <div class="media-body media-text-right">


                        <form method="post"  action="/register"">
                        <input type="text" name="username2" id="username2" class="form-control" style="width:92.5%" placeholder="Nombre de Usuario"/>
                        <input type="password" name="password2" id="password2" class="form-control" style="width:92.5%" placeholder="Contraseña"/>
                        <input type="text" name="name2" id="name2" class="form-control" style="width:92.5%" placeholder="Nombre Completo"/>
                        <input type="email" name="email2" id="email2" class="form-control" style="width:92.5%" placeholder="E-mail"/>

                        <button type="submit" class="btn btn-primary btn-xs">Registrarse</button>


                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>

</html>