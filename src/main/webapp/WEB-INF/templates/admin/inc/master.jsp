<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<%@include file="../../tags/taglibs.jsp" %>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>FMOOS-Management</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="/resources/templates/admin/css/styles.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
            crossorigin="anonymous"></script>
    <script src="https://cdn.ckeditor.com/ckeditor5/29.0.0/classic/ckeditor.js"></script>
</head>

<body class="sb-nav-fixed">
<!-- Import header at here-->
<tiles:insertAttribute name="header"/>
<div id="layoutSidenav">
    <!-- import left bav at here-->
    <tiles:insertAttribute name="leftbar"/>
    <div id="layoutSidenav_content">
        <!-- import body at hear-->
        <tiles:insertAttribute name="body"/>
        <footer class="py-4 bg-light mt-auto">
            <!-- import footer at here-->
            <tiles:insertAttribute name="footer"/>
        </footer>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="/resources/templates/admin/js/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="/resources/templates/admin/assets/demo/chart-area-demo.js"></script>
<script src="/resources/templates/admin/assets/demo/chart-bar-demo.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="/resources/templates/admin/js/datatables-simple-demo.js"></script>
</body>

</html>