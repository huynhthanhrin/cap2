<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="com.capstone2.dichomuadich.services.impl.OrderItemsServiceImpl"%>
<%@ page import="java.util.List" %>
<%@ page import="com.capstone2.dichomuadich.domain.OrderItems" %>
<main>
    <div class="container-fluid px-4">
        <h1 class="mt-4">List order</h1>
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
            <li class="breadcrumb-item active">List Order</li>
        </ol>

        <div class="card mb-4">
            <div class="card-header">
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

            </div>
            <div class="card-body">
                <table id="datatablesSimple">
                    <thead>
                    <tr>
                        <th>STT</th>
                        <th>Recipient name</th>
                        <th>Recipient address</th>
                        <th>Recipient phone</th>
                        <th>Store</th>
                        <th>Order time</th>
                        <th>Total</th>
                        <th>Detail</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <th>STT</th>
                        <th>Recipient name</th>
                        <th>Recipient address</th>
                        <th>Recipient phone</th>
                        <th>Store</th>
                        <th>Order time</th>
                        <th>Total</th>
                        <th>Detail</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                    </tfoot>
                    <tbody>
                    <input type="hidden" value="${orderList.size()}" id="dodai" />
                    <c:forEach var="order" items="${orderList}" varStatus="index">
                        <tr>
                            <td><strong>${index.index + 1} </strong></td>
                            <td>${order.recipientName} </td>

                            <td>${order.recipientAddress}</td>
                            <td>${order.recipientPhone}</td>
                            <td>${order.store.storeName}</td>
                            <fmt:formatDate value="${order.orderTime}" var="timeOrder" pattern="HH:mm:ss dd:MM:yyyy"/>
                            <td><fmt:formatDate value="${order.orderTime}" pattern="HH:mm:ss dd-MM-yyyy"/></td>
                            <td><fmt:formatNumber type = "number"
                                                  maxFractionDigits = "3" value = "${order.totalPrice}" /></td>
                            <td><a href="" data-bs-toggle="modal" data-bs-target="#exampleModalDes${order.orderId}">Detail</a></td>
                            <td>    <c:choose>
                                <c:when test="${order.status == 0}">
                                <span style="background-color: #ff9900" class="badge badge-success">Waiting for confirmation</span>
                                </c:when>
                                <c:when test="${order.status == 1 && userLogin.role.roleCode eq 'WARD_MANAGER'}">
                                <span style="background-color: #17a2b8" class="badge badge-danger">Waiting for confirmation from store</span>
                                </c:when>
                                <c:when test="${order.status == 1 && userLogin.role.roleCode eq 'STORE_MANAGER'}">
                                <span style="background-color: #17a2b8" class="badge badge-danger">Confirm Order</span>
                                </c:when>
                                <c:when test="${order.status == 2 && userLogin.role.roleCode eq 'WARD_MANAGER'}">
                                <span style="background-color: #17a2b8" class="badge badge-danger">Waiting preparing orders from store</span>
                                </c:when>
                                <c:when test="${order.status == 2 && userLogin.role.roleCode eq 'STORE_MANAGER'}">
                                <span style="background-color: #007bff" class="badge badge-danger">Preparing Order</span>
                                </c:when>
                                <c:when test="${order.status == 3}">
                                    <span style="background-color: #007bff" class="badge badge-danger">The order is ready
                                </span>
                                </c:when>
                                <c:when test="${order.status == 4}">
                                <span style="background-color: #de7b26" class="badge badge-danger">Orders are being delivered
                                </span>
                                </c:when>
                                <c:when test="${order.status == 5}">
                                <span style="background-color: #28a745" class="badge badge-danger">Successfully</span>

                                </c:when>
                                <c:when test="${order.status == 6}">
                                <span style="background-color: #dc3545" class="badge badge-danger">Cancelled</span>
                                </c:when>
                                </c:choose>
                            <td>
                                <c:if test="${order.status == 0 }">
                                    <a  style="width:100px" class="btn btn-primary" href="${pagecontext.request.contextPath }/order/update-status/1/${order.orderId}" >
                                       Confirm Order
                                    </a>
                                </c:if>
                                <c:if test="${order.status == 1 && userLogin.role.roleCode eq 'STORE_MANAGER'}">
                                    <a  style="width:100px" class="btn btn-warning"  href="${pagecontext.request.contextPath }/order/update-status/2/${order.orderId}">
                                       Confirm Order
                                    </a>
                                </c:if>
                                <c:if test="${order.status == 2  && userLogin.role.roleCode eq 'STORE_MANAGER'}">
                                    <a  style="width:100px" class="btn btn-success" href="${pagecontext.request.contextPath }/order/update-status/3/${order.orderId}">
                                       Complete Preparing
                                    </a>
                                </c:if>
                                <c:if test="${order.status == 3  && userLogin.role.roleCode eq 'WARD_MANAGER'}">
                                    <a  style="width:100px" class="btn btn-success" href="${pagecontext.request.contextPath }/order/update-status/4/${order.orderId}">
                                        Order received from the store
                                    </a>
                                </c:if>
                                <c:if test="${order.status == 4  && userLogin.role.roleCode eq 'WARD_MANAGER'}">
                                    <a  style="width:100px" class="btn btn-success" href="${pagecontext.request.contextPath }/order/update-status/5/${order.orderId}">
                                        Successfully
                                    </a>
                                </c:if>
