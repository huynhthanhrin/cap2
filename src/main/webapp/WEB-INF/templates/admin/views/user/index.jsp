<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<main>
    <div class="container-fluid px-4">
        <h1 class="mt-4">${role.roleName} Management</h1>
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
            <li class="breadcrumb-item active">List ${role.roleName}</li>
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
                <button type="button" style="width:100px" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModalAddUser">
                    Add
                </button>
            </div>
            <div class="card-body">
                <table id="datatablesSimple">
                    <thead>
                    <tr>
                        <th>STT</th>
                        <th>Name</th>
                        <c:if test="${role.roleCode == 'CLIENT'}">
                            <th>Gender</th>
                        </c:if>
                        <th>Avatar</th>
                        <th>Username</th>
                        <c:if test="${role.roleCode == 'CLIENT'}">
                             <th>Date of birth</th>
                        </c:if>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Address</th>
                        <th>
                            <c:if test="${role.roleCode == 'STORE_MANAGER'}">
                                Store Manage
                            </c:if>
                            <c:if test="${role.roleCode == 'WARD_MANAGER'}">
                                Ward Manage
                            </c:if>
                        </th>
                        <th>Active</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <th>STT</th>
                        <th>Name</th>
                        <c:if test="${role.roleCode == 'CLIENT'}">
                            <th>Gender</th>
                        </c:if>
                        <th>Avatar</th>
                        <th>Username</th>
                        <c:if test="${role.roleCode == 'CLIENT'}">
                            <th>Date of birth</th>
                        </c:if>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Address</th>
                        <th>
                            <c:if test="${role.roleCode == 'STORE_MANAGER'}">
                                Store Manage
                            </c:if>
                            <c:if test="${role.roleCode == 'WARD_MANAGER'}">
                                Ward Manage
                            </c:if>
                        </th>
                        <th>Active</th>
                        <th>Action</th>
                    </tr>
                    </tfoot>
                    <tbody>
                    <c:forEach var="user" items="${users}" varStatus="index">
                        <tr>
                            <td><strong>${index.index + 1} </strong></td>
                            <td>${user.firstName} ${user.lastName}</td>
                            <c:if test="${role.roleCode == 'CLIENT'}">\
                                <td>${user.gender}</td>
                            </c:if>
                            <td>${user.avatar}</td>
                            <td>${user.username}</td>
                            <c:if test="${role.roleCode == 'CLIENT'}">
                                <td>${user.dateOfBirth}</td>
                            </c:if>
                            <td>${user.phoneNumber}</td>
                            <td>${user.email}</td>
                            <td>${user.address}</td>
                            <td>
                                <c:if test="${role.roleCode == 'STORE_MANAGER'}">
                                    ${user.store.storeName}
                                </c:if>
                                <c:if test="${role.roleCode == 'WARD_MANAGER'}">
                                    ${user.wards.wardName}
                                </c:if>
                            </td>
                            <td>
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" ${user.status == 1 ? "checked" : ""}>
                                </div>

<%--                        <td><img style="width: 200px; height: 100px" src="/resources/uploads/${store.logo}" /></td>--%>

                            <td>
                                <button type="button" style="width:100px" class="btn btn-primary" data-bs-toggle="modal"
                                        data-bs-target="#exampleModalUpdate${user.userId}">
                                    Update
                                </button>
                                <button type="button" style="width:100px" class="btn btn-danger" data-bs-toggle="modal"
                                        data-bs-target="#exampleModal${user.userId}">
                                    Delete
                                </button>
                                <div class="modal fade" id="exampleModal${user.userId}" tabindex="-1"
                                     aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">Are you sure delete ?</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                        aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                User : ${user.username}
                                                <form action="/admin/user/del/${user.userId}" method="post">
                                                    <input type="hidden" class="form-control" id="id" name="id" value="${user.userId}">
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
                        <div class="modal fade" id="exampleModalDes${user.userId}" tabindex="-1" aria-labelledby="exampleModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog modal-l">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Des: ${user.username}</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
<%--                                    <div class="modal-body">--%>
<%--                                        <p>${store.description}</p>--%>
<%--                                    </div>--%>

                                </div>
                            </div>
                        </div>
