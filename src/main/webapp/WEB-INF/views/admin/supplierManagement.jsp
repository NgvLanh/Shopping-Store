<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="content-wrapper">
    <div class="main-panel">
        <div class="content-wrapper">
            <div class="page-header">
                <h3 class="page-title">Suppliers Management</h3>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/admin/dashboard">>Admin</a></li>
                        <li class="breadcrumb-item active" aria-current="page"> Suppliers management</li>
                    </ol>
                </nav>
            </div>
            <div class="row">
                <div class="col-md-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Suppliers management</h4>
                            <%--@elvariable id="supplier" type="com.poly.entities.Supplier"--%>
                            <form:form method="post"
                                       modelAttribute="supplier">
                                <div class="form-group">
                                    <label for="supplierName">Supplier name</label>
                                    <form:input path="supplierName" class="form-control" id="supplierName"
                                                placeholder="Supplier name"/>
                                    <form:errors path="supplierName"
                                                 cssClass="text-danger"
                                                 cssStyle="font-size: 14px; margin: 4px"/>
                                </div>
                                <div class="form-group">
                                    <label for="contactName">Contact name</label>
                                    <form:input path="contactName" class="form-control" id="contactName"
                                                placeholder="Contact name"/>
                                    <form:errors path="contactName"
                                                 cssClass="text-danger"
                                                 cssStyle="font-size: 14px; margin: 4px"/>
                                </div>
                                <div class="form-group">
                                    <label for="contactPhone">Contact Phone</label>
                                    <form:input path="contactPhone" class="form-control" id="contactPhone" type="number"
                                                placeholder="Contact Phone"/>
                                    <form:errors path="contactPhone" cssClass="text-danger"
                                                 cssStyle="font-size: 14px; margin: 4px"/>
                                </div>
                                <div class="form-group">
                                    <label for="contactEmail">Contact Email</label>
                                    <form:input path="contactEmail" class="form-control" id="contactEmail"
                                                placeholder="Contact Email"/>
                                    <form:errors path="contactEmail" cssClass="text-danger"
                                                 cssStyle="font-size: 14px; margin: 4px"/>
                                </div>
                                <div class="form-group">
                                    <label for="address">Address</label>
                                    <form:input path="address" class="form-control" id="address" placeholder="Address"/>
                                    <form:errors path="address" cssClass="text-danger"
                                                 cssStyle="font-size: 14px; margin: 4px"/>
                                </div>
                                <div class="form-group">
                                    <label for="city">City</label>
                                    <form:input path="city" class="form-control" id="city" placeholder="City"/>
                                    <form:errors path="city" cssClass="text-danger"
                                                 cssStyle="font-size: 14px; margin: 4px"/>
                                </div>
                                <button type="submit" class="btn btn-primary mr-2" id="save" formaction="${formAction}">
                                    Save
                                </button>
                                <button type="reset" class="btn btn-light"
                                        onclick="window.location.href='/admin/supplier-management'">Cancel
                                </button>
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
                                        <th>Update</th>
                                        <th>Delete</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="supplier" items="${suppliers}">
                                        <tr>
                                            <td>${supplier.supplierName}</td>
                                            <td>${supplier.contactName}</td>
                                            <td>${supplier.contactPhone}</td>
                                            <td>${supplier.contactEmail}</td>
                                            <td>${supplier.address}</td>
                                            <td>${supplier.city}</td>
                                            <td>
                                                <a href="/admin/supplier-management/edit/${supplier.id}">
                                                    <i class="mdi mdi-table-edit"
                                                       style="font-size: 1.5rem; color: darkgreen"></i>
                                                </a>
                                            </td>
                                            <td onclick="confirmDelete(this)"><i class="mdi mdi-delete"
                                                                                 style="font-size: 1.5rem; color: red"></i>
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
        <c:if test="${createSuccess}">
            <script>
                Swal.fire({
                    icon: "success",
                    title: "${status} product successfully.",
                });
            </script>
        </c:if>
        <script>
            const fillData = (e) => {
                console.log(e)
            }
            const confirmDelete = (e) => {
                console.log(e)
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
                        });
                    }
                });
            }
        </script>
        <footer class="footer">
            <div class="d-sm-flex justify-content-center justify-content-sm-between">
                <span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Bản quyền © createby@tiennvpc06608@fpt.edu.vn</span>
            </div>
        </footer>
    </div>
</div>
