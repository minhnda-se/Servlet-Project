
<%@page import="gamestore.dto.ValidData"%>
<header>
    <title>Register Page</title>
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://unpkg.com/bs-brain@2.0.4/components/registrations/registration-12/assets/css/registration-12.css">
    <link rel="stylesheet" href="./css/fix-style.css">

</header>
<section class="py-3 py-md-5 py-xl-8">
    <%
        ValidData vd = (ValidData) request.getAttribute("VALIDATION");
        boolean userNameLengthError = false;
        boolean passwordlengthError = false;
        boolean notMatchhError = false;
        boolean passwordFormatError = false;
        boolean phoneNumberFormatError = false;
        boolean phoneNumberLengthError = false;
        boolean isUserNameExisted = false;
        boolean isEmailExisted = false;
        if (vd != null) {
            userNameLengthError = vd.isUserNameLengthError();
            passwordlengthError = vd.isPasswordlengthError();
            passwordFormatError = vd.isPasswordFormatError();
            notMatchhError = vd.isNotMatchhError();
            phoneNumberFormatError = vd.isPhoneNumberFormatError();
            phoneNumberLengthError = vd.isPhoneNumberLengthError();
            isUserNameExisted = vd.isIsUserNameExisted();
            isEmailExisted = vd.isIsEmailExisted();
        }
    %>
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="mb-5">
                    <h2 class="display-5 fw-bold text-center" style="color: rgb(247, 68, 78)">Register</h2>
                </div>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-12 col-lg-10 col-xl-8">
                <div class="row gy-5 justify-content-center">
                    <div class="col-12 col-lg-5">
                        <form action="MainController" method="POST">
                            <div class="row gy-3 overflow-hidden">
                                <div class="col-12">
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control border-0 border-bottom rounded-0" name="userName" value="${param.userName}" id="lastName" placeholder="Full Name" required>
                                        <label for="userName" class="form-label">User Name <span style="color: red;">*</span></label>
                                    </div>                                
                                    <% if (isUserNameExisted) {%>
                                    <div class="error-message">
                                        User Name is Existed!
                                    </div>
                                    <% }%>
                                    <% if (userNameLengthError) {%>
                                    <div class="error-message">
                                        User Name must be from 4-20 characters!
                                    </div>
                                    <% }%>
                                </div>
                                <div class="col-12">
                                    <div class="form-floating mb-3">
                                        <input type="password" class="form-control border-0 border-bottom rounded-0" name="password" id="password" value="${param.password}" placeholder="Password" required>
                                        <label for="password" class="form-label">Password <span style="color: red;">*</span></label>
                                    </div>
                                    <% if (passwordFormatError) {%>
                                    <div class="error-message">
                                        The password must include lowercase letters, uppercase letters, numbers, and special characters!
                                    </div>
                                    <% }%>
                                    <% if (passwordlengthError) {%>
                                    <div class="error-message">
                                        The password must be more than 6 characters!
                                    </div>
                                    <% }%>
                                </div>
                                <div class="col-12">
                                    <div class="form-floating mb-3">
                                        <input type="password" class="form-control border-0 border-bottom rounded-0" name="confirm" id="confirm" value="${param.confirm}" placeholder="Confirm" required>
                                        <label for="confirm" class="form-label">Enter Password Again <span style="color: red;">*</span></label>
                                    </div>
                                    <% if (notMatchhError) {%>
                                    <div class="error-message">
                                        The confirm password does not match!
                                    </div>
                                    <% }%>
                                </div>
                                <div class="col-12">
                                    <div class="form-floating mb-3">
                                        <input type="email" class="form-control border-0 border-bottom rounded-0" name="email" id="email" placeholder="Email" value="${param.email}" required>
                                        <label for="email" class="form-label">Email <span style="color: red;">*</span></label>
                                    </div>
                                    <% if (isEmailExisted) {%>
                                    <div class="error-message">
                                        Email is Existed!
                                    </div>
                                    <% }%>
                                </div>
                                <div class="col-12">
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control border-0 border-bottom rounded-0" name="phoneNumber" id="phoneNumber" value="${param.phoneNumber}" placeholder="" required>
                                        <label for="phoneNumber" class="form-label">Phone Number <span style="color: red;">*</span></label>
                                    </div>
                                    <% if (phoneNumberFormatError) {%>
                                    <div class="error-message">
                                        The phone number must be numeric!
                                    </div>
                                    <% }%>
                                    <% if (phoneNumberLengthError) {%>
                                    <div class="error-message">
                                        The phone number must be 10 digits!
                                    </div>
                                    <% }%>
                                </div>
                                <input type="hidden" name="role" value="customer"/>
                                <div class="col-12">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" name="iAgree" id="iAgree" required>
                                        <label class="form-check-label text-secondary" for="iAgree">
                                            I agree to the <a href="#!" class="link-primary text-decoration-none">terms and conditions</a>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="d-grid">
                                        <button class="btn btn-lg rounded-0 fs-6" name="action" value="Register" style="background-color: rgb(247, 68, 78)">Register</button>
                                    </div>
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
                    <p class="text-center m-0">Already have an account? <a href="MainController?action=Login" class="link-primary text-decoration-none">Login</a></p>
                </div>
            </div>
        </div>
    </div>
</section>