<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../../tags/taglibs.jsp" %>
<div class="columns-container">
    <div class="container" id="columns">
        <!-- row -->
        <div class="row">
            <div class="column col-xs-12 col-sm-3" id="left_column">
                <!-- block category -->
                <div class="block left-module">
                    <p class="title_block"><span class="fa fa-pagelines"></span> ${store.storeName}</p>

                    <div class="block_content">
                        <!-- layered -->
                        <div class="layered layered-category">
                            <div class="layered-content">
                                <ul class="tree-menu">
                                    <c:forEach items="${categoryList}" var="cat">
                                        <li><span></span><a href="/store/product/${store.storeId}/${cat.catId}">${cat.catName}</a></li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                        <div class="block_content">
                            <!-- layered -->
                            <div class="layered layered-category">
                                <div class="layered-content">
                                    <ul class="tree-menu">
                                        <li><span></span><a href="/store/combo/${store.storeId}">Combo</a></li>
                                    </ul>
                                </div>
                            </div>
                            <!-- ./layered -->
                        </div>
                        <!-- ./layered -->
                    </div>
                </div>
            </div>
            <!-- ./left colunm -->
            <!-- Center colunm-->
            <div class="center_column col-xs-12 col-sm-9" id="center_column">
                <!-- Product -->
                <div id="product">
                    <div class="primary-box row">
                        <div class="pb-left-column col-xs-12 col-sm-6">
                            <!-- product-imge-->
                            <div class="product-image">
                                <div class="product-full">
                                    <img id="product-zoom" src="/resources/uploads/${item.image}"
                                         data-zoom-image="/resources/uploads/${item.image}"/>
                                </div>
                                <div class="product-img-thumb" id="gallery_01">
                                    <ul class="owl-carousel" data-items="3" data-nav="true" data-dots="false"
                                        data-margin="20" data-loop="true">
                                        <li>
                                            <a href="#"
                                               data-image="/resources/uploads/${item.image}"
                                               data-zoom-image="/resources/uploads/${item.image}">
                                                <img id="product-zoom"
                                                     src="/resources/uploads/${item.image}"/>
                                            </a>
                                        </li>

                                    </ul>
                                </div>
                            </div>
                            <!-- product-imge-->
                        </div>
                        <div class="pb-right-column col-xs-12 col-sm-6">
                            <h1 class="product-name">${item.itemName}</h1>

                            <div class="product-price-group">
                                 <span class="price product-price"><span
                                         style="color: black">Best Price:</span> ${item.price}</span>
                                <span class="discount">-30%</span>
                            </div>
                            <div class="info-orther">1
                                <p>Unit: ${item.unit}</p>

                                <p>Status: <span class="badge badge-info">${item.quantity > 0 ? "Stocking" : "Out of stock"}</span></p>

                            </div>
                            <div class="product-desc">
                                Transport:
                                Fast delivery within 2-4 hours when the order is confirmed. Orders placed after 18:00 will be delivered by 12:00 the next day. Contact support: 024 71066866
                            </div>
                            <div class="form-option">

                                <div class="attributes">
                                    <div class="attribute-label">Quality:</div>
                                    <div class="attribute-list product-qty">
                                        <div class="qty">
                                            <input id="product-qty-${item.itemsId}" type="text" value="${item.quantity}">
                                        </div>
                                        <div class="btn-plus">
                                            <a href="#" class="btn-plus-up">
                                                <i class="fa fa-caret-up"></i>
                                            </a>
                                            <a href="#" class="btn-plus-down">
                                                <i class="fa fa-caret-down"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-action">
                                <div class="button-group">
