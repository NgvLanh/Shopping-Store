<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="content-wrapper">
    <div class="main-panel">
        <div class="content-wrapper">
            <div class="page-header">
                <h3 class="page-title">Categories Management</h3>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/admin/dashboard">Admin</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Categories Management</li>
                    </ol>
                </nav>
            </div>
            <div class="row">
                <div class="col-md-6 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title card-description"></h4>
                            <%--@elvariable id="category" type="com.poly.entities.Category"--%>
                            <form:form class="forms-sample" method="post" action="/admin/categories-management/create"
                                       modelAttribute="category" enctype="multipart/form-data">
                                <form:hidden path="categoryId"></form:hidden>
                                <div class="form-group">
                                    <label for="categoryName">Category Name</label>
                                    <form:input path="name" class="form-control" id="categoryName"
                                                placeholder="Category name"/>
                                    <form:errors path="name" cssClass="text-danger"
                                                 cssStyle="font-size: 14px; margin: 4px"/>
                                </div>
                                <div class="form-group">
                                    <label for="categoryDescription">Description</label>
                                    <form:input path="description" class="form-control" id="categoryDescription"
                                                placeholder="Description"/>
                                    <form:errors path="description" cssClass="text-danger"
                                                 cssStyle="font-size: 14px; margin: 4px"/>
                                </div>

                                <button type="submit" class="btn btn-primary mr-2"${disabledSave}>Save</button>
                                <button type="submit" class="btn btn-behance mr-2" ${disabledUpdate}
                                        formaction="/admin/categories-management/update/${category.categoryId}">Update
                                </button>
                                <button type="button" class="btn btn-light"
                                        onclick="window.location.href='/admin/categories-management'">Cancel
                                </button>
                            </form:form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title card-description">Categories Table</h4>
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th>Category Name</th>
                                        <th>Description</th>
                                        <th>Update</th>
                                        <th>Delete</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="category" items="${categories}">
                                        <tr>
                                            <td>${category.name}</td>
                                            <td>${category.description}</td>
                                            <td>
                                                <a href="/admin/categories-management/edit/${category.categoryId}">
                                                    <i class="mdi mdi-table-edit"
                                                       style="font-size: 1.5rem; color: darkgreen"></i></a>
                                            </td>
                                            <td>
                                                <a onclick="confirmDelete(${category.categoryId})">
                                                    <i class="mdi mdi-delete"
                                                       style="font-size: 1.5rem; color: red; cursor: pointer"></i>
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
    <c:if test="${msgDeleteProduct}">
    Swal.fire({
        title: "Something went wrong?",
        text: "Product data still exists so cannot be deleted!",
        icon: "error",
        confirmButtonText: "Ok"
    }).then((result) => {
        if (result.isConfirmed) {
            window.location.href = `/admin/categories-management`;
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
                    window.location.href = `/admin/categories-management/delete/` + id;
                });
            }
        });
    }
</script>