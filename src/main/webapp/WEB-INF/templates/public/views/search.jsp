<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- END Home slideder-->

<!-- page wapper-->
<div class="columns-container">
    <c:if test="${not empty payment_success}">

        <script>
            swal({
                title: 'Payment Online Successfully!',
                /* text: 'Redirecting...', */
                icon: 'success',
                timer: 2000,
                buttons: true,
                type: 'success'
            })
        </script>
    </c:if>

    <div class="container" id="columns">
        <!-- page heading-->
        <h2 class="page-heading">
            <span class="page-heading-title">Key word: ${keyWord}</span>
        </h2>
        <!-- ../page heading-->
        <c:if test="${not empty msg}">
            <c:choose >
                <c:when test="${not empty param.error}">
                    <div class="alert alert-danger">
                        <strong>${msg}</strong>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="alert alert-success">
                        <strong>${msg}</strong>
                    </div>
                </c:otherwise>
            </c:choose>

        </c:if>
        <div class="category-featured Vegetables">
            <nav class="navbar nav-menu show-brand">
                <div class="container">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-brand"><a href="#"> <img alt="" src="images/icon_like.png"/>Search Result</a></div>

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
                                <c:if test="${itemsList.size()  == 0}">
                                    <h4 style="color: red">No results found</h4>
                                </c:if>
                                <c:if test="${itemsList.size()  != 0}">
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
                                                <br>
                                                <h5 class="product-name"><a href="/store/product/${items.store.storeId}">${items.store.storeName}</a></h5>
                                                <div class="content_price">
                                                    <span class="price product-price"><span style="color: black">Price:</span>${items.price}</span>
                                                </div>
                                            </div>
                                        </li>
                                    </c:forEach>
                                </c:if>

                            </ul>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- ./page wapper-->