<%--                                <c:if test="${order.status == 3}">--%>
<%--                                    <a style="width:100px" class="btn btn-primary" href="${pagecontext.request.contextPath }/order/update-status/4/${order.orderId}">--%>
<%--                                        Done--%>
<%--                                    </a>--%>
<%--                                </c:if>--%>
                                <div class="modal fade" id="exampleModal${order.orderId}" tabindex="-1"
                                     aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">Are you sure delete ?</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                        aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                Store : ${order.orderId}
                                                <form action="/admin/product/del/${order.orderId}" method="post">
                                                    <input type="hidden" class="form-control" id="id" name="id" value="${iorder.orderId}">
                                                    <div class="modal-footer" style="margin-top: 20px">
                                                        <button style="width:100px" type="button" class="btn btn-secondary"
                                                                data-bs-dismiss="modal">
                                                            Close
                                                        </button>
                                                        <button style="width:100px" type="submit" class="btn btn-danger">Delete</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <!-- Modal Descrip-->
                        <div class="modal fade" id="exampleModalDes${order.orderId}" tabindex="-1" aria-labelledby="exampleModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog modal-l">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Items List: ${order.orderId}</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <p>

                                            <ul>

                                                <c:forEach items="${orderItemService.findOrderItemsByOrder(order)}" var="orderItem">
                                                    <c:if test="${orderItem.items ne null}">
                                                        <li>${orderItem.items.itemName} x  ${orderItem.itemQuantity} ${orderItem.items.unit}</li>
                                                    </c:if>
                                                    <c:if test="${orderItem.combo ne null}">
                                                        <li>${orderItem.combo.comboName} x  ${orderItem.comboQuantity} </li>
                                                    </c:if>

                                                </c:forEach>

                                            </ul>
                                        </p>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- Modal Descrip-->
                        <div class="modal fade" id="exampleModalDes${order.orderId}" tabindex="-1" aria-labelledby="exampleModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog modal-l">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Des: </h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <p>${item.description}</p>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- Modal Update-->
                        <div class="modal fade" id="exampleModalUpdate${order.orderId}" tabindex="-1" aria-labelledby="exampleModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Update Store information</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="/admin/product/update/${order.orderId}" method="post" enctype="multipart/form-data">
                                            <div class="row">
                                                <div class="col-12">
                                                    <div class="">
                                                        <label  class="col-form-label">Item Name:</label>
                                                        <input type="text" value="" name="itemName" class="form-control" required>
                                                    </div>
                                                    <div class="">
                                                        <label  class="col-form-label">Price:</label>
                                                        <input type="text" value="" name="price" class="form-control" required>
                                                    </div>
                                                    <div class="">
                                                        <label  class="col-form-label">Quantity:</label>
                                                        <input type="number" value="" name="quantity" class="form-control" required>
                                                    </div>
                                                    <div class="">
                                                        <label  class="col-form-label">Image:</label><br>
                                                        <input type="file"  name="file" class="form-control" >
                                                    </div>
                                                    <div class="">
                                                        <label  class="col-form-label">Unit:</label><br>
                                                        <input type="text" value="$" name="unit" class="form-control" required >
                                                    </div>
