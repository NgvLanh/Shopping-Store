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
                                        <th>Image</th>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Phone</th>
                                        <th>Address</th>
                                        <th>City</th>
                                        <th>Created at</th>
                                        <th>Activated</th>
                                        <th>Un/Lock</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <jsp:useBean id="customers" scope="request" type="java.util.List"/>
                                    <c:forEach var="customer" items="${customers}">
                                        <tr>
                                            <td class="py-1">
                                                <img src="../../../uploads/${customer.image}" alt="${customer.image}">
                                            </td>
                                            <td>${customer.name}</td>
                                            <td>${customer.email}</td>
                                            <td>${customer.phone}</td>
                                            <td title="${customer.address}">${customer.address}</td>
                                            <td>${customer.city}</td>
                                            <td>
                                                <fmt:formatDate value="${customer.createDate}"/>
                                            </td>
                                            <td>${customer.activated ? "Yes" : "No"}</td>
                                            <td onclick="
                                                    window.location.href = '/admin/customer-management/update/' + ${customer.customerId};">
                                                <i
                                                        class="mdi mdi-lock text-black"
                                                        style="font-size: 1.5rem; cursor: pointer"></i>
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
            <%--            <div class="d-sm-flex justify-content-center justify-content-sm-between">--%>
            <%--                <span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright © bootstrapdash.com 2020</span>--%>
            <%--                <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center"> Free <a href="https://www.bootstrapdash.com/" target="_blank">Bootstrap dashboard template</a> from Bootstrapdash.com</span>--%>
            <%--            </div>--%>
        </footer>
    </div>
</div>
<c:if test="${alertCustomer}">
    <script>
        Swal.fire({
            title: "Done!",
            text: "Update activated successfully.",
            icon: "success"
        });
    </script>
</c:if>