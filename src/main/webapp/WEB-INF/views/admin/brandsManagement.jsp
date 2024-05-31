<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="content-wrapper">
    <div class="main-panel">
        <div class="content-wrapper">
            <div class="page-header">
                <h3 class="page-title">Brands Management</h3>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/admin/dashboard">Admin</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Brands Management</li>
                    </ol>
                </nav>
            </div>
            <div class="row">
                <div class="col-md-6 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title card-description"></h4>
                            <%--@elvariable id="brand" type="com.poly.entities.Brand"--%>
                            <form:form class="forms-sample" method="post" action="/admin/brands-management/create"
                                       modelAttribute="brand" enctype="multipart/form-data">
                                <form:hidden path="brandId"/>
                                <div class="form-group">
                                    <label for="brandName">Brand Name</label>
                                    <form:input path="name" class="form-control" id="brandName"
                                                placeholder="Brand Name"/>
                                    <form:errors path="name" cssClass="text-danger"
                                                 cssStyle="font-size: 14px; margin: 4px"/>
                                </div>
                                <div class="form-group">
                                    <label for="brandDescription">Description</label>
                                    <form:input path="description" class="form-control" id="brandDescription"
                                                placeholder="Description"/>
                                    <form:errors path="description" cssClass="text-danger"
                                                 cssStyle="font-size: 14px; margin: 4px"/>
                                </div>

                                <button type="submit" class="btn btn-primary mr-2" ${disabledSave}>Save</button>
                                <button type="submit" class="btn btn-behance mr-2" ${disabledUpdate}
                                        formaction="/admin/brands-management/update">Update
                                </button>
                                <button type="button" class="btn btn-light"
                                        onclick="window.location.href='/admin/brands-management'">Cancel
                                </button>
                            </form:form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title card-description">Brands Table</h4>
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th>Brand Name</th>
                                        <th>Description</th>
                                        <th>Actions</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="brand" items="${brands}">
                                        <tr>
                                            <td>${brand.name}</td>
                                            <td>${brand.description}</td>
                                            <td>
                                                <a href="/admin/brands-management/edit/${brand.brandId}"
                                                   class="btn btn-warning btn-sm">Edit</a>
                                                <a href="/admin/brands-management/delete/${brand.brandId}"
                                                   class="btn btn-danger btn-sm">Delete</a>
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
