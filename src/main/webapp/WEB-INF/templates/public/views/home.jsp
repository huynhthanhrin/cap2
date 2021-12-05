<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.util.Date" %>
<div class="page-top">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-12">
                <h2 class="page-heading">
                    <span class="page-heading-title"><img alt="" src=""/> FOOD STORE AVAILABLE</span>
                </h2>

                <div class="latest-deals-product">
                    <ul class="product-list owl-carousel" data-dots="false" data-loop="true" data-nav="true"
                        data-margin="10" data-autoplayTimeout="1000" data-autoplayHoverPause="true"
                        data-responsive='{"0":{"items":1},"600":{"items":3},"1000":{"items":5}}'>
                        <c:forEach items="${foodStores}" var="store">
                            <li style="min-height: 310px;">

                                <div class="left-block">
                                    <a  href="/store/product/${store.storeId}"><img class="img-responsive" alt="product"
                                            src="/resources/uploads/${store.logo}"/></a>

                                    <div class="quick-view">
                                        <a title="Add to my wishlist" class="heart" href="#"></a>
                                        <a title="Add to compare" class="compare" href="#"></a>
                                        <a title="Quick view" href="images/product-detail/vegetables/asparagus_600x600.jpg" class="search fancybox-button"></a>
                                    </div>
<%--                                    <div class="add-to-cart">--%>
<%--                                        <a class="add-item-to-cart" title="Add to Carr" href="#" data-name="Asparagus - 1kg"--%>
<%--                                           data-price="38500" data-image="vegetables/asparagus_300x300.jpg" data-product-code="AS109">Add to Cart</a>--%>
<%--                                    </div>--%>
<%--                                    <div class="price-percent-reduction2">--%>
<%--                                        -30% OFF--%>
<%--                                    </div>--%>
                                </div>
                                <div class="right-block">
                                    <h5 class="product-name"><a href="/store/product/${store.storeId}">${store.address}</a></h5>

                                    <div class="content_price">
                                    <span class="price product-price">
                                        <a href="/store/product/${store.storeId}">
                                            <span style="color: orangered">${store.storeName}</span> </span>
                                            <br><span style="color: black">Phone: ${store.storePhone}</span>
                                        </a>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>

                    </ul>
                </div>
                <div class="col-xs-12 col-sm-12">
                    <h2 class="page-heading">
                        <span class="page-heading-title"><img alt="" src=""/> MEDICINE STORE AVAILABLE</span>
                    </h2>
                    <div class="latest-deals-product">
                        <ul class="product-list owl-carousel" data-dots="false" data-loop="true" data-nav="true"
                            data-margin="10" data-autoplayTimeout="1000" data-autoplayHoverPause="true"
                            data-responsive='{"0":{"items":1},"600":{"items":3},"1000":{"items":5}}'>
                            <c:forEach items="${medicineStores}" var="store">

                                <li style="min-height: 310px;">

                                    <div class="left-block">
                                        <a href="/store/product/${store.storeId}"><img class="img-responsive" alt="product"
                                                src="/resources/uploads/${store.logo}"/></a>

                                        <div class="quick-view">
                                            <a title="Add to my wishlist" class="heart" href="#"></a>
                                            <a title="Add to compare" class="compare" href="#"></a>
                                            <a title="Quick view" href="images/product-detail/vegetables/asparagus_600x600.jpg" class="search fancybox-button"></a>
                                        </div>
                                            <%--                                    <div class="add-to-cart">--%>
                                            <%--                                        <a class="add-item-to-cart" title="Add to Carr" href="#" data-name="Asparagus - 1kg"--%>
                                            <%--                                           data-price="38500" data-image="vegetables/asparagus_300x300.jpg" data-product-code="AS109">Add to Cart</a>--%>
                                            <%--                                    </div>--%>
                                            <%--                                    <div class="price-percent-reduction2">--%>
                                            <%--                                        -30% OFF--%>
                                            <%--                                    </div>--%>
                                    </div>
                                    <div class="right-block">
                                        <h5 class="product-name"><a href="/store/product/${store.storeId}">${store.address}</a></h5>

                                        <div class="content_price">
                                        <span class="price product-price">
                                            <a href="/store/product/${store.storeId}">
                                                <span style="color: orangered">${store.storeName}</span> </span>
                                            <br><span style="color: black">Phone: ${store.storePhone}</span>
                                            </a>
                                        </div>
                                    </div>
                                </li>
                            </c:forEach>

                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- -&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;-->
<div class="demo_changer" id="demo_changer">
    <div class="demo-icon fa fa-shopping-cart">
        <span class="notify notify-left" id="count-cart">2</span>
    </div>
    <div class="form_holder">
        <div class="cart-block">
            <div class="cart-block-content">
                <div class="cart-block-list">
                    <div class="shop_cart">
                        <table class="shop_table">
                            <tbody id="show-cart">
                            <!--/////////////////////////////////-->

                            </tbody>
                        </table>
                    </div>

                </div>
                <div class="toal-cart">
                    <span>Total</span>
                    <span class="toal-price pull-right" id="total_price">54,000đ</span>
                </div>
                <div class="cart-buttons">
                    <a onclick="return paymentRedirect();" class="btn-check-out">Payment</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!---->
