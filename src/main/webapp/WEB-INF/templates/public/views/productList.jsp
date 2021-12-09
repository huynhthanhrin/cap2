<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../../tags/taglibs.jsp" %>
<div class="columns-container">
    <div class="container" id="columns">
        <!-- row -->
        <div class="row">
            <!-- Left colunm -->
            <div class="column col-xs-12 col-sm-3" id="left_column">
                <!-- import left bar -->
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
                        <!-- ./layered -->
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
                </div>
            </div>
            <!-- ./left colunm -->
            <!-- Center colunm-->
            <div class="center_column col-xs-12 col-sm-9" id="center_column">
                <!-- page heading-->
                <h2 class="page-heading">
                    <span class="page-heading-title">${cat != null ? cat.catName : "All Items"}</span>

                </h2>
                <!-- ../page heading-->
                <!-- Product -->
                <div id="product">
                    <!-- box product -->
                    <div class="category-featured Vegetables">
                        <div class="product-featured clearfix">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="box-right">
                                        <!--&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;-->
                                        <ul class="product-list">
                                            <c:forEach items="${itemsList.content}" var="item">
                                                <li class="col-sm-4 product-item" style="width: 280px;">

                                                    <div class="left-block">
                                                        <a ><img class="img-responsive" alt="product"
                                                                 src="/resources/uploads/${item.image}"/></a>

                                                        <div class="quick-view">
                                                            <a title="Add to my wishlist" class="heart" href="#"></a>
                                                            <a title="Add to compare" class="compare" href="#"></a>
                                                            <a title="Quick view" href="images/product-detail/cereals/barley_600x600.jpg" class="search fancybox-button"></a>

                                                        </div>

                                                        <div class="add-to-cart">
                                                            <a class="add-item-to-cart" title="Add to Cart" href="#" data-store="${item.store.storeId}" data-name="${item.itemName}"
                                                               data-price="${item.price}" data-image="/resources/uploads/${item.image}" data-product-code="${item.itemsId}">Add to Cart</a>
                                                        </div>
                                                        <div class="price-percent-reduction2">
                                                            -30% OFF
                                                        </div>
                                                    </div>
                                                    <div class="right-block">
                                                        <h5 class="product-name"><a href="/store/product/detail/${store.storeId}/${item.itemsId}">${item.itemName}</a></h5>
                                                        <input id="product-qty-${item.itemsId}" type="text" hidden value="${item.quantity}">
                                                        <div class="content_price">
                                            <span class="price product-price"><span
                                                    style="color: orangered">Price:</span>${item.price}/${item.unit}</span>
                                                                    <!--<br><span style="color: black">Price:</span>-->
                                                                    <!--<span class="price old-price">30,000đ</span>-->
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
                    <!-- ./box product -->
                </div>
                <!-- Product -->
                <div class="sortPagiBar">
                    <div class="bottom-pagination">
                        <nav>
                            <ul class="pagination">
                                <c:if test="${numberPage>0}">
                                    <li>

                                        <c:if test="${cat == null}">
                                            <a href="${pageContext.request.contextPath}${store.storeId}?page=${itemsList.number - 1}" aria-label="Next">
                                                <span aria-hidden="true"><< Previous</span>
                                            </a>
                                        </c:if>
                                        <c:if test="${cat != null}">
                                            <a href="${pageContext.request.contextPath}${cat.catId}?page=${itemsList.number - 1}" aria-label="Next">
                                                <span aria-hidden="true"><< Previous</span>
                                            </a>
                                        </c:if>
                                    </li>
                                </c:if>
                                <c:forEach varStatus="index" items="${itemSize}" var="item">

                                    <c:if test="${cat == null}">
                                        <li class="${numberPage == index.index? 'active' : null}"><a href="${pageContext.request.contextPath}${store.storeId}?page=${index.index}">${index.index+1}</a></li>
                                    </c:if>
                                    <c:if test="${cat != null}">
                                        <li class="${numberPage == index.index? 'active' : null}"><a href="${pageContext.request.contextPath}${cat.catId}?page=${index.index}">${index.index+1}</a></li>
                                    </c:if>
                                </c:forEach>
                                <c:if test="${numberPage<itemsList.totalPages - 1}">
                                    <li>
                                    <c:if test="${cat == null}">
                                        <a href="${pageContext.request.contextPath}${store.storeId}?page=${itemsList.number + 1}" aria-label="Next">
                                            <span aria-hidden="true">Next >></span>
                                        </a>
                                    </c:if>
                                        <c:if test="${cat != null}">
                                            <a href="${pageContext.request.contextPath}${cat.catId}?page=${itemsList.number + 1}" aria-label="Next">
                                                <span aria-hidden="true">Next >></span>
                                            </a>
                                        </c:if>
                                    </li>
                                </c:if>

                            </ul>
                        </nav>
                    </div>
<%--                    <div class="show-product-item">--%>
<%--                        <select name="">--%>
<%--                            <option value="">Show 9</option>--%>
<%--                            <option value="">Show 18</option>--%>
<%--                            <option value="">Show 27</option>--%>
<%--                            <option value="">Show 36</option>--%>
<%--                        </select>--%>
<%--                    </div>--%>
<%--                    <div class="sort-product">--%>
<%--                        <select>--%>
<%--                            <option value="">Product Name</option>--%>
<%--                            <option value="">Price</option>--%>
<%--                        </select>--%>

<%--                        <div class="sort-product-icon">--%>
<%--                            <i class="fa fa-sort-alpha-asc"></i>--%>
<%--                        </div>--%>
<%--                    </div>--%>
                </div>
            </div>
            <!-- ./ Center colunm -->
        </div>
        <!-- ./row-->
    </div>
</div>

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
</div>
