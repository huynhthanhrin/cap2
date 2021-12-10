/* #####################################################################
 #
 #   Project       : Modal Login with jQuery Effects
 #   Author        : Rodrigo Amarante (rodrigockamarante)
 #   Version       : 1.0
 #   Created       : 07/29/2015
 #   Last Change   : 08/04/2015
 #
 ##################################################################### */

$(function() {

    var $formLogin = $('#login-form');
    var $formLost = $('#lost-form');
    var $formRegister = $('#register-form');
    var $divForms = $('#div-forms');
    var $modalAnimateTime = 300;
    var $msgAnimateTime = 150;
    var $msgShowTime = 2000;

    $("form").submit(function () {
        switch(this.id) {
            case "login-form":
                var $lg_username=$('#login_username').val();
                var $lg_password=$('#login_password').val();
                if ($lg_username == "ERROR") {
                    msgChange($('#div-login-msg'), $('#icon-login-msg'), $('#text-login-msg'), "error", "glyphicon-remove", "Login error");
                } else {
                    msgChange($('#div-login-msg'), $('#icon-login-msg'), $('#text-login-msg'), "success", "glyphicon-ok", "Login OK");
                }
                return false;
                break;
            case "lost-form":
                var $ls_email=$('#lost_email').val();
                if ($ls_email == "ERROR") {
                    msgChange($('#div-lost-msg'), $('#icon-lost-msg'), $('#text-lost-msg'), "error", "glyphicon-remove", "Send error");
                } else {
                    msgChange($('#div-lost-msg'), $('#icon-lost-msg'), $('#text-lost-msg'), "success", "glyphicon-ok", "Send OK");
                }
                return false;
                break;
            case "register-form":
                var $rg_username=$('#register_username').val();
                var $rg_email=$('#register_email').val();
                var $rg_password=$('#register_password').val();
                if ($rg_username == "ERROR") {
                    msgChange($('#div-register-msg'), $('#icon-register-msg'), $('#text-register-msg'), "error", "glyphicon-remove", "Register error");
                } else {
                    msgChange($('#div-register-msg'), $('#icon-register-msg'), $('#text-register-msg'), "success", "glyphicon-ok", "Register OK");
                }
                return false;
                break;
            default:
                return false;
        }
        return false;
    });

    $('#login_register_btn').click( function () { modalAnimate($formLogin, $formRegister) });
    $('#register_login_btn').click( function () { modalAnimate($formRegister, $formLogin); });
    $('#login_lost_btn').click( function () { modalAnimate($formLogin, $formLost); });
    $('#lost_login_btn').click( function () { modalAnimate($formLost, $formLogin); });
    $('#lost_register_btn').click( function () { modalAnimate($formLost, $formRegister); });
    $('#register_lost_btn').click( function () { modalAnimate($formRegister, $formLost); });

    function modalAnimate ($oldForm, $newForm) {
        var $oldH = $oldForm.height();
        var $newH = $newForm.height();
        $divForms.css("height",$oldH);
        $oldForm.fadeToggle($modalAnimateTime, function(){
            $divForms.animate({height: $newH}, $modalAnimateTime, function(){
                $newForm.fadeToggle($modalAnimateTime);
            });
        });
    }

    function msgFade ($msgId, $msgText) {
        $msgId.fadeOut($msgAnimateTime, function() {
            $(this).text($msgText).fadeIn($msgAnimateTime);
        });
    }

    function msgChange($divTag, $iconTag, $textTag, $divClass, $iconClass, $msgText) {
        var $msgOld = $divTag.text();
        msgFade($textTag, $msgText);
        $divTag.addClass($divClass);
        $iconTag.removeClass("glyphicon-chevron-right");
        $iconTag.addClass($iconClass + " " + $divClass);
        setTimeout(function() {
            msgFade($textTag, $msgOld);
            $divTag.removeClass($divClass);
            $iconTag.addClass("glyphicon-chevron-right");
            $iconTag.removeClass($iconClass + " " + $divClass);
        }, $msgShowTime);
    }
});

// $(document).ready(function () {
//     if (localStorage.getItem("token") != null && localStorage.getItem("userInfo")) {
//         console.log(localStorage.getItem("token"));
//         window.location = "/";
//         return;
//     }
// });

function handleLogin() {
    // $("#wait").css("display", "flex");
    var username = $("#username_login").val();
    var pwd = $("#pass_login").val();
    var data = {
        "username": username,
        "password": pwd
    }
    $.ajax({
        url: "/api/login",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify(data),
        success: function (result) {
            //$("#wait").css("display", "none");
            if (result.code == '200') {
                console.log(result);
                localStorage.setItem("token", result.data.access_token);
                localStorage.setItem("userInfo", JSON.stringify(result.data));
                window.location = document.referrer;
                return;
            }
        },
        error: function (xhr, status, error) {
            $("#wait").css("display", "none");

            $("#login_error_mes").show();
            const alert_box = '<div class="alert alert-danger" role="alert">' +
                'Wrong username or password!' +
                '</div>';
            $("#message").html(alert_box);
            $("#loginFail").text(JSON.parse(xhr.responseText).text);
        }
    });
}

function handleRegister() {
    var firstName = $("#firstName_rg").val();
    var lastName = $("#lastName_rg").val();
    var username = $("#username_rg").val();
    var password =  $("#password_rg").val();
    var card_number = $("#card_number_rg").val();
    var phoneNumber = $("#phone_number_rg").val();
    var dayOfBirth = $("#dayOfBirth_rg").val();
    var gender = $("#gender_rg").val();
    var address = $("#address_rg").val();
    var wardId = $("#ward_rg").val();

    if (firstName === '' || lastName === '' || username === '' || password === '' ||
        card_number === '' || phoneNumber === '' || dayOfBirth === '' || gender === ''
        || address === '' || wardId === '')
    {
        $("#register_error_missing_info").show();
        return;
    }

    var data = {
        "firstName" : firstName,
        "lastName" : lastName,
        "username" : username,
        "password" : password,
        "identityCardNumber" : card_number,
        "phoneNumber" : phoneNumber,
        "dayOfBirth" : dayOfBirth,
        "gender" : gender,
        "address" : address,
        "wardId" : wardId
    }
    $.ajax({
        url: "/api/register",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify(data),
        success: function (result) {
            //$("#wait").css("display", "none");
            if (result.code == '200') {
                console.log(result);
                window.location = "/index?reg=success";
                $("#myModal").modal();
                return;
            }
            if (result.code == '409') {
                console.log(result);
                $("#register_error_exist").show();
                return;
            }
        },
        error: function (xhr, status, error) {
            $("#register_error_mes").show();
        }
    });

}

function handleLogout()
{
    localStorage.clear();
    location.href='/logout';
}

function paymentRedirect() {
    if (localStorage.getItem("userInfo") != null)
    {
        location.href = "/cart";
    } else {
        $("#myModal").modal();
    }
}

