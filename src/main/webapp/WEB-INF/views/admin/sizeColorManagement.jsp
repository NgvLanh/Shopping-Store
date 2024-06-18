<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/18/2024
  Time: 12:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="content-wrapper">
    <div class="main-panel">
        <div class="content-wrapper">
            <div class="page-header">
                <h3 class="page-title">Size & color management</h3>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/admin/dashboard">Admin</a></li>
                        <li class="breadcrumb-item active" aria-current="page"> Size & color management</li>
                    </ol>
                </nav>
            </div>
            <div class="row">
                <div class="col-md-6 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title card-description"></h4>

                            <%--@elvariable id="color" type=""--%>
                            <form:form class="forms-sample row" method="post" action="/admin/size-color-management/create-color"
                                       modelAttribute="color" enctype="multipart/form-data">
                                <form:hidden path="colorId"></form:hidden>
                                <div class="form-group col-md-12">
                                    <label for="color">Color</label>
                                    <form:input path="colorName" type="text" class="form-control" id="color"
                                                placeholder="Color name"/>
                                    <form:errors path="colorName" cssClass="text-danger" cssStyle="font-size: 14px; margin: 4px"/>
                                    <span Class="text-danger" Style="font-size: 14px; margin: 4px">${msg}</span>
                                </div>
                                <div class="form-group col-md-12">
                                    <label for="colorDescription">Description</label>
                                    <form:input path="colorDescription" type="text" class="form-control" id="colorDescription"
                                                placeholder="Description"/>
                                    <form:errors path="colorDescription" cssClass="text-danger" cssStyle="font-size: 14px; margin: 4px"/>
                                </div>


                                <button type="submit" class="btn btn-primary mr-2" ${disabledSaveColor}>Save</button>
                                <button type="submit" class="btn btn-behance mr-2" ${disabledUpdate}
                                        formaction="/admin/size-color-management/update-color">Update
                                </button>
                                <button type="button" class="btn btn-light"
                                        onclick="window.location.href='/admin/size-color-management'">Cancel
                                </button>
                            </form:form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title card-description ">Color Table</h4>
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th>Color</th>
                                        <th>Description</th>
                                        <th>Actions</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="color" items="${colors}">
                                        <tr>
                                            <td>${color.colorName}</td>
                                            <td>${color.colorDescription}</td>
                                            <td>
                                                <!-- Button trigger modal -->
                                                <a href="/admin/size-color-management/edit-color/${color.colorId}">
                                                    <i class="mdi mdi-table-edit" data-toggle="modal"
                                                       data-target="#staticBackdrop"
                                                       style="font-size: 1.5rem; color: coral"></i>
                                                </a>
                                            </td>
                                            <td>
                                                <a onclick="confirmDelete(${color.colorId})">
                                                    <i class="mdi mdi-delete"
                                                       style="font-size: 1.5rem; color: red"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <hr>
                <div class="col-md-6 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title"></h4>
                            <p class="card-description"></p>
                            <%--@elvariable id="size" type=""--%>
                            <form:form class="forms-sample row" method="post" action="/admin/size-color-management/create-size"
                                       modelAttribute="size">
                                <form:hidden path="sizeId"/>
                                <div class="form-group col-md-12">
                                    <label for="size">Size</label>
                                    <form:input path="sizeName" type="text" class="form-control" id="size"
                                                placeholder="Size"/>
                                    <form:errors path="sizeName" cssClass="text-danger"
                                                 cssStyle="font-size: 14px; margin: 4px"/>
                                    <span Class="text-danger" Style="font-size: 14px; margin: 4px">${msg1   }</span>

                                </div>
                                <div class="form-group col-md-12">
                                    <label for="sizeDescription">Description</label>
                                    <form:input path="sizeDescription" type="text" class="form-control" id="sizeDescription"
                                                placeholder="Size"/>
                                    <form:errors path="sizeDescription" cssClass="text-danger"
                                                 cssStyle="font-size: 14px; margin: 4px"/>
                                </div>

                                <button type="submit" class="btn btn-primary mr-2" ${disabledSaveSize}>Save</button>
                                <button type="submit" class="btn btn-behance mr-2" ${disabledUpdate}
                                        formaction="/admin/size-color-management/update-size">Update
                                </button>
                                <button type="button" class="btn btn-light"
                                        onclick="window.location.href='/admin/size-color-management'">Cancel
                                </button>
                            </form:form>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title card-description ">Size Table</h4>
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th>Size</th>
                                        <th>Description</th>
                                        <th>Actions</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="size" items="${sizes}">
                                        <tr>
                                            <td>${size.sizeName}</td>
                                            <td>${size.sizeDescription}</td>
                                            <td>
                                                <!-- Button trigger modal -->
                                                <a href="/admin/size-color-management/edit-size/${size.sizeId}">
                                                    <i class="mdi mdi-table-edit" data-toggle="modal"
                                                       data-target="#staticBackdrop"
                                                       style="font-size: 1.5rem; color: coral"></i>
                                                </a>
                                            </td>
                                            <td>
                                                <a onclick="confirmDelete2(${size.sizeId})">
                                                    <i class="mdi mdi-delete"
                                                       style="font-size: 1.5rem; color: red"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer class="footer">
            <div class="d-sm-flex justify-content-center justify-content-sm-between">
                <span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Design by Mr. Teo</span>
            </div>
        </footer>
    </div>
</div>
<script>
    //
    <c:if test="${msgDeleteColor}">
    Swal.fire({
        title: "Something went wrong?",
        text: "Color data still exists so cannot be deleted!",
        icon: "error",
        confirmButtonText: "Ok"
    }).then((result) => {
        if (result.isConfirmed) {
            window.location.href = `/admin/size-color-management`;
        }
    });
    </c:if>
    // confirm delete
    const confirmDelete = (id) => {
        Swal.fire({
            title: "Are you sure?",
            text: "You won't be able to revert this!",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Yes, delete it!"
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire({
                    title: "Deleted!",
                    text: "Your file has been deleted.",
                    icon: "success"
                }).then(() => {
                    window.location.href = `/admin/size-color-management/delete-color/` + id;
                });
            }
        });
    }
    <c:if test="${msgDeleteSize}">
    Swal.fire({
        title: "Something went wrong?",
        text: "Size data still exists so cannot be deleted!",
        icon: "error",
        confirmButtonText: "Ok"
    }).then((result) => {
        if (result.isConfirmed) {
            window.location.href = `/admin/size-color-management`;
        }
    });
    </c:if>
    // confirm delete
    const confirmDelete2 = (id) => {
        Swal.fire({
            title: "Are you sure?",
            text: "You won't be able to revert this!",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Yes, delete it!"
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire({
                    title: "Deleted!",
                    text: "Your file has been deleted.",
                    icon: "success"
                }).then(() => {
                    window.location.href = `/admin/size-color-management/delete-size/` + id;
                });
            }
        });
    }
</script>