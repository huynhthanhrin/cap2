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
            <span class="page-heading-title">Your Order</span>
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
        <div class="page-content page-order">

            <div class="heading-counter warning" ><span class="fa fa-shopping-cart"></span> You have:
                <span id="count-order" style="font-weight: bold">${orderList.size()}</span> <span> Order</span>
            </div>
            <div class="order-detail-content">
                <table class="table table-bordered table-responsive cart_summary">
                    <thead>
                    <tr>
                        <th class="cart_product">STT</th>
                        <th>Order Code</th>
                        <th>Items List</th>
                        <th>Store</th>
                        <th>Recipient Name</th>
                        <th>Recipient Address</th>
                        <th>Recipient Phone</th>
                        <th>Time Order</th>
                        <th>Total Price</th>
                        <th>Status</th>
                        <th class="action"><i class="fa fa-trash-o"></i></th>
                    </tr>
                    </thead>
                    <tbody id="order">
                        <c:forEach items="${orderList}" var="order" varStatus="index">
                            <tr>
                                <th class="cart_product">${index.index + 1}</th>
                                <th>ODR${order.orderId}</th>
                                <th>

                                    <c:forEach items="${orderItemService.findOrderItemsByOrder(order)}" var="orderItem">
                                        <c:if test="${orderItem.items ne null}">
                                            <li>${orderItem.items.itemName} x  ${orderItem.itemQuantity} ${orderItem.items.unit}</li>
                                        </c:if>
                                        <c:if test="${orderItem.combo ne null}">
                                            <li>${orderItem.combo.comboName} x  ${orderItem.comboQuantity} </li>
                                        </c:if>

                                    </c:forEach>
                                    <c:forEach items="${order.combos}" var="com">
                                        <li>
                                            <strong>${com.comboName}</strong>
                                        </li>
                                    </c:forEach>
                                </th>
                                <th>
                                    <a href="/store/product/${order.store.storeId}"> <strong>${order.store.storeName}</strong></a>
                                </th>
                                <th>${order.recipientName}</th>
                                <th>${order.recipientAddress}</th>
                                <th>${order.recipientPhone}</th>
                                <fmt:formatDate value="${order.orderTime}" var="timeOrder" pattern="HH:mm:ss dd:MM:yyyy"/>
                                <th><fmt:formatDate value="${order.orderTime}" pattern="HH:mm:ss dd-MM-yyyy"/></th>
                                <th><fmt:formatNumber type = "number"
                                                      maxFractionDigits = "3" value = "${order.totalPrice}" /></th>
                                <th>
                                    <c:choose>
                                        <c:when test="${order.status == 0 || order.status == 1}">
                                            <span style="background-color: #ff9900" class="badge badge-success">Waiting for confirmation</span>

                                        </c:when>
                                        <c:when test="${order.status == 2}">
                                            <span style="background-color: #17a2b8" class="badge badge-danger">Preparing orders</span>

                                        </c:when>
                                        <c:when test="${order.status == 3 || order.status == 4}">
                                            <span style="background-color: #007bff" class="badge badge-danger">Delivery</span>

                                        </c:when>
                                        <c:when test="${order.status == 5}">
                                            <span style="background-color: #28a745" class="badge badge-danger">Successfully</span>

                                        </c:when>
                                        <c:when test="${order.status == 6}">
                                            <span style="background-color: #dc3545" class="badge badge-danger">Cancelled</span>
                                        </c:when>

                                    </c:choose>

                                </th>
                                <th>
                                    <c:if test="${order.status == 0 && order.statusPayment == 0 || order.status == 1 && order.statusPayment == 0}">
                                        <a style="width: 150px" href="/order/cancel/${order.orderId}" type="button" class="btn btn-danger ">Cancel order</a>
                                    </c:if>
                                    <c:if test="${order.status == 1 && order.statusPayment == 0 }">
                                        <a style="width: 150px;margin-top: 10px" href="/payment/${order.orderId}" type="button" class="btn btn-success ">Payment Online</a>
                                    </c:if>
                                    <c:if test="${order.statusPayment == 1 }">
                                        <span style="background-color: #ff9900" class="badge badge-danger">Paid</span>
                                    </c:if>

                                </th>
                            </tr>
                        </c:forEach>
                    </tbody>

                </table>
                <div class="cart_navigation">
                    <a class="prev-btn" href="/">Continue shopping</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- ./page wapper-->