<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<div class="content-wrapper">
    <div class="main-panel">
        <div class="content-wrapper">
            <div class="page-header">
                <h3 class="page-title">Suppliers Management</h3>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="<spring:url value='/admin' />">Admin</a></li>
                        <li class="breadcrumb-item active" aria-current="page"> Suppliers management </li>
                    </ol>
                </nav>
            </div>
            <div class="row">
                <div class="col-md-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Suppliers management</h4>
                            <form:form method="post" action="/yourSpringControllerMapping" modelAttribute="supplier">
                                <div class="form-group">
                                    <label for="supplierName">Supplier name</label>
                                    <form:input path="supplierName" class="form-control" id="supplierName" placeholder="Tên nhà cung cấp"/>
                                </div>
                                <div class="form-group">
                                    <label for="contactName">Contact name</label>
                                    <form:input path="contactName" class="form-control" id="contactName" placeholder="Tên người liên hệ"/>
                                </div>
                                <div class="form-group">
                                    <label for="contactPhone">Contact Phone</label>
                                    <form:input path="contactPhone" class="form-control" id="contactPhone" placeholder="Số điện thoại liên hệ"/>
                                </div>
                                <div class="form-group">
                                    <label for="contactEmail">Contact Email</label>
                                    <form:input path="contactEmail" class="form-control" id="contactEmail" placeholder="Email liên hệ"/>
                                </div>
                                <div class="form-group">
                                    <label for="address">Address</label>
                                    <form:input path="address" class="form-control" id="address" placeholder="Địa chỉ"/>
                                </div>
                                <div class="form-group">
                                    <label for="city">City</label>
                                    <form:input path="city" class="form-control" id="city" placeholder="Thành phố"/>
                                </div>
                                <button type="submit" class="btn btn-primary mr-2"> Save </button>
                                <button type="reset" class="btn btn-light">Cancel</button>
                            </form:form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
<%--                            <h4 class="card-title">Bảng có thể hover</h4>--%>
                            <p class="card-description"> Suppliers Information
                            </p>
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th>Supplier Name</th>
                                        <th>Contact Name</th>
                                        <th>Contact Phone</th>
                                        <th>Contact Email</th>
                                        <th>Address</th>
                                        <th>City</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>Jacob</td>
                                        <td>NgVanTien</td>
                                        <td>0834619802</td>
                                        <td>
                                           tiennvpc06608@gmail.com
                                        </td>
                                        <td>Xóm Chài</td>
                                        <td>Cần Thơ</td>
                                    </tr>
                                    <tr>
                                        <td>Messsy</td>
                                        <td>NgVanTien</td>
                                        <td>0834619802</td>
                                        <td>
                                            tiennvpc06608@gmail.com
                                        </td>
                                        <td>Xóm Chài</td>
                                        <td>Cần Thơ</td>
                                    </tr>
                                    <tr>
                                        <td>John</td>
                                        <td>NgVanTien</td>
                                        <td>0834619802</td>
                                        <td>
                                            tiennvpc06608@gmail.com
                                        </td>
                                        <td>Xóm Chài</td>
                                        <td>Cần Thơ</td>
                                    </tr>
                                    <tr>
                                        <td>Peter</td>
                                        <td>NgVanTien</td>
                                        <td>0834619802</td>
                                        <td>
                                            tiennvpc06608@gmail.com
                                        </td>
                                        <td>Xóm Chài</td>
                                        <td>Cần Thơ</td>
                                    </tr>
                                    <tr>
                                        <td>Dave</td>
                                        <td>NgVanTien</td>
                                        <td>0834619802</td>
                                        <td>
                                            tiennvpc06608@gmail.com
                                        </td>
                                        <td>Xóm Chài</td>
                                        <td>Cần Thơ</td>
                                    </tr>
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
                <span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Bản quyền © createby@tiennvpc06608@fpt.edu.vn</span>
            </div>
        </footer>
    </div>
</div>