<div class="content-page">
    <div class="container">
        <!-- featured category  -->
        <div class="category-featured Vegetables">
            <nav class="navbar nav-menu show-brand">
                <div class="container">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-brand"><a href="#"> <img alt="" src="images/icon_like.png"/> Best Choose</a></div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse">

                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->

            </nav>
            <div class="product-featured clearfix">
                <div class="row">

                    <div class="col-sm-12">
                        <div class="box-right">
                            <!--&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;-->
                            <ul class="product-list">
                                <c:forEach items="${itemsList}" var="items">
                                <li class="col-sm-4 product-item">
                                    <div class="left-block">
                                        <a><img class="img-responsive" alt="product"
                                                src="/resources/uploads/${items.image}"/></a>

                                        <div class="quick-view">
                                            <a title="Add to my wishlist" class="heart" href="#"></a>
                                            <a title="Add to compare" class="compare" href="#"></a>
                                            <a title="Quick view" href="/resources/uploads/${items.image}" class="search fancybox-button"></a>
                                        </div>
                                        <div class="add-to-cart">
                                            <a class="add-item-to-cart" title="Add to Cart" href="" data-store="${items.store.storeId}" data-name="${items.itemName}"
                                               data-price="${items.price}" data-image="vegetables/spinach_300x300.jpg" data-product-code="${items.itemsId}">Add to Cart</a>
                                        </div>
                                        <div class="bestseller"></div>
                                    </div>
                                    <div class="right-block">
                                        <h5 class="product-name"><a href="/store/product/detail/${items.store.storeId}/${items.itemsId}">${items.itemName}</a></h5>

                                        <div class="content_price">
                                            <span class="price product-price"><span style="color: black">Price:</span>${items.price}</span>
                                        </div>
                                    </div>
                                </li>
                                </c:forEach>
                            </ul>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end featured category -->


        <div class="category-featured Vegetables">
            <nav class="navbar nav-menu show-brand">
                <div class="container">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-brand"><a href="#"> <img alt="" src="images/icon_paper-plane.png"/>Best Combo</a></div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse">

                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->

            </nav>
            <div class="product-featured clearfix">
                <div class="row">

                    <div class="col-sm-12">
                        <div class="box-right">
                            <!--&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;-->
                            <ul class="product-list">
                                <c:forEach items="${combos}" var="combo">
                                    <li class="col-sm-4 product-item">
                                        <div class="left-block">
                                            <a><img style="height: 180px" alt="product"
                                                    src="/resources/uploads/${combo.image}"/></a>

                                            <div class="quick-view">
                                                <a title="Add to my wishlist" class="heart" href="#"></a>
                                                <a title="Add to compare" class="compare" href="#"></a>
                                                <a title="Quick view" href="/resources/uploads/${combo.image}" class="search fancybox-button"></a>
                                            </div>
                                            <div class="add-to-cart">
                                                <a class="add-item-to-cart" title="Add to Cart" href="#" data-name="${combo.comboName}" data-store="${combo.store.storeId}"}
                                                   data-price="${combo.price}" data-image="/resources/uploads/${combo.image}" data-product-code="${combo.comboId}">Add to Cart</a>
                                            </div>
                                            <div class="bestseller"></div>
                                        </div>
                                        <div class="right-block">
                                            <h5 class="product-name"><a href="/store/combo/detail/${combo.store.storeId}/${combo.comboId}">${combo.comboName} - ${combo.store.storeName}</a></h5>

                                            <div class="content_price">
                                                <span class="price product-price"><span style="color: black">Price:</span>${combo.price}</span>
                                            </div>
                                        </div>
                                    </li>

                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end featured category -->
    </div>
</div>

<!--PEOPLE SAY-->



