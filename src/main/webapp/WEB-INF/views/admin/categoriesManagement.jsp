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
                        <li class="breadcrumb-item"><a href="admin">Admin</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Categories Management</li>
                    </ol>
                </nav>
            </div>
            <div class="row">
                <div class="col-md-6 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title card-description"></h4>
                            <form:form class="forms-sample" method="post" action="/admin/categories-management/create"
                                       modelAttribute="category" enctype="multipart/form-data">

                                <div class="form-group">
                                    <label for="categoryName">Category Name</label>
                                    <form:input path="name" class="form-control" id="categoryName" placeholder="Category name"/>
                                    <form:errors path="name" cssClass="text-danger" cssStyle="font-size: 14px; margin: 4px"/>
                                </div>
                                <div class="form-group">
                                    <label for="categoryDescription">Description</label>
                                    <form:input path="description" class="form-control" id="categoryDescription" placeholder="Description"/>
                                    <form:errors path="description" cssClass="text-danger" cssStyle="font-size: 14px; margin: 4px"/>
                                </div>
                                <button type="submit" class="btn btn-primary mr-2">Submit</button>
                                <button type="reset" class="btn btn-light">Cancel</button>
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
                                        <th>Actions</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="category" items="${categories}">
                                        <tr>
                                            <td>${category.name}</td>
                                            <td>${category.description}</td>
                                            <td>
                                                <a href="/admin/categories-management/${category.categoryId}" class="btn btn-warning btn-sm">Edit</a>
                                                <a href="/admin/categories-management/delete/${category.categoryId}" class="btn btn-danger btn-sm">Delete</a>
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