<%--                                    <a class="add-item-to-cart btn-add-cart" title="Add to Cart" href="#"--%>
<%--                                       data-name="Papaya - 1kg"--%>
<%--                                       data-price="10500" data-image="fruits/papaya_300x300.jpg"--%>
<%--                                       data-product-code="PP987">Add to Cart</a>--%>
                                <a class="add-item-to-cart btn-add-cart" title="Add to Cart" data-toggle="modal"
                                   data-name="${item.itemName}"
                                   data-store="${item.store.storeId}"
                                   data-price="${item.price}" data-image="/resources/uploads/${item.image}" href="#"
                                   data-product-code="${item.itemsId}">Add to Cart</a>
                                </div>
                                <div class="button-group">
                                    <a class="wishlist" href="#"><i class="fa fa-heart-o"></i>
                                        <br>Heart</a>
                                    <a class="compare" href="#"><i class="fa fa-signal"></i>
                                        <br>
                                        Compare</a>
                                </div>
                            </div>

                        </div>
                    </div>
                    <!-- tab product -->
                    <div class="product-tab">
                        <ul class="nav-tab" style="margin-bottom: 0px;">
                            <li class="active">
                                <a aria-expanded="false" data-toggle="tab" href="#product-detail">Detail</a>
                            </li>
                            <li>
                                <a aria-expanded="true" data-toggle="tab" href="#comment">Comment</a>
                            </li>

                        </ul>
                        <div class="tab-container">
                            <div id="product-detail" class="tab-panel active">
                                <p>
                                    ${item.description}
                                </p>
                            </div>
                            <div id="comment" class="tab-panel">
                                <div id="addComment">
                                    <c:forEach items="${comments}" var="comment">
                                        <div class="form-inline" style="display: flex;padding-left: 30px">
                                            <div class="row" style="margin-right: 10px">
                                                <p style="font-weight: bold">${comment.user.lastName}</p>
                                            </div>
                                            <div>
                                                <p>${comment.comment}</p>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>

                            </div>

                                <div class="card p-3">

                                    <form action="/user/comment" method="post" class="form-inline">
                                        <div class="col-sm-9">
                                            <input type="text" style="width: 550px" required class="input form-control" id="text"
                                                   placeholder="Bình luận...."/>
                                            <input type="hidden" style="width: 550px" class="input form-control" value="${item.itemsId}" id="itemsId"
                                                   placeholder="Bình luận...."/>
                                            <p style="color: red;margin-bottom: 20px" id="notice"></p>
                                        </div>
                                        <div>
                                            <button style="width: 200px;background-color: #43af50;color: white;font-weight: bold" type="button" onclick="postComment()"  class="btn mb-2">Post</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <script>
                        function postComment(){
                            var comment = $('#text').val();
                            var itemsId = $('#itemsId').val();
                            var formData = new FormData();
                            formData.append('comment',comment);
                            formData.append('itemsId',itemsId);
                            $.ajax(
                                {
                                    type: 'POST',
                                    url: '/user/comment',
                                    contentType: false,
                                    processData: false,
                                    data: formData,
                                    success: function (data) {
                                        console.log(data)
                                        if(data.commentId == null){
                                            document.getElementById('notice').innerHTML = 'You need login to perform';
                                        } else {
                                            var html = ` <div class="form-inline" style="display: flex;padding-left: 30px">
                                        <div class="row" style="margin-right: 10px">
                                            <p style="font-weight: bold">`+data.user.lastName+`</p>
                                        </div>
                                        <div>
                                            <p>`+data.comment+`</p>
                                        </div>
                                        </div>`;
                                            document.getElementById('addComment').insertAdjacentHTML('beforeend', html);
                                            $('#text').val("");
                                            document.getElementById('notice').innerHTML = '';
                                        }


                                    },
                                    error: function (err) {

                                        console.log("sds")
                                    }
                                }
                            )
                        }
                    </script>
                    <!-- ./tab product -->
                    <!-- box product -->
                    <div class="page-product-box">
                        <h2 class="page-heading">
                            <span class="page-heading-title"> SIMILARITY PRODUCT</span>
                        </h2>
                        <ul class="product-list owl-carousel" data-dots="false" data-loop="true" data-nav="true"
                            data-margin="30" data-autoplayTimeout="1000" data-autoplayHoverPause="true"
                            data-responsive='{"0":{"items":1},"600":{"items":3},"1000":{"items":3}}'>
                            <li>
                                <div class="product-container">
                                    <div class="left-block">
                                        <a><img class="img-responsive" alt="product"
                                                src="images/product-detail/vegetables/broccoli_300x300.jpg"/></a>

                                        <div class="quick-view">
                                            <a title="Add to my wishlist" class="heart" href="#"></a>
                                            <a title="Add to compare" class="compare" href="#"></a>
                                            <a title="Quick view"
                                               href="images/product-detail/vegetables/broccoli_600x600.jpg"
                                               class="search fancybox-button"></a>
                                        </div>
                                        <div class="add-to-cart">
                                            <a class="add-item-to-cart" title="Add to Cart" href="#"
                                               data-name="Broccoli - 1kg"
                                               data-price="85000" data-image="broccoli_300x300.jpg"
                                               data-product-code="BC109">Add to Cart</a>
                                        </div>
                                    </div>
                                    <div class="right-block">
                                        <h5 class="product-name"><a href="#">Broccoli - 1kg</a></h5>

                                        <div class="content_price">
                                            <span class="price product-price"><span style="color: black">Price:</span> 85,000đ</span>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="product-container">
                                    <div class="left-block">
                                        <a><img class="img-responsive" alt="product"
                                                src="images/product-detail/vegetables/cucumber_300x300.jpg"/></a>

                                        <div class="quick-view">
                                            <a title="Add to my wishlist" class="heart" href="#"></a>
                                            <a title="Add to compare" class="compare" href="#"></a>
                                            <a title="Quick view"
                                               href="images/product-detail/vegetables/cucumber_600x600.jpg"
                                               class="search fancybox-button"></a>
                                        </div>
                                        <div class="add-to-cart">
                                            <a class="add-item-to-cart" title="Add to Cart" href="#"
                                               data-name="Cucumber - 1kg"
                                               data-price="25000" data-image="cucumber_300x300.jpg"
                                               data-product-code="CC109">Add to Cart</a>
                                        </div>
                                    </div>
                                    <div class="right-block">
                                        <h5 class="product-name"><a href="#">Cucumber - 1kg</a></h5>

                                        <div class="content_price">
                                            <span class="price product-price"><span style="color: black">Price:</span> 25,000đ</span>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="product-container">
                                    <div class="left-block">
                                        <a><img class="img-responsive" alt="product"
                                                src="images/product-detail/vegetables/potato_300x300.jpg"/></a>

                                        <div class="quick-view">
                                            <a title="Add to my wishlist" class="heart" href="#"></a>
                                            <a title="Add to compare" class="compare" href="#"></a>
                                            <a title="Quick view"
                                               href="images/product-detail/vegetables/potato_600x600.jpg"
                                               class="search fancybox-button"></a>
                                        </div>
                                        <div class="add-to-cart">
                                            <a class="add-item-to-cart" title="Add to Cart" href="#"
                                               data-name="Potatos - 1kg"
                                               data-price="55000" data-image="potato_300x300.jpg"
                                               data-product-code="GPL109">Add to Cart</a>
                                        </div>
                                    </div>
                                    <div class="right-block">
                                        <h5 class="product-name"><a href="#">Potatos - 1kg</a></h5>

                                        <div class="content_price">
                                            <span class="price product-price"><span style="color: black">Price:</span> 55,000đ</span>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="product-container">
                                    <div class="left-block">
                                        <a><img class="img-responsive" alt="product"
                                                src="images/product-detail/vegetables/sweetpotato_300x300.jpg"/></a>

                                        <div class="quick-view">
                                            <a title="Add to my wishlist" class="heart" href="#"></a>
                                            <a title="Add to compare" class="compare" href="#"></a>
                                            <a title="Quick view"
                                               href="images/product-detail/vegetables/sweetpotato_600x600.jpg"
                                               class="search fancybox-button"></a>
                                        </div>
                                        <div class="add-to-cart">
                                            <a class="add-item-to-cart" title="Add to Cart" href="#"
                                               data-name="Sweet Potatos - 1kg"
                                               data-price="22000" data-image="sweetpotato_300x300.jpg""
                                            data-product-code="SWP109">Add to Cart</a>
                                        </div>
                                    </div>
                                    <div class="right-block">
                                        <h5 class="product-name"><a href="#">Sweet Potatos - 1kg</a></h5>

                                        <div class="content_price">
                                            <span class="price product-price"><span style="color: black">Price:</span> 22,000đ</span>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="left-block">
                                    <a><img class="img-responsive" alt="product"
                                            src="images/product-detail/vegetables/pokchoy_300x300.jpg"/></a>

                                    <div class="quick-view">
                                        <a title="Add to my wishlist" class="heart" href="#"></a>
                                        <a title="Add to compare" class="compare" href="#"></a>
                                        <a title="Quick view"
                                           href="images/product-detail/vegetables/pokchoy_600x600.jpg"
                                           class="search fancybox-button"></a>
                                    </div>
                                    <div class="add-to-cart">
                                        <a class="add-item-to-cart" title="Add to Cart" href="#"
                                           data-name="Pokchoy - 1kg"
                                           data-price="55000" data-image="pokchoy_300x300.jpg"
                                           data-product-code="PC109">Add to Cart</a>
                                    </div>
                                </div>
                                <div class="right-block">
                                    <h5 class="product-name"><a href="#">Pokchoy - 1kg</a></h5>

                                    <div class="content_price">
                                        <span class="price product-price"><span style="color: black">Price:</span> 55,000đ</span>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <!-- ./box product -->
                    <!-- box product -->
                    <div class="page-product-box">
                        <h2 class="page-heading">
                            <span class="page-heading-title">Best Seller</span>
                        </h2>
                        <ul class="product-list owl-carousel" data-dots="false" data-loop="true" data-nav="true"
                            data-margin="30" data-autoplayTimeout="1000" data-autoplayHoverPause="true"
                            data-responsive='{"0":{"items":1},"600":{"items":3},"1000":{"items":3}}'>
                            <li>
                                <div class="left-block">
                                    <a><img class="img-responsive" alt="product"
                                            src="images/product-detail/vegetables/spinach_300x300.jpg"/></a>

                                    <div class="quick-view">
                                        <a title="Add to my wishlist" class="heart" href="#"></a>
                                        <a title="Add to compare" class="compare" href="#"></a>
                                        <a title="Quick view"
                                           href="images/product-detail/vegetables/spinach_600x600.jpg"
                                           class="search fancybox-button"></a>
                                    </div>
                                    <div class="add-to-cart">
                                        <a class="add-item-to-cart" title="Add to Cart" href="#"
                                           data-name="Spinach - 1kg"
                                           data-price="55000" data-image="spinach_300x300.jpg"
                                           data-product-code="SP109">Add to Cart</a>
                                    </div>
                                    <div class="bestseller"></div>
                                </div>
                                <div class="right-block">
                                    <h5 class="product-name"><a href="#">Spinach - 1kg</a></h5>

                                    <div class="content_price">
                                        <span class="price product-price"><span style="color: black">Price:</span> 55,000đ</span>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="product-container">
                                    <div class="left-block">
                                        <a><img class="img-responsive" alt="product"
                                                src="images/product-detail/fruits/avocado_300x300.jpg"/></a>

                                        <div class="quick-view">
                                            <a title="Add to my wishlist" class="heart" href="#"></a>
                                            <a title="Add to compare" class="compare" href="#"></a>
                                            <a title="Quick view"
                                               href="images/product-detail/fruits/avocado_600x600.jpg"
                                               class="search fancybox-button"></a>
                                        </div>
                                        <div class="add-to-cart">
                                            <a class="add-item-to-cart" title="Add to Cart" href="#"
                                               data-name="Avocado - 1kg"
                                               data-price="52000" data-image="avocado_300x300.jpg"
                                               data-product-code="AC042">Add to Cart</a>
                                        </div>
                                        <div class="bestseller"></div>
                                    </div>
                                    <div class="right-block">
                                        <h5 class="product-name"><a href="#">Avocado - 1kg</a></h5>

                                        <div class="content_price">
                                            <span class="price product-price"><span style="color: black">Price:</span> 52,000</span>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="product-container">
                                    <div class="left-block">
                                        <a><img class="img-responsive" alt="product"
                                                src="images/product-detail/cereals/ricewhite_300x300.jpg"/></a>

                                        <div class="quick-view">
                                            <a title="Add to my wishlist" class="heart" href="#"></a>
                                            <a title="Add to compare" class="compare" href="#"></a>
                                            <a title="Quick view"
                                               href="images/product-detail/cereals/ricewhite_600x600.jpg"
                                               class="search fancybox-button"></a>
                                        </div>
                                        <div class="add-to-cart">
                                            <a class="add-item-to-cart" title="Add to Cart" href="#"
                                               data-name="White Rice - 1kg"
                                               data-price="25000" data-image="ricewhite_300x300.jpg"
                                               data-product-code="WR109">Add to Cart</a>
                                        </div>
                                        <div class="bestseller"></div>
                                    </div>
                                    <div class="right-block">
                                        <h5 class="product-name"><a href="#">White Rice - 1kg</a></h5>

                                        <div class="content_price">
                                            <span class="price product-price"><span style="color: black">Price:</span> 25,000đ</span>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="left-block">
                                    <a><img class="img-responsive" alt="product"
                                            src="images/product-detail/beans/soybeans_300x300.jpg"/></a>

                                    <div class="quick-view">
                                        <a title="Add to my wishlist" class="heart" href="#"></a>
                                        <a title="Add to compare" class="compare" href="#"></a>
                                        <a title="Quick view" href="images/product-detail/beans/soybeans_300x300.jpg"
                                           class="search fancybox-button"></a>
                                    </div>
                                    <div class="add-to-cart">
                                        <a class="add-item-to-cart" title="Add to Cart" href="#"
                                           data-name="Soy Beans - 1kg"
                                           data-price="60000" data-image="soybeans_300x300.jpg"
                                           data-product-code="SBD042">Add to Cart</a>
                                    </div>
                                    <div class="bestseller"></div>
                                </div>
                                <div class="right-block">
                                    <h5 class="product-name"><a href="#">Soy Beans - 1kg</a></h5>

                                    <div class="content_price">
                                        <span class="price product-price"><span style="color: black">Price:</span> 60,000</span>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <!-- ./box product -->
                </div>
                <!-- Product -->
            </div>
            <!-- ./ Center colunm -->
        </div>
        <!-- ./row-->
    </div>
</div>

<!--EN LOGIN REGISTER-->

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
                    <a href="/cart" class="btn-check-out">Payment</a>
                </div>
            </div>
        </div>
    </div>
</div>