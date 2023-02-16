<html lang="es">
<head>
    <title>WIAMbook</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&amp;display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/style.css">
    <script defer="" referrerpolicy="origin"
            src="/cdn-cgi/zaraz/s.js?z=JTdCJTIyZXhlY3V0ZWQlMjIlM0ElNUIlNUQlMkMlMjJ0JTIyJTNBJTIyTG9naW4lMjAxMCUyMiUyQyUyMnglMjIlM0EwLjA2OTY2NDQ2ODUxMDY5NzA4JTJDJTIydyUyMiUzQTE5MjAlMkMlMjJoJTIyJTNBMTA4MCUyQyUyMmolMjIlM0E5MzclMkMlMjJlJTIyJTNBMTkyMCUyQyUyMmwlMjIlM0ElMjJodHRwcyUzQSUyRiUyRnByZXZpZXcuY29sb3JsaWIuY29tJTJGdGhlbWUlMkZib290c3RyYXAlMkZsb2dpbi1mb3JtLTIwJTJGJTIyJTJDJTIyciUyMiUzQSUyMmh0dHBzJTNBJTJGJTJGY29sb3JsaWIuY29tJTJGJTIyJTJDJTIyayUyMiUzQTI0JTJDJTIybiUyMiUzQSUyMlVURi04JTIyJTJDJTIybyUyMiUzQS02MCUyQyUyMnElMjIlM0ElNUIlNUQlN0Q="></script>
    <script nonce="d035a40d-a22c-4675-9b39-2f5785269d3e">(function (w, d) {
        !function (f, g, h, i) {
            f[h] = f[h] || {};
            f[h].executed = [];
            f.zaraz = {deferred: [], listeners: []};
            f.zaraz.q = [];
            f.zaraz._f = function (j) {
                return function () {
                    var k = Array.prototype.slice.call(arguments);
                    f.zaraz.q.push({m: j, a: k})
                }
            };
            for (const l of ["track", "set", "debug"]) f.zaraz[l] = f.zaraz._f(l);
            f.zaraz.init = () => {
                var m = g.getElementsByTagName(i)[0], n = g.createElement(i), o = g.getElementsByTagName("title")[0];
                o && (f[h].t = g.getElementsByTagName("title")[0].text);
                f[h].x = Math.random();
                f[h].w = f.screen.width;
                f[h].h = f.screen.height;
                f[h].j = f.innerHeight;
                f[h].e = f.innerWidth;
                f[h].l = f.location.href;
                f[h].r = g.referrer;
                f[h].k = f.screen.colorDepth;
                f[h].n = g.characterSet;
                f[h].o = (new Date).getTimezoneOffset();
                if (f.dataLayer) for (const s of Object.entries(Object.entries(dataLayer).reduce(((t, u) => ({...t[1], ...u[1]}))))) zaraz.set(s[0], s[1], {scope: "page"});
                f[h].q = [];
                for (; f.zaraz.q.length;) {
                    const v = f.zaraz.q.shift();
                    f[h].q.push(v)
                }
                n.defer = !0;
                for (const w of [localStorage, sessionStorage]) Object.keys(w || {}).filter((y => y.startsWith("_zaraz_"))).forEach((x => {
                    try {
                        f[h]["z_" + x.slice(7)] = JSON.parse(w.getItem(x))
                    } catch {
                        f[h]["z_" + x.slice(7)] = w.getItem(x)
                    }
                }));
                n.referrerPolicy = "origin";
                n.src = "/cdn-cgi/zaraz/s.js?z=" + btoa(encodeURIComponent(JSON.stringify(f[h])));
                m.parentNode.insertBefore(n, m)
            };
            ["complete", "interactive"].includes(g.readyState) ? zaraz.init() : f.addEventListener("DOMContentLoaded", zaraz.init)
        }(w, d, "zarazData", "script");
    })(window, document);</script>

    <%
        String error = request.getAttribute("error") != null ? (String) request.getAttribute("error") : "";
    %>
    <style>
        .form-control {
            color: white !important;
            border: none;
            border: 1px solid transparent;
        }
        .form-control::placeholder {
            color: #6c757d;
            opacity: 1; }
        .form-control::-webkit-input-placeholder {
                             color: #6c757d;
                             opacity: 1; }
        .form-control:-ms-input-placeholder {
            color: #6c757d;
            opacity: 1; }
        .form-control::-ms-input-placeholder {
            color: #6c757d;
            opacity: 1; }
        .form-control::-webkit-input-placeholder {
            /* Chrome/Opera/Safari */
            color: rgba(255, 255, 255, 0.8) !important; }
        .form-control::-moz-placeholder {
            /* Firefox 19+ */
            color: rgba(255, 255, 255, 0.8) !important; }
        .form-control:-ms-input-placeholder {
            /* IE 10+ */
            color: rgba(255, 255, 255, 0.8) !important; }
        .form-control:-moz-placeholder {
            /* Firefox 18- */
            color: rgba(255, 255, 255, 0.8) !important; }
    </style>
</head>
<body class="img js-fullheight"
      style="background-image: url(https://preview.colorlib.com/theme/bootstrap/login-form-20/images/bg.jpg.webp); height: 937px;">
<section class="ftco-section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 text-center mb-5">
                <h2 class="heading-section">WIAMbook Login</h2>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-4">
                <div class="login-wrap p-0">
                    <h3 class="mb-4 text-center">Accede a tu cuenta:</h3>
                    <%if (!error.equals("")) {%>
                        <div class="alert alert-danger" role="alert">
                            <%=error%>
                        </div>
                    <%}%>
                    <form action="home" class="signin-form" method="GET">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Username" name="usu" required="">
                        </div>
                        <div class="form-group">
                            <input id="password-field" type="password" class="form-control" placeholder="Password"
                                   name="pass" required="">
                            <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="form-control btn btn-primary submit px-3">Sign In</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
</section>
<script src="js/jquery.min.js"></script>
<script src="js/popper.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/main.js"></script>
<script defer=""
        src="https://static.cloudflareinsights.com/beacon.min.js/vaafb692b2aea4879b33c060e79fe94621666317369993"
        integrity="sha512-0ahDYl866UMhKuYcW078ScMalXqtFJggm7TmlUtp0UlD4eQk0Ixfnm5ykXKvGJNFjLMoortdseTfsRT8oCfgGA=="
        data-cf-beacon="{&quot;rayId&quot;:&quot;79a18bd27e3669c5&quot;,&quot;token&quot;:&quot;cd0b4b3a733644fc843ef0b185f98241&quot;,&quot;version&quot;:&quot;2023.2.0&quot;,&quot;si&quot;:100}"
        crossorigin="anonymous"></script>


</body>
</html>