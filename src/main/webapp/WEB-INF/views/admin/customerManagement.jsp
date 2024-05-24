<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/18/2024
  Time: 12:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="content-wrapper">
    <div class="main-panel">
        <div class="content-wrapper">
            <div class="page-header">
                <h3 class="page-title">Customer management</h3>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/admin/dashboard">Admin</a></li>
                        <li class="breadcrumb-item active" aria-current="page"> Customer management</li>
                    </ol>
                </nav>
            </div>
            <div class="row">
                <div class="col-lg-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Customer Table</h4>
                            <p class="card-description">
                                All of customers
                            </p>
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                    <tr>
                                        <th>User</th>
                                        <th>First name</th>
                                        <th>Email</th>
                                        <th>Phone</th>
                                        <th>Address</th>
                                        <th>City</th>
                                        <th>Created at</th>
<%--                                        <th>Update</th>--%>
                                        <th>Delete</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="customer" items="${customers}">
                                        <tr>
                                            <td class="py-1">
                                                <img src="../../assets/images/faces-clipart/${customer.fileName}" alt="image">
                                            </td>
                                            <td>${customer.firstName}</td>
                                            <td>${customer.email}</td>
                                            <td>${customer.phone}</td>
                                            <td>${customer.address}</td>
                                            <td>${customer.city}</td>
                                            <td><fmt:formatDate value="${customer.createdDate}" pattern="dd/MM/yyyy"/></td>
<%--                                            <td><i class="mdi mdi-table-edit" style="font-size: 1.5rem; color: darkgreen; cursor: pointer"></i></td>--%>
                                            <td onclick="confirmDelete(this)"><i class="mdi mdi-delete" style="font-size: 1.5rem; color: red; cursor: pointer"></i></td>
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
            <%--            <div class="d-sm-flex justify-content-center justify-content-sm-between">--%>
            <%--                <span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright © bootstrapdash.com 2020</span>--%>
            <%--                <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center"> Free <a href="https://www.bootstrapdash.com/" target="_blank">Bootstrap dashboard template</a> from Bootstrapdash.com</span>--%>
            <%--            </div>--%>
        </footer>
    </div>
</div>
<script>
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