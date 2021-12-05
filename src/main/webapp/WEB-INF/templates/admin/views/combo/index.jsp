<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<main>
    <div class="container-fluid px-4">
        <h1 class="mt-4">List Combo</h1>
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
            <li class="breadcrumb-item active">List Combo</li>
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
                        <th>Name Combo</th>
                        <th>Image</th>
                        <th>Price</th>
                        <th>Description</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <th>STT</th>
                        <th>Name Combo</th>
                        <th>Description</th>
                        <th>Action</th>
                    </tr>
                    </tfoot>
                    <tbody>
                    <input type="hidden" value="${listCombo.size()}" id="dodai" />
                    <c:forEach var="item" items="${listCombo}" varStatus="index">
                        <tr>
                            <td>${index.index + 1}</td>
                            <td>${item.comboName}</td>
                            <td><img style="width: 200px; height: 100px" src="/resources/uploads/${item.image}" /></td>
                            <td>${item.price}</td>
                            <td><a href="" data-bs-toggle="modal" data-bs-target="#exampleModalDes${item.comboId}">Detail</a></td>
                            <td>
                                <button type="button" style="width:100px" class="btn btn-primary" data-bs-toggle="modal"
                                        data-bs-target="#exampleModalUpdate${item.comboId}">
                                    Update
                                </button>
                                <button type="button" style="width:100px" class="btn btn-danger" data-bs-toggle="modal"
                                        data-bs-target="#exampleModal${item.comboId}">
                                    Delete
                                </button>
                                <div class="modal fade" id="exampleModal${item.comboId}" tabindex="-1"
                                     aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">Are you sure delete ?</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                        aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                Category : ${item.comboName}
                                                <form action="/admin/combo/del/${item.comboId}" method="post" >
                                                    <input type="hidden" class="form-control" id="id" name="id" value="${item.comboId}">
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
                        <div class="modal fade" id="exampleModalDes${item.comboId}" tabindex="-1" aria-labelledby="exampleModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog modal-l">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Des: ${item.comboName}</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <p>${item.description}</p>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- Modal Update-->
                        <div class="modal fade" id="exampleModalUpdate${item.comboId}" tabindex="-1" aria-labelledby="exampleModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Cập nhập</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="/admin/combo/update/${item.comboId}" method="post" enctype="multipart/form-data">
                                            <div class="row">
                                                <div class="col-12">
                                                    <div class="">
                                                        <label  class="col-form-label">Name Combo:</label>
                                                        <input type="text" name="comboName" value="${item.comboName}" class="form-control" required>
                                                    </div>
                                                    <div class="">
                                                        <label  class="col-form-label">Price:</label>
                                                        <input type="text" name="price" value="${item.price}" class="form-control" required >
                                                    </div>
                                                    <div class="">
                                                        <label  class="col-form-label">Image:</label><br>
                                                        <input type="file"  name="file" class="form-control"  >
                                                    </div>
                                                    <div class="">
                                                        <label  class="col-form-label">Description:</label><br>
                                                        <textarea name="description"  class="form-control" id="editor${index.index + 1}" cols="30"
                                                                  rows="30">${item.description}</textarea>
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
                                    <form action="/admin/combo/add" method="post" enctype="multipart/form-data">
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="">
                                                    <label  class="col-form-label">Name Combo:</label>
                                                    <input type="text" name="comboName" class="form-control" required>
                                                </div>
                                                <div class="">
                                                    <label  class="col-form-label">Price:</label>
                                                    <input type="text" name="price" class="form-control" required >
                                                </div>
                                                <div class="">
                                                    <label  class="col-form-label">Image:</label><br>
                                                    <input type="file"  name="file" class="form-control" required>
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

                            </div>
                        </div>
                    </div>
                    <!-- Modal Add-->

                    <!-- Modal Update-->

                    </tbody>
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
                </table>
            </div>
        </div>
    </div>
</main>