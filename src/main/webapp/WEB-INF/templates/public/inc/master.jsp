<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<%@include file="../../tags/taglibs.jsp" %>
<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" href="images/favicon.ico">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="/resources/templates/public/css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/templates/public/lib/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/templates/public/lib/font-awesome/css/font-awesome.min.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/templates/public/lib/select2/css/select2.min.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/templates/public/lib/jquery.bxslider/jquery.bxslider.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/templates/public/lib/owl.carousel/owl.carousel.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/templates/public/lib/jquery-ui/jquery-ui.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/templates/public/lib/fancyBox/source/jquery.fancybox.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/templates/public/css/animate.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/templates/public/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/templates/public/css/green.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/templates/public/css/responsive.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/templates/public/css/style_frm_dkdn.css"/>
    <link rel="stylesheet" href="/resources/templates/public/css/switcher.css">

    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <title>FMOOS</title>
</head>
<body class="green">
<div id="header" class="header">

    <!-- HEADER AT HERE -->
    <tiles:insertAttribute name="header"/>

</div>

<tiles:insertAttribute name="slide"/>
<!-- body at here-->
<tiles:insertAttribute name="body"/>

<!-- POPUP LOGIN-REGISTER -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <!-- import  popup LOGIN-REGISTER at here -->
        <tiles:insertAttribute name="login"/>
    </div>
</div>

<footer id="footer">
    <!-- Footer at here -->
    <tiles:insertAttribute name="footer"/>
</footer>

<a href="#" class="scroll_top" title="Scroll to Top" style="display: inline;">Scroll</a>
<!-- Script-->

<script type="text/javascript" src="/resources/templates/public/lib/jquery/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="/resources/templates/public/lib/jquery-migrate.min.js"></script>
<script type="text/javascript" src="/resources/templates/public/lib/fancyBox/source/jquery.fancybox.pack.js" ></script>
<script type="text/javascript" src="/resources/templates/public/lib/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/resources/templates/public/lib/select2/js/select2.min.js"></script>
<script type="text/javascript" src="/resources/templates/public/lib/jquery.bxslider/jquery.bxslider.min.js"></script>
<script type="text/javascript" src="/resources/templates/public/lib/owl.carousel/owl.carousel.min.js"></script>



<script type="text/javascript" src="/resources/templates/public/js/jquery.actual.min.js"></script>
<script type="text/javascript" src="/resources/templates/public/js/theme-script.js"></script>
<script type="text/javascript" src="/resources/templates/public/js/shoppingCart.js"></script>
<script type="text/javascript" src="/resources/templates/public/js/checkout.js"></script>
<script type="text/javascript" src="/resources/templates/public/js/login.js"></script>

<script type="text/javascript" src="js/layout.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {
        Layout.init();
        Layout.initOWL();
        Layout.initTwitter();
        Layout.initImageZoom();
        Layout.initTouchspin();
        Layout.initUniform();
        Layout.initSliderRange();
    });
</script>
</body>

</html>