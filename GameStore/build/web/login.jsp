<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://unpkg.com/bs-brain@2.0.4/components/logins/login-12/assets/css/login-12.css">
    </head>
    <body>
        <!-- Login 12 - Bootstrap Brain Component -->
        <section class="py-3 py-md-5 py-xl-8">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="mb-5">
                            <h2 class="display-5 fw-bold text-center" style="color: rgb(247, 68, 78)">Login to Game Store</h2>
                        </div> 
                    </div>
                </div>  
                <div class="row justify-content-center">
                    <div class="col-12 col-lg-10 col-xl-8">
                        <div class="row gy-5 justify-content-center">
                            <div class="col-12 col-lg-5">
                                <form id="loginForm" action="MainController" method="POST">
                                    <div class="row gy-3 overflow-hidden">
                                        <div class="col-12">
                                            <div class="form-floating mb-3">
                                                <input type="text" class="form-control border-0 border-bottom rounded-0" name="userName" id="userName" placeholder="" required>
                                                <label for="userName" class="form-label">User Name</label>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-floating mb-3">
                                                <input type="password" class="form-control border-0 border-bottom rounded-0" name="password" id="password" placeholder="Password" required>
                                                <label for="password" class="form-label">Password</label>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="d-grid">
                                                <div class="g-recaptcha" data-sitekey="6LfCdAgqAAAAACBnC_Nbbu7El5u_yG-LbiAdAXWq"></div>
                                                <div id="error"></div>
                                                <button type="submit" class="btn btn-lg rounded-0 fs-6" value="Submit" style="background-color: rgb(247, 68, 78)">Login</button>
                                                <input value="Login" name="action" hidden=""/>
                                            </div>
                                            <a href="https://accounts.google.com/o/oauth2/auth?scope=profile email&redirect_uri=http://localhost:8084/GameStore/LoginGoogleServlet&response_type=code&client_id=23148986973-rojeq90dpkvihfkntvt6tg7r208qh1ob.apps.googleusercontent.com&approval_prompt=force" class="btn bsb-btn-2xl btn-outline-dark rounded-0 d-flex align-items-center">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-google text-danger" viewBox="0 0 16 16">
                                                <path d="M15.545 6.558a9.42 9.42 0 0 1 .139 1.626c0 2.434-.87 4.492-2.384 5.885h.002C11.978 15.292 10.158 16 8 16A8 8 0 1 1 8 0a7.689 7.689 0 0 1 5.352 2.082l-2.284 2.284A4.347 4.347 0 0 0 8 3.166c-2.087 0-3.86 1.408-4.492 3.304a4.792 4.792 0 0 0 0 3.063h.003c.635 1.893 2.405 3.301 4.492 3.301 1.078 0 2.004-.276 2.722-.764h-.003a3.702 3.702 0 0 0 1.599-2.431H8v-3.08h7.545z" />
                                                </svg>
                                                <span class="ms-2 fs-6 flex-grow-1">Continue with Google</span>
                                            </a>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="mb-5">
                            <p class="text-center m-0">Don't have an account? <a href="register.jsp">Register</a></p>
                        </div> 
                    </div>
                </div>
                ${requestScope.USER_ERROR}
            </div>
        </section>
        <!-- reCAPTCHA V2 -->
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const form = document.getElementById("loginForm");
                const error = document.getElementById("error");

                form.addEventListener("submit", function (event) {
                    const response = grecaptcha.getResponse();
                    if (response.length === 0) {
                        // reCAPTCHA not completed
                        event.preventDefault(); // Prevent form submission
                        error.innerHTML = "Please complete the reCAPTCHA.";
                    } else {
                        // reCAPTCHA completed
                        error.innerHTML = ""; // Clear any previous error messages
                    }
                });
            });
        </script>
    </body>
</html>