<%--<div id="owl-demo-ppsay">--%>
<%--    <div class="container">--%>
<%--        <div class="ppsay-title">CUSTOMER COMMENT</div>--%>
<%--        <div id="customer-item-carousel" class="carousel slide hidden-sm hidden-xs" data-ride="carousel">--%>
<%--            <ol class="carousel-indicators">--%>
<%--                <li data-target="#customer-item-carousel" data-slide-to="0" class="active"></li>--%>
<%--                <li data-target="#customer-item-carousel" data-slide-to="1"></li>--%>
<%--                <li data-target="#customer-item-carousel" data-slide-to="2"></li>--%>
<%--            </ol>--%>
<%--            <div class="carousel-inner hidden-sm hidden-xs">--%>
<%--                <div class="item active">--%>
<%--                    <div class="ppsaydiv">--%>
<%--                        <div class="ppsaycontent hidden-xs col-sm-6 col-md-6">--%>
<%--                            <div class="ppsayavt col-md-3 col-sm-3">--%>
<%--                                <img src="images/parallax-content2-2.png"" alt="Ms. Huong Nguyen">--%>
<%--                            </div>--%>
<%--                            <div class="ppsayauthor col-md-9 col-sm-9">--%>
<%--                                <div class="ppsaycontentcmt">--%>
<%--                                    <p style="text-align: justify"><span>“ </span>I am pleased with product quality and service quality of Eco Shop. Best wishes to your shop. I hope that there are more new best products and your service is always sustainable.<span>”</span></p>--%>
<%--                                </div>--%>
<%--                                <p><span>Customer:</span> <span class="name">Ms. Huong Nguyen</span></p>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="ppsaycontent col-xs-12 col-sm-6 col-md-6">--%>
<%--                            <div class="ppsayavt col-md-3 col-sm-3">--%>
<%--                                <img src="images/parallax-content.png" alt="Ms. Linh Pham">--%>
<%--                            </div>--%>
<%--                            <div class="ppsayauthor col-md-9 col-sm-9">--%>
<%--                                <div class="ppsaycontentcmt">--%>
<%--                                    <p style="text-align: justify"><span>“ </span>I am so busy that I do not have any time to go suppermarket. So that, buying food online is my best choice. Your products are always fresh and delicious. I will continue buying foods at your online shop. <span>”</span></p>--%>
<%--                                </div>--%>
<%--                                <p><span>Customer:</span> <span class="name">Ms. Linh Pham</span></p>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="item">--%>
<%--                    <div class="ppsaydiv">--%>
<%--                        <div class="ppsaycontent col-xs-12 col-sm-6 col-md-6">--%>
<%--                            <div class="ppsayavt col-md-3 col-sm-3">--%>
<%--                                <img src="images/parallax-content2-2.png" alt="Ms. Hoang Tran">--%>
<%--                            </div>--%>
<%--                            <div class="ppsayauthor col-md-9 col-sm-9">--%>
<%--                                <div class="ppsaycontentcmt">--%>
<%--                                    <p style="text-align: justify"><span>“ </span> I higly appreciate your product quality and your service. I now truly believe in your brand. <span>”</span></p>--%>
<%--                                </div>--%>
<%--                                <p><span>Customer:</span> <span class="name">Ms. Hoang Tran</span></p>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="ppsaycontent col-xs-12 col-sm-6 col-md-6">--%>
<%--                            <div class="ppsayavt col-md-3 col-sm-3">--%>
<%--                                <img src="images/parallax-content.png" alt="Ms. Thu Phan">--%>
<%--                            </div>--%>
<%--                            <div class="ppsayauthor col-md-9 col-sm-9">--%>
<%--                                <div class="ppsaycontentcmt">--%>
<%--                                    <p><span style="text-align: justify">“ </span> I am a young mom and have to work. It costs my time and money to access your website and buy products. <span>”</span></p>--%>
<%--                                </div>--%>
<%--                                <p><span>Customer:</span> <span class="name">Ms.Thu Phan</span></p>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="item">--%>
<%--                    <div class="ppsaydiv">--%>
<%--                        <div class="ppsaycontent col-xs-12 col-sm-6 col-md-6">--%>
<%--                            <div class="ppsayavt col-md-3 col-sm-3">--%>
<%--                                <img src="images/parallax-content-2.png" alt="Ms. Hoang Tran">--%>
<%--                            </div>--%>
<%--                            <div class="ppsayauthor col-md-9 col-sm-9">--%>
<%--                                <div class="ppsaycontentcmt">--%>
<%--                                    <p style="text-align: justify"><span>“ </span>When I looked for natural and organic shop, my friends introduced your shop to me. At the first time I came your shop, I am so satisfactory because of your customer care.<span>”</span></p>--%>
<%--                                </div>--%>
<%--                                <p><span>Customer:</span> <span class="name">Ms. Lan Tran</span></p>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="ppsaycontent col-xs-12 col-sm-6 col-md-6">--%>
<%--                            <div class="ppsayavt col-md-3 col-sm-3">--%>
<%--                                <img src="images/parallax-content-1.png" alt="Ms. Trang Le">--%>
<%--                            </div>--%>
<%--                            <div class="ppsayauthor col-md-9 col-sm-9">--%>
<%--                                <div class="ppsaycontentcmt">--%>
<%--                                    <p style="text-align: justify"><span>“ </span>Your staff are so friendly and enthusiastic. Your shop is also clean and nice. Of course, your products are best quality.<span>”</span></p>--%>
<%--                                </div>--%>
<%--                                <p><span>Customer:</span> <span class="name">Trang Le</span></p>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
        <div id="customer-item-carousel" class="carousel slide hidden-md hidden-lg" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#customer-item-carousel" data-slide-to="0" class="active"></li>
                <li data-target="#customer-item-carousel" data-slide-to="1"></li>
                <li data-target="#customer-item-carousel" data-slide-to="2"></li>
                <li data-target="#customer-item-carousel" data-slide-to="3"></li>
                <li data-target="#customer-item-carousel" data-slide-to="4"></li>
                <li data-target="#customer-item-carousel" data-slide-to="5"></li>
            </ol>
        </div>
    </div>
</div>
<script type="text/javascript">
    window.onload = function () {
        const urlSearch = new URLSearchParams(window.location.search);
        const param = Object.fromEntries(urlSearch.entries());
        if (param.reg)
        {
            $("#myModal").modal();
            $("#register_success_mess").show();
        }
    }
</script>