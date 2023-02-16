<%@ page import="model.Post" %>
<%@ page import="java.util.ArrayList" %>
<html lang="es">
    <head>
        <title>WIAMbook</title>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&amp;display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.0.0/css/all.css">
        <%
            String id = (String) request.getAttribute("id");
            ArrayList<Post> posts = (ArrayList<Post>) request.getAttribute("posts");
        %>
    </head>
    <style>
        body {
            background-image: url(https://preview.colorlib.com/theme/bootstrap/login-form-20/images/bg.jpg.webp);
            height: 937px;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
        }
        body:after {
            background: none;
        }
        .form-control {
            color: black !important;
        }
        img{
            max-width:600px;
        }
        .cover {
            /* Image is scaled to fill the container. */
            /* Aspect ratio IS maintained */
            object-fit: cover;
        }
        .center {
            display: block;
            margin-left: auto;
            margin-right: auto;
        }
        .right {
            display: block;
            margin-left: auto;
            margin-right: 10px;
            margin-top: 10px;
        }
        .floating {
            position: absolute;
            right: 10%;
        }
    </style>
    <body>
        <div class="container py-5 h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col col-xl-10">

                    <form action="comment" method="post" enctype="multipart/form-data">
                        <div class="card mb-5" style="border-radius: 15px;">
                            <div class="card-body p-4">
                                <input hidden class="form-control" type="text" name="id" value="<%=id%>">
                                <input class="form-control" type="text" name="titol" placeholder="Titulo del post">
                                <br/>
                                <input class="form-control" type="text" name="missatge" placeholder="Redacta el mensaje...">
                                <br/>
                                <!--<h3 class="mb-3"><input class="form-control" type="text" name="url" placeholder="Pega la url de la imagen"></h3>-->
                                <input class="form-control form-control-sm" type="file" name="image" style="border-color: rgba(255, 255, 255, 0.4);">
                                <br/>
                                <input type="submit" class="btn btn-success btn-lg btn-block">
                            </div>
                        </div>
                    </form>

                    <% for (Post p : posts) {%>
                        <div class="card mb-5" style="border-radius: 15px;">
                            <%if (id.equals(p.getUsuari().getId()+"")) {%>
                                <div class="mb-3 right">
                                    <a href="<%=p.getUsuari().getLinkedin()%>" target="_blank"> <i class="fas fa-regular fa-trash-can" style="color: red;cursor: pointer"></i></a>
                                </div>
                            <%}%>
                            <div class="card-body p-4">
                                <h3 class="mb-3"><%=p.getTitle()%></h3>
                                <img class="cover center" src="data:image/png;base64,<%=p.getFilePart()%>"  height="400">
                                <br/>
                                <p><%=p.getMissatge()%></p>
                                <hr class="my-4">
                                <div class="d-flex justify-content-start align-items-center">
                                    <i class="fas fa-bell"></i> &nbsp;&nbsp;Created by&nbsp;&nbsp;
                                    <strong><%=p.getUsuari().getUsuari()%></strong>&nbsp;&nbsp;
                                    <%=p.getData()%>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                   <a href="<%=p.getUsuari().getGitlab()%>" target="_blank"> <i class="fas fa-solid fa-code-branch"></i></a>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                   <a href="<%=p.getUsuari().getLinkedin()%>" target="_blank"> <i class="fas fa-solid fa-address-card"></i></a>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                   <a href="mailto:<%=p.getUsuari().getEmail()%>" target="_blank"> <i class="fas fa-regular fa-envelope"></i></a>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <div class="mb-3 right">
                                        <%=p.getLikes()%>&nbsp;&nbsp;<i class="fas fa-regular fa-heart" style="color: deeppink;cursor: pointer"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <% } %>
                </div>
            </div>
        </div>
    </body>
</html>