<%--                        <!-- Modal Update-->--%>
                            <div class="modal fade" id="exampleModalUpdate${user.userId}" tabindex="-1" aria-labelledby="exampleModalLabel"
                                 aria-hidden="true">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Update user information</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <form action="/admin/user/update/${user.userId}" method="post">
                                                <div class="row">
                                                    <div class="col-12">
                                                        <div class="">
                                                            <label  class="col-form-label">First name:</label>
                                                            <input type="text" name="firstName" value="${user.firstName}" class="form-control"  required>
                                                        </div>
                                                        <div class="">
                                                            <label  class="col-form-label">Last name:</label>
                                                            <input class="form-control"  type="text" name="lastName" value="${user.lastName}" required>
                                                        </div>
                                                        <div class="">
                                                            <label  class="col-form-label">Username:</label>
                                                            <input class="form-control"  type="text" name="username" value="${user.username}" required>
                                                        </div>
                                                        <div class="">
                                                            <label  class="col-form-label">Password:</label>
                                                            <input class="form-control"  type="text" name="password" value="" >
                                                        </div>
                                                        <c:if test="${role.roleCode == 'CLIENT'}">
                                                            <div class="form-con">
                                                                <label  class="col-form-label">Date of birth:</label>
                                                                <input class="form-control"  type="date" name="birthday" value="${user.dateOfBirth}" required>
                                                            </div>
                                                            <div class="">
                                                                <label  class="col-form-label">Gender:</label>
                                                                <select class="form-control" name="gender" required>
                                                                    <option value="Male">Male</option>
                                                                    <option value="Female">Female</option>
                                                                </select>
                                                            </div>
                                                        </c:if>
                                                        <div class="">
                                                            <label  class="col-form-label">Phone number:</label>
                                                            <input class="form-control"  type="text" name="phoneNumber" value="${user.phoneNumber}" required>
                                                        </div>
                                                        <div class="form-con">
                                                            <label  class="col-form-label">Email:</label>
                                                            <input class="form-control"  type="text" name="email" value="${user.email}" required>
                                                        </div>
                                                        <c:if test="${role.roleCode == 'STORE_MANAGER'}">
                                                            <div class="">
                                                                <label  class="col-form-label">Store:</label><br>
                                                                <select class="form-control" name="storeId" required>
                                                                    <option value="0">--Choose Store--</option>
                                                                    <c:forEach items="${storeList}" var="store">
                                                                        <c:choose>
                                                                            <c:when test="${store.storeId == user.store.storeId}">
                                                                                <option selected value="${store.storeId}">${store.storeName}</option>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <option value="${store.storeId}">${store.storeName}</option>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                        </c:if>

                                                        <c:if test="${role.roleCode == 'WARD_MANAGER'}">
                                                            <div class="">
                                                                <label  class="col-form-label">Ward:</label><br>
                                                                <select class="form-control" name="wardId" required>
                                                                    <option value="0">--Choose Ward--</option>
                                                                    <c:forEach items="${wardsList}" var="ward">
                                                                        <c:choose>
                                                                            <c:when test="${ward.wardsId == user.wards.wardsId}">
                                                                                <option selected value="${ward.wardsId}">${ward.wardName}</option>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <option value="${ward.wardsId}">${ward.wardName}</option>
                                                                            </c:otherwise>
                                                                        </c:choose>

                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                        </c:if>

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
                             </div>
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
                    <div class="modal fade" id="exampleModalAddUser" tabindex="-1" aria-labelledby="exampleModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Add ${role.roleName}</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form action="/admin/user/add/${role.roleId}" method="post">
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="">
                                                    <label  class="col-form-label">First name:</label>
                                                    <input type="text" name="firstName" class="form-control" required>
                                                </div>
                                                <div class="">
                                                    <label  class="col-form-label">Last name:</label>
                                                    <input type="text" name="lastName" class="form-control" required>
                                                </div>
                                                <div class="">
                                                    <label  class="col-form-label">Username:</label>
                                                    <input type="text" name="username" class="form-control" required>
                                                </div>
                                                <div class="">
                                                    <label  class="col-form-label">Password:</label>
                                                    <i>(Automatically generate password if left blank)</i>
                                                    <input type="text" name="password" class="form-control" >
                                                </div>
                                                <div class="">
                                                    <label  class="col-form-label">Phone:</label>
                                                    <input type="text" name="phoneNumber" class="form-control" required>
                                                </div>
                                                <div class="">
                                                    <label  class="col-form-label">Email:</label>
                                                    <input type="text" name="email" class="form-control" required>
                                                </div>
                                                <c:if test="${role.roleCode == 'STORE_MANAGER'}">
                                                    <div class="">
                                                        <label  class="col-form-label">Store:</label><br>
                                                        <select class="form-control" name="storeId" required>
                                                            <option value="0">--Choose Store--</option>
                                                            <c:forEach items="${storeList}" var="store">
                                                                <option value="${store.storeId}">${store.storeName}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </c:if>

                                                <c:if test="${role.roleCode == 'WARD_MANAGER'}">
                                                    <div class="">
                                                        <label  class="col-form-label">Ward:</label><br>
                                                        <select class="form-control" name="wardId" required>
                                                            <option value="0">--Choose Ward--</option>
                                                            <c:forEach items="${wardsList}" var="ward">
                                                                <option value="${ward.wardsId}">${ward.wardName}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </c:if>
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
                    <!-- Modal Update-->

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</main>