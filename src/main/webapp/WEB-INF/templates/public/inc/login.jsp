<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="modal-content">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
        <h4 class="modal-title" id="myModalLabel" style="font-weight: bold">${userInfo == null ? 'LOGIN/REGISTER' : 'USER INFORMATION'}</h4>
    </div>

    <div class="modal-body" id="loginForm">
        <c:choose>
            <c:when test="${userInfo == null}">
                <div class="row">
                    <div class="col-md-7" style="border-right: 1px dotted #C2C2C2;padding-right: 30px;">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#Login" data-toggle="tab">Login</a></li>
                            <li><a href="#Registration" data-toggle="tab">Register</a></li>
                        </ul>
                        <!-- Tab panes -->
                        <div class="tab-content">
                            <!-- LOGIN -->
                            <div class="tab-pane active" id="Login">
                                <form action="javascript:void()" name="dangnhap_from" class="form-horizontal"
                                      id="dangnhap_from" method="post">
                                    <div class="form-group">
                                        <label for="username_login" class="col-sm-3 control-label">Username</label>

                                        <div class="col-sm-9">
                                            <input type="text" class="input form-control" id="username_login"
                                                   placeholder="Username...."/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="pass_login" class="col-sm-3 control-label">Password</label>

                                        <div class="col-sm-9">
                                            <input type="password" class="input form-control" id="pass_login"
                                                   placeholder="Password...."/>
                                        </div>
                                    </div>
                                    <div class="alert alert-danger" id="login_error_mes" hidden role="alert">
                                        Wrong username or password!
                                    </div>
                                    <div class="alert alert-success" id="register_success_mess" hidden role="alert">
                                        Register successfully!
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-3">
                                        </div>
                                        <div class="col-sm-9">
                                            <button class="button"  onclick="return handleLogin();" id="button-confirm">Login</button>
                                        </div>
                                    </div>
                                </form>
                            </div>

                            <!-- REGISTER -->
                            <div class="tab-pane fade" id="Registration">
                                <form class="form-horizontal" name="dangkytk_form" id="register_form" action="#" method="post"
                                      enctype="multipart/form-data" id="form_register">
                                    <div class="form-group">
                                        <label for="firstName_rg" class="col-sm-4 control-label">First Name</label>

                                        <div class="col-sm-8">
                                            <input type="text" class="input form-control" id="firstName_rg" name="firstName_rg" required/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="lastName_rg" class="col-sm-4 control-label">Last Name</label>

                                        <div class="col-sm-8">
                                            <input type="text" class="input form-control" id="lastName_rg" name="lastName_rg" required/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="username_rg" class="col-sm-4 control-label">Username</label>

                                        <div class="col-sm-8">
                                            <input type="text" class="input form-control" id="username_rg" name="username_rg" required/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="password_rg" class="col-sm-4 control-label">Password</label>

                                        <div class="col-sm-8">
                                            <input type="password" class="input form-control" id="password_rg" required/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="repassword_rg" class="col-sm-4 control-label">Re-password</label>

                                        <div class="col-sm-8">
                                            <input type="password" class="input form-control" id="repassword_rg" required/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="card_number_rg" class="col-sm-4 control-label">Identify Card Number</label>

                                        <div class="col-sm-8">
                                            <input type="text" class="input form-control" id="card_number_rg" name="card_number_rg" required/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="phone_number_rg" class="col-sm-4 control-label">Phone Number</label>

                                        <div class="col-sm-8">
                                            <input type="text" class="input form-control" id="phone_number_rg" name="phone_number_rg" required/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="dayOfBirth_rg" class="col-sm-4 control-label">Day Of Birth</label>

                                        <div class="col-sm-8">
                                            <input type="date" class="input form-control" id="dayOfBirth_rg" name="dayOfBirth_rg" required/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="gender_rg" class="col-sm-4 control-label">Gender</label>

                                        <div class="col-sm-8">
                                            <select class="input form-control" name="gender_rg" id="gender_rg">
                                                <option value="" checked>I am...</option>
                                                <option value="Female">Female</option>
                                                <option value="Female">Male</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="address_rg" class="col-sm-4 control-label">Address</label>

                                        <div class="col-sm-8">
                                            <input type="text" class="input form-control" id="address_rg" required/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="ward_rg" class="col-sm-4 control-label">Ward</label>

                                        <div class="col-sm-8">
                                            <select class="input form-control" name="ward_rg" id="ward_rg">
                                                <c:forEach items="${wardsList}" var="ward">
                                                    <option value="${ward.wardsId}">${ward.wardName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="alert alert-danger" id="register_error_mes" hidden role="alert">
                                        Error when register. Please try again!
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-4">
                                        </div>
                                        <div class="col-sm-8">
                                            <button class="button" id="reg_button" onclick="return handleRegister();" type="button">Register</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <div id="OR" class="hidden-xs">OR</div>
                    </div>

                    <!-- Facebook - Google account -->
                    <div class="col-md-5">
                        <div class="row text-center sign-with">
                            <div class="social-header">Login With</div>
                            <div class="unit social-column">
                                <div class="social-inner">
                                    <div><a href=""><img src="/resources/templates/public/images/fb-login-button-big.png" alt="login-facebook"></a></div>
                                    <div><a href=""><img src="/resources/templates/public/images/gg-login-button-big.png" alt="login-google"></a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
            <!-- REGISTER -->
            <div class="tab-pane" id="Registratison">
                <form class="form-horizontal" name="dangkytk_form" action="#" method="post"
                      enctype="multipart/form-data" id="dangkytk_form register">
                    <div class="form-group">
                        <label for="frm_name" class="col-sm-4 control-label">First Name</label>

                        <div class="col-sm-8">
                            <input type="text" class="input form-control" id="first_name_up" name="firstName" value="${userInfo.firstName}" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="frm_name" class="col-sm-4 control-label">Last Name</label>

                        <div class="col-sm-8">
                            <input type="text" class="input form-control" id="last_name_up" value="${userInfo.lastName}" name="lastName" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="emailtk" class="col-sm-4 control-label">Username</label>

                        <div class="col-sm-8">
                            <input type="text" class="input form-control" id="username_up"  value="${userInfo.username}" required/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="pass_tk" class="col-sm-4 control-label">Password</label>

                        <div class="col-sm-8">
                            <input type="password" class="input form-control" id="pass_tk" required/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="repass_tk" class="col-sm-4 control-label">Re-password</label>

                        <div class="col-sm-8">
                            <input type="password" class="input form-control" id="repass_tk" required/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="card_number" class="col-sm-4 control-label">Identify Card Number</label>

                        <div class="col-sm-8">
                            <input type="email" class="input form-control" id="card_number_up" value="${userInfo.identityCardNumber}" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="phone_number" class="col-sm-4 control-label">Phone Number</label>

                        <div class="col-sm-8">
                            <input type="email" class="input form-control" id="phone_number_up" value="${userInfo.phoneNumber}" required/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="ngaysinh_tk" class="col-sm-4 control-label">Birth day</label>

                        <div class="col-sm-8">
                            <input type="date" class="input form-control" id="date_of_birth_up" value="${userInfo.dateOfBirth}"  required/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="gender_tk" class="col-sm-4 control-label">Gender</label>

                        <div class="col-sm-8">
                            <select class="input form-control" name="gioitinh" id="gender_tk"
                                <option value="Female"  ${userInfo.gender == 'Female' ? 'selected' : ''}>Female</option>
                                <option value="Female"  ${userInfo.gender == 'Female' ? 'selected' : ''}>Male</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="address" class="col-sm-4 control-label">Address</label>

                        <div class="col-sm-8">
                            <input type="email" class="input form-control" id="address_up" value="${userInfo.address}" required/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="gender_tk" class="col-sm-4 control-label">Ward</label>

                        <div class="col-sm-8">
                            <select class="input form-control" name="gioitinh" id="gender_tk">
                                <option value="An Khe">An Khe</option>
                                <option value="Hoa Khe">Hoa Khe</option>
                            </select>
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-sm-4">
                        </div>
                        <div class="col-sm-8">
                            <button class="button" type="submit">Update</button>
                            <button class="button" onclick="return handleLogout();"  type="button">Logout</button>
                        </div>
                    </div>
                </form>
            </c:otherwise>
        </c:choose>

    </div>
</div>