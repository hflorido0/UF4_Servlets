<html lang="es">
    <head>
        <meta charset="ISO-8859-1">
        <title>WIAMbook</title>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&amp;display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <style>
        body {
            background-image: url(https://preview.colorlib.com/theme/bootstrap/login-form-20/images/bg.jpg.webp);
            height: 937px;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }
        body:after {
            background: none;
        }
        .form-control {
            color: black !important;
        }
    </style>
    <body>
        <div class="container py-5 h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col col-xl-10">

                    <form action="comment" method="post">
                        <div class="card mb-5" style="border-radius: 15px;">
                            <div class="card-body p-4">
                                <h3 class="mb-3"><input class="form-control" type="text" name="titol" placeholder="Título del post"></h3>
                                <h3 class="mb-3"><input class="form-control" type="text" name="missatge" placeholder="Redacta el mensaje..."></h3>
                                <h3 class="mb-3"><input class="form-control" type="text" name="url" placeholder="Pega la url de la imagen"></h3>
                            </div>
                        </div>
                    </form>

                    <% for (int i = 0; i < 10; i++) {%>
                        <div class="card mb-5" style="border-radius: 15px;">
                            <div class="card-body p-4">
                                <h3 class="mb-3">Program Title</h3>
                                <p class="small mb-0"><i class="far fa-star fa-lg"></i> <span class="mx-2">|</span> Created by
                                    <strong>MDBootstrap</strong> on 11 April , 2021</p>
                                <hr class="my-4">
                                <div class="d-flex justify-content-start align-items-center">
                                    <p class="mb-0 text-uppercase"><i class="fas fa-cog me-2"></i> <span
                                            class="text-muted small">settings</span></p>
                                    <p class="mb-0 text-uppercase"><i class="fas fa-link ms-4 me-2"></i> <span
                                            class="text-muted small">program link</span></p>
                                    <p class="mb-0 text-uppercase"><i class="fas fa-ellipsis-h ms-4 me-2"></i> <span
                                            class="text-muted small">program link</span>
                                        <span class="ms-3 me-4">|</span></p>
                                    <a href="#!">
                                        <img src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/avatar-2.webp" alt="avatar"
                                             class="img-fluid rounded-circle me-3" width="35">
                                    </a>
                                    <button type="button" class="btn btn-outline-dark btn-sm btn-floating">
                                        <i class="fas fa-plus"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    <% } %>
                </div>
            </div>
        </div>
    </body>
</html>