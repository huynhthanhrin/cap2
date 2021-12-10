<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<main>
    <div class="container-fluid px-4">
        <h1 class="mt-4">List Category</h1>
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
            <li class="breadcrumb-item active">List Category</li>
        </ol>

        <div class="card mb-4">
            <div class="card-header">
                <%String mes = (String) request.getAttribute("msg"); %>
                <% if(mes != null){ %>
                    <% if("1".equals(mes)){ %>
                        <div class="alert alert-danger">
                            <strong>Category is exist</strong>
                        </div>
                    <%} else {%>
                        <div class="alert alert-success">
                            <strong>Successfully</strong>
                        </div>
                    <%}%>
                <%}%>
                <button type="button" style="width:100px" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModalAddCate">
                    Add
                </button>
            </div>
            <div class="card-body">
                <table id="datatablesSimple">
                    <thead>
                    <tr>
                        <th>STT</th>
                        <th>Name Category</th>
                        <th>Description</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <th>STT</th>
                        <th>Name Category</th>
                        <th>Description</th>
                        <th>Action</th>
                    </tr>
                    </tfoot>
                    <tbody>
                        <c:forEach var="item" items="${listCategory}" varStatus="index">
                        <tr>
                            <td>${index.index + 1}</td>
                            <td>${item.catName}</td>
                            <td><a href="" data-bs-toggle="modal" data-bs-target="#exampleModalDes${item.catId}">Detail</a></td>
                            <td>
                                <button type="button" style="width:100px" class="btn btn-primary" data-bs-toggle="modal"
                                        data-bs-target="#exampleModalUpdate${item.catId}">
                                    Update
                                </button>
                                <button type="button" style="width:100px" class="btn btn-danger" data-bs-toggle="modal"
                                        data-bs-target="#exampleModal${item.catId}">
                                    Delete
                                </button>
                                <div class="modal fade" id="exampleModal${item.catId}" tabindex="-1"
                                     aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">Are you sure delete ?</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                        aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                Category : ${item.catName}
                                                <form action="/admin/category/delete" method="post">
                                                    <input type="hidden" class="form-control" id="id" name="id" value="${item.catId}">
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
                            <div class="modal fade" id="exampleModalDes${item.catId}" tabindex="-1" aria-labelledby="exampleModalLabel"
                                 aria-hidden="true">
                                <div class="modal-dialog modal-l">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Des: ${item.catName}</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <p>${item.description}</p>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        <!-- Modal Update-->
                        <div class="modal fade" id="exampleModalUpdate${item.catId}" tabindex="-1" aria-labelledby="exampleModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Cập nhập</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="/admin/category/update/${item.catId}" method="post">
                                            <div class="row">
                                                <div class="col-12">
                                                    <div class="">
                                                        <label  class="col-form-label">Name Category:</label>
                                                        <input type="text" name="nameCategory" value="${item.catName}" class="form-control" >
                                                    </div>
                                                    <div class="">
                                                        <label  class="col-form-label">Description:</label><br>
                                                        <textarea name="description"  class="form-control" rows="5">${item.description}</textarea>
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" style="width:100px" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                <button type="submit" style="width:100px" class="btn btn-primary">Update </button>
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
                                    <h5 class="modal-title">Add</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form action="/admin/category/add" method="post">
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="">
                                                    <label  class="col-form-label">Name Category:</label>
                                                    <input type="text" name="nameCategory" class="form-control" required/>
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