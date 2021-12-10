<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<main>
    <div class="container-fluid px-4">
        <h1 class="mt-4">Store Management</h1>
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
            <li class="breadcrumb-item active">List Store</li>
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
                <button type="button" style="width:100px" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModalAddCate">
                    Add
                </button>
            </div>
            <div class="card-body">
                <table id="datatablesSimple">
                    <thead>
                    <tr>
                        <th>STT</th>
                        <th>Store name</th>
                        <th>Phone</th>
                        <th>Address</th>
                        <th>Logo</th>
                        <th>Store Type</th>
                        <th>Wards</th>
                        <th>Description</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <th>STT</th>
                        <th>Store name</th>
                        <th>Phone</th>
                        <th>Address</th>
                        <th>Logo</th>
                        <th>Store Type</th>
                        <th>Wards</th>
                        <th>Description</th>
                        <th>Action</th>
                    </tr>
                    </tfoot>
                    <tbody>
                    <c:forEach var="store" items="${storeList}" varStatus="index">
                        <tr>
                            <td><strong>${index.index + 1} </strong></td>
                            <td>${store.storeName}</td>
                            <td>${store.storePhone}</td>
                            <td>${store.address}</td>
                            <td><img style="width: 200px; height: 100px" src="/resources/uploads/${store.logo}" /></td>
                            <td>
                                <c:choose>
                                    <c:when test="${store.storeType == 1}">
                                        Food
                                    </c:when>
                                    <c:otherwise>
                                        Medicine
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>${store.wards.wardName}</td>
                            <td><a href="" data-bs-toggle="modal" data-bs-target="#exampleModalDes${store.storeId}">Detail</a></td>
                            <td>
                                <button type="button" style="width:100px" class="btn btn-primary" data-bs-toggle="modal"
                                        data-bs-target="#exampleModalUpdate${store.storeId}">
                                    Update
                                </button>
                                <button type="button" style="width:100px" class="btn btn-danger" data-bs-toggle="modal"
                                        data-bs-target="#exampleModal${store.storeId}">
                                    Delete
                                </button>
                                <div class="modal fade" id="exampleModal${store.storeId}" tabindex="-1"
                                     aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">Are you sure delete ?</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                        aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                Store : ${store.storeName}
                                                <form action="/admin/store/del/${store.storeId}" method="post">
                                                    <input type="hidden" class="form-control" id="id" name="id" value="${store.storeId}">
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
                        <div class="modal fade" id="exampleModalDes${store.storeId}" tabindex="-1" aria-labelledby="exampleModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog modal-l">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Des: ${store.storeName}</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <p>${store.description}</p>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- Modal Descrip-->
                        <div class="modal fade" id="exampleModalDes${store.storeId}" tabindex="-1" aria-labelledby="exampleModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog modal-l">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Des: ${store.storeName}</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <p>${store.description}</p>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- Modal Update-->
                        <div class="modal fade" id="exampleModalUpdate${store.storeId}" tabindex="-1" aria-labelledby="exampleModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Update Store information</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="/admin/store/update/${store.storeId}" method="post" enctype="multipart/form-data">
                                            <div class="row">
                                                <div class="col-12">
                                                    <div class="">
                                                        <label  class="col-form-label">Store name:</label>
                                                        <input type="text" name="storeName" value="${store.storeName}" class="form-control" required>
                                                    </div>
                                                    <div class="">
                                                        <label  class="col-form-label">Phone:</label>
                                                        <input type="text" name="storePhone" value="${store.storePhone}" class="form-control" required>
                                                    </div>
                                                    <div class="">
                                                        <label  class="col-form-label">Address:</label>
                                                        <input type="text" name="address" value="${store.address}" class="form-control" required>
                                                    </div>
                                                    <div class="">
                                                        <label  class="col-form-label">Logo:</label><br>
                                                        <input type="file" name="fileUpdate" class="form-control" >
                                                        <br>
                                                    </div>
                                                    <div class="">
                                                        <label  class="col-form-label">Store Type:</label><br>

                                                        <select class="form-control" name="storeType" required>
                                                            <c:choose>
                                                                <c:when test="${store.storeType == 1}">
                                                                    <option value="1" selected>Food</option>
                                                                    <option value="2">Medicine</option>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <option value="1">Food</option>
                                                                    <option value="2" selected>Medicine</option>
                                                                </c:otherwise>
                                                            </c:choose>

                                                        </select>
                                                    </div>
                                                    <div class="">
                                                        <label  class="col-form-label">Wards:</label><br>
                                                        <select class="form-control" name="wardId" required>
                                                            <c:forEach items="${wardsList}" var="ward">

                                                                <c:choose>
                                                                    <c:when test="${store.wards.wardsId == ward.wardsId}">
                                                                        <option value="${ward.wardsId}" selected>${ward.wardName}</option>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <option value="${ward.wardsId}">${ward.wardName}</option>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div class="">
                                                        <label  class="col-form-label">Description:</label><br>
                                                        <textarea name="description"  class="form-control" rows="5" required>${store.description}</textarea>
                                                    </div>

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
                                    <h5 class="modal-title">Add Store</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form action="/admin/store/add" method="post" enctype="multipart/form-data">
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="">
                                                    <label  class="col-form-label">Store Name:</label>
                                                    <input type="text" name="storeName" class="form-control" required>
                                                </div>
                                                <div class="">
                                                    <label  class="col-form-label">Store Phone:</label>
                                                    <input type="text" name="storePhone" class="form-control" required>
                                                </div>
                                                <div class="">
                                                    <label  class="col-form-label">Address:</label>
                                                    <input type="text" name="address" class="form-control" required>
                                                </div>
                                                <div class="">
                                                    <label  class="col-form-label">Logo:</label><br>
                                                    <input type="file" name="file" class="form-control" required>
                                                </div>
                                                <div class="">
                                                    <label  class="col-form-label">Store Type</label><br>
                                                    <select class="form-control" name="storeType" required>
                                                        <option value="1">Food</option>
                                                        <option value="2">Medicine</option>
                                                    </select>
                                                </div>
                                                <div class="">
                                                    <label  class="col-form-label">Wards:</label><br>
                                                    <select class="form-control" name="wardId" required>

                                                        <c:forEach items="${wardsList}" var="ward">
                                                            <option value="${ward.wardsId}">${ward.wardName}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <div class="">
                                                    <label  class="col-form-label">Description:</label><br>
                                                    <textarea name="description" id="editor" class="form-control" rows="5" required></textarea>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" style="width:100px" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                            <button type="submit" style="width:100px" class="btn btn-primary">Add </button>
                                        </div>
                                    </form>
                                </div>

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