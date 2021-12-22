<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../../tags/taglibs.jsp" %>
<div class="container main-header">
    <div class="row">
        <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 logo">
            <a href="/"><img style="width: 25%;" alt="Eco Shop" src="/resources/uploads/logo.png" /></a>
        </div>
        <div class="col-xs-4 col-sm-12 col-md-5 col-lg-4 header-search-box">
            <form class="form-inline" action="${pageContext.request.contextPath}/search" method="post">
                <div class="form-group input-serach">
                    <input id="keySearch" type="text" placeholder="Search ...">
                </div>
                <button type="submit" class="pull-right btn-search"><i onclick="search()" class="fa fa-search" ></i></button>
            </form>
        </div>
        <script>
            function search()
            {
                var keySearch = document.getElementById("keySearch").value;
                var url = "/search/"+keySearch;
                location.href=url;
            }
        </script>

        <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 group-button-header">


            <div style="width: 250px;text-align: center" class="btn-cart" id="cart-block">

                <a title="SignIn" href="" id="loginButton" data-toggle="modal" data-target="#myModal">Log In</a>
                <c:if test="${userInfo != null}">
                    <span style="margin-top: 20px; width: 200px; color: darkseagreen; font-weight: bold;">${userInfo != null ? userInfo.getFullName() : ""}</span>
                </c:if>
            </div>
        </div>
    </div>
</div>
<div id="nav-top-menu" class="nav-top-menu">
    <div class="container">
        <div class="row">

            <div id="main-menu" class="col-sm-12 main-menu">
                <nav class="navbar navbar-default">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                                    data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                                <i class="fa fa-bars"></i>
                            </button>
                            <a class="navbar-brand" href="#">MENU</a>
                        </div>
                        <div id="navbar" class="navbar-collapse collapse">
                            <ul class="nav navbar-nav">
                                <li class="active"><a href="/"><span class="fa fa-home"></span> Home</a></li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Food Store</a>
                                    <ul class="dropdown-menu container-fluid">
                                        <li class="block-container">
                                            <ul class="block">
                                                <c:forEach items="${foodStores}" var="store">
                                                    <li class="link_container"><a href="/store/product/${store.storeId}">${store.storeName}</a></li>
                                                </c:forEach>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Medicine Store</a>
                                    <ul class="dropdown-menu container-fluid">
                                        <li class="block-container">
                                            <ul class="block">
                                                <c:forEach items="${medicineStores}" var="store">
                                                    <li class="link_container"><a href="/store/product/${store.storeId}">${store.storeName}</a></li>
                                                </c:forEach>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <!--<li><a href="#">Promotion</a></li>-->
                                <li><a href="/order/index">Order</a></li>
<%--                                <li><a href="policy-faq.html">Policy & FAQ</a></li>--%>
<%--                                <li><a href="about-us.html">About Us</a></li>--%>
<%--                                <li><a href="contact-us.html">Contact Us</a></li>--%>
                            </ul>
                        </div>
                        <!--/.nav-collapse -->
                    </div>
                </nav>
            </div>
        </div>
        <!-- userinfo on top-->
        <div id="form-search-opntop">
        </div>
        <!-- userinfo on top-->
        <div id="user-info-opntop">
        </div>
        <!-- CART ICON ON MMENU -->
        <div id="shopping-cart-box-ontop">
            <i class="fa fa-user" data-toggle="modal" data-target="#myModal"></i>

            <div class="shopping-cart-box-ontop-content"></div>
        </div>
    </div>

</div>