<%--                                                    <div class="">--%>
<%--                                                        <label  class="col-form-label">Category:</label><br>--%>
<%--                                                        <select class="form-control" name="categoryId" required>--%>
<%--                                                            <option value="${item.category.catId}">${item.category.catName}</option>--%>
<%--                                                            <c:forEach items="${listCategorys}" var="category">--%>
<%--                                                                <option value="${category.catId}">${category.catName}</option>--%>
<%--                                                            </c:forEach>--%>
<%--                                                        </select>--%>
<%--                                                    </div>--%>
<%--                                                    <div class="">--%>
<%--                                                        <label  class="col-form-label">Description:</label><br>--%>
<%--                                                        <textarea name="description" id="editor${index.index + 1}" class="form-control" rows="5" required>${item.description}</textarea>--%>
<%--                                                    </div>--%>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" style="width:100px" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                <button type="submit" style="width:100px" class="btn btn-primary">Update</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <!-- Modal img-->
                    <div class="modal fade" id="exampleModalImg" tabindex="-1" aria-labelledby="exampleModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog modal-m">
                            <div class="modal-content">
                                <div class="modal-body">
                                    <img style="width: 460px !important;height: 580px !important;" src="" class="img-fluid">
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Modal img-->
                    <div class="modal fade" id="exampleModalView1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-xl">
                            <div class="modal-content">
                                <div class="modal-body">
                                    <iframe width="1104" height="621" src="https://www.youtube.com/embed/jluSu8Rw6YE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Modal view-->

                    <!-- Modal Descrup-->
                    <!-- Modal Add-->
                    <div class="modal fade" id="exampleModalAddCate" tabindex="-1" aria-labelledby="exampleModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Add Product</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form action="/admin/product/add" method="post" enctype="multipart/form-data">
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="">
                                                    <label  class="col-form-label">Item Name:</label>
                                                    <input type="text" name="itemName" class="form-control" required>
                                                </div>
                                                <div class="">
                                                    <label  class="col-form-label">Price:</label>
                                                    <input type="text" name="price" class="form-control" required>
                                                </div>
                                                <div class="">
                                                    <label  class="col-form-label">Quantity:</label>
                                                    <input type="number" name="quantity" class="form-control" required>
                                                </div>
                                                <div class="">
                                                    <label  class="col-form-label">Image:</label><br>
                                                    <input type="file" name="file" class="form-control" required>
                                                </div>
                                                <div class="">
                                                    <label  class="col-form-label">Unit:</label><br>
                                                    <input type="text" name="unit" class="form-control" required>
                                                </div>
                                                <div class="">
                                                    <label  class="col-form-label">Unit:</label><br>
                                                    <input type="text" name="unit" class="form-control" required>
                                                </div>
                                                <div class="">
                                                    <label  class="col-form-label">Category:</label><br>
<%--                                                    <select class="form-control" name="categoryId" required>--%>
<%--                                                        <option value="0">--Choose Category--</option>--%>
<%--                                                        <c:forEach items="${listCategorys}" var="category">--%>
<%--                                                            <option value="${category.catId}">${category.catName}</option>--%>
<%--                                                        </c:forEach>--%>
<%--                                                    </select>--%>
                                                </div>
                                                <div class="">
                                                    <label  class="col-form-label">Description:</label><br>
                                                    <textarea name="description" id="editor" cols="30"
                                                              rows="30"></textarea>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" style="width:100px" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                            <button type="submit" style="width:100px" class="btn btn-primary">Add </button>
                                        </div>
                                    </form>
                                </div>
                                <script>
                                    ClassicEditor.create(document.querySelector('#editor')).then(eidt => {
                                        console.log("da" + eidt);
                                    })
                                        .catch(error => {
                                            console.error(error);
                                        });
                                </script>
                                <script>
                                    var dodai = document.getElementById("dodai").value;
                                    var a = parseInt(dodai);
                                    for(var i = 1;i<=a+10;i++){
                                        var name = "#editor"  + i
                                        ClassicEditor.create(document.querySelector(name)).then(eidt => {
                                            console.log("da" + eidt);
                                        })
                                            .catch(error => {
                                                console.error(error);
                                            });
                                    }
                                </script>
                            </div>
                        </div>
                    </div>
                    <!-- Modal Add-->

                    <!-- Modal Update-->

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</main>