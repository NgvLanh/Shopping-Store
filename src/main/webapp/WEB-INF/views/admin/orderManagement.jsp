<%--
Created by IntelliJ IDEA.
User: Admin
Date: 5/18/2024
Time: 12:27 PM
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="content-wrapper">
    <div class="main-panel">
        <div class="content-wrapper">
            <div class="page-header">
                <h3 class="page-title">Orders management</h3>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/admin/dashboard">Admin</a></li>
                        <li class="breadcrumb-item active" aria-current="page"> Orders management</li>
                    </ol>
                </nav>
            </div>
            <div class="row">
                <div class="col-md-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Order form</h4>
                            <p class="card-description">Update order</p>
                            <%--@elvariable id="order" type="com.poly.entities.Order"--%>
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link active" id="home-tab" data-toggle="tab" data-target="#home"
                                            type="button" role="tab" aria-controls="home" aria-selected="true">Wait for
                                        confirmation
                                    </button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="profile-tab" data-toggle="tab" data-target="#profile"
                                            type="button" role="tab" aria-controls="profile" aria-selected="false">
                                        Confirm
                                    </button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="contact-tab" data-toggle="tab" data-target="#contact"
                                            type="button" role="tab" aria-controls="contact" aria-selected="false">
                                        Shipping orders
                                    </button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="contact1-tab" data-toggle="tab" data-target="#contact1"
                                            type="button" role="tab" aria-controls="contact1" aria-selected="false">
                                        Delivered
                                    </button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="contact2-tab" data-toggle="tab" data-target="#contact2"
                                            type="button" role="tab" aria-controls="contact2" aria-selected="false">
                                        Cancel
                                    </button>
                                </li>
                            </ul>
                            <div class="tab-content" id="myTabContent">
                                <div class="tab-pane fade show active" id="home" role="tabpanel"
                                     aria-labelledby="home-tab">
                                    <div class="col-lg-12 grid-margin stretch-card">
                                        <div class="card">
                                            <div class="card-body">
                                                <h4 class="card-title">Order Table</h4>
                                                <p class="card-description">All of orders
                                                </p>
                                                <div class="table-responsive">
                                                    <table class="table table-hover">
                                                        <thead>
                                                        <tr>
                                                            <th>Order Id</th>
                                                            <th>Customer Name</th>
                                                            <th>Order Date</th>
                                                            <th>Date Shipping (Expected to)</th>
                                                            <th>Status</th>
                                                            <th>Total</th>
                                                            <th></th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <c:forEach var="order" items="${orders}">
                                                            <tr>
                                                                <td>${order.orderId}</td>
                                                                <td>${order.customer.name}</td>
                                                                <td>
                                                                    <fmt:formatDate value="${order.date}"/>
                                                                </td>
                                                                <td>
                                                                    <fmt:formatDate value="${order.shippingDate}"/>
                                                                </td>
                                                                <td class="status">${order.status}</td>
                                                                <td>${order.total}</td>

                                                                <td onclick="
                                                                        window.location.href = '/admin/order-management/update/' + ${order.orderId};">
                                                                    <i style="font-size: 15px; color: darkgreen; cursor: pointer">Confirm</i>
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
                                <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                    <div class="col-lg-12 grid-margin stretch-card">
                                        <div class="card">
                                            <div class="card-body">
                                                <h4 class="card-title">Order Table</h4>
                                                <p class="card-description">All of orders
                                                </p>
                                                <div class="table-responsive">
                                                    <table class="table table-hover">
                                                        <thead>
                                                        <tr>
                                                            <th>Order Id</th>
                                                            <th>Customer Name</th>
                                                            <th>Order Date</th>
                                                            <th>Date Shipping (Expected to)</th>
                                                            <th>Status</th>
                                                            <th>Total</th>
                                                            <th></th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <c:forEach var="order" items="${orders1}">
                                                            <tr>
                                                                <td>${order.orderId}</td>
                                                                <td>${order.customer.name}</td>
                                                                <td>
                                                                    <fmt:formatDate value="${order.date}"/>
                                                                </td>
                                                                <td>
                                                                    <fmt:formatDate value="${order.shippingDate}"/>
                                                                </td>
                                                                <td class="status">${order.status}</td>
                                                                <td>${order.total}</td>
                                                                <td onclick="
                                                                        window.location.href = '/admin/order-management/update1/' + ${order.orderId};">
                                                                    <i style="font-size: 15px; color: darkgreen; cursor: pointer">Shipping
                                                                        orders</i>
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
                                <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
                                    <div class="col-lg-12 grid-margin stretch-card">
                                        <div class="card">
                                            <div class="card-body">
                                                <h4 class="card-title">Order Table</h4>
                                                <p class="card-description">All of orders
                                                </p>
                                                <div class="table-responsive">
                                                    <table class="table table-hover">
                                                        <thead>
                                                        <tr>
                                                            <th>Order Id</th>
                                                            <th>Customer Name</th>
                                                            <th>Order Date</th>
                                                            <th>Date Shipping (Expected to)</th>
                                                            <th>Status</th>
                                                            <th>Total</th>
                                                            <th></th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <c:forEach var="order" items="${orders2}">
                                                            <tr>
                                                                <td>${order.orderId}</td>
                                                                <td>${order.customer.name}</td>
                                                                <td>
                                                                    <fmt:formatDate value="${order.date}"/>
                                                                </td>
                                                                <td>
                                                                    <fmt:formatDate value="${order.shippingDate}"/>
                                                                </td>
                                                                <td class="status">${order.status}</td>
                                                                <td>${order.total}</td>
                                                                <td onclick="
                                                                        window.location.href = '/admin/order-management/update2/' + ${order.orderId};">
                                                                    <i style="font-size: 15px; color: darkgreen; cursor: pointer">Delivered</i>
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
                                <div class="tab-pane fade" id="contact1" role="tabpanel" aria-labelledby="contact1-tab">
                                    <div class="col-lg-12 grid-margin stretch-card">
                                        <div class="card">
                                            <div class="card-body">
                                                <h4 class="card-title">Order Table</h4>
                                                <p class="card-description">All of orders
                                                </p>
                                                <div class="table-responsive">
                                                    <table class="table table-hover">
                                                        <thead>
                                                        <tr>
                                                            <th>Order Id</th>
                                                            <th>Customer Name</th>
                                                            <th>Order Date</th>
                                                            <th>Date Shipping (Expected to)</th>
                                                            <th>Status</th>
                                                            <th>Total</th>
                                                            <th></th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <c:forEach var="order" items="${orders3}">
                                                            <tr>
                                                                <td>${order.orderId}</td>
                                                                <td>${order.customer.name}</td>
                                                                <td>
                                                                    <fmt:formatDate value="${order.date}"/>
                                                                </td>
                                                                <td>
                                                                    <fmt:formatDate value="${order.shippingDate}"/>
                                                                </td>
                                                                <td class="status">${order.status}</td>
                                                                <td>${order.total}</td>
                                                                <td>Done
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
                                <div class="tab-pane fade" id="contact2" role="tabpanel" aria-labelledby="contact2-tab">
                                    <div class="col-lg-12 grid-margin stretch-card">
                                        <div class="card">
                                            <div class="card-body">
                                                <h4 class="card-title">Order Table</h4>
                                                <p class="card-description">All of orders
                                                </p>
                                                <div class="table-responsive">
                                                    <table class="table table-hover">
                                                        <thead>
                                                        <tr>
                                                            <th>Order Id</th>
                                                            <th>Customer Name</th>
                                                            <th>Order Date</th>
                                                            <th>Date Shipping (Expected to)</th>
                                                            <th>Status</th>
                                                            <th>Total</th>
                                                            <th></th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <c:forEach var="order" items="${orders4}">
                                                            <tr>
                                                                <td>${order.orderId}</td>
                                                                <td>${order.customer.name}</td>
                                                                <td>
                                                                    <fmt:formatDate value="${order.date}"/>
                                                                </td>
                                                                <td>
                                                                    <fmt:formatDate value="${order.shippingDate}"/>
                                                                </td>
                                                                <td class="status">${order.status}</td>
                                                                <td>${order.total}</td>
                                                                <td> Cancel
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
                        </div>

                    </div>
                </div>
                <footer class="footer">
                </footer>
            </div>

            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Information</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
            <script>

                window.addEventListener("DOMContentLoaded", () => {
                    const status = document.getElementsByClassName("status");
                    const edits = document.getElementsByClassName("edit");
                    for (let i = 0; i < status.length; i++) {
                        if (status[i].textContent === 'Confirmed' || status[i].textContent === 'Cancellation') {
                            edits[i].style.display = 'none';
                        }
                    }
                })
            </script>