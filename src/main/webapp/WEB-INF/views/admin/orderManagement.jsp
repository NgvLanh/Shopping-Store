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
                            <%--                            <form:form class="forms-sample" method="post" action="/admin/order-management"--%>
                            <%--                                       modelAttribute="order">--%>
                            <%--                                <form:hidden path="customer.customerId"/>--%>
                            <%--                                <form:hidden path="payment.paymentId"/>--%>
                            <%--                                <form:hidden path="shippingDate"/>--%>
                            <%--                                <form:hidden path="date"/>--%>
                            <%--                                <div class="form-group">--%>
                            <%--                                    <label for="orderId">Order Id</label>--%>
                            <%--                                    <form:input type="text" class="form-control" id="orderId"--%>
                            <%--                                                readonly="true"--%>
                            <%--                                                path="orderId" placeholder="Order id"/>--%>
                            <%--                                </div>--%>
                            <%--                                <div class="form-group">--%>
                            <%--                                    <label for="customer-name">Customer name</label>--%>
                            <%--                                    <form:input type="text" class="form-control" id="customer-name"--%>
                            <%--                                                readonly="true"--%>
                            <%--                                                path="customer.name" placeholder="Customer name"/>--%>
                            <%--                                </div>--%>
                            <%--                                <div class="form-group">--%>
                            <%--                                    <label for="date">Date</label>--%>
                            <%--                                    <form:input type="datetime-local" class="form-control" id="date"--%>
                            <%--                                                path="date" placeholder="date"/>--%>
                            <%--                                </div>--%>
                            <%--                                <div class="form-group">--%>
                            <%--                                    <label for="shipping-date">Shipping date</label>--%>
                            <%--                                    <form:input type="datetime-local" class="form-control" id="shipping-date"--%>
                            <%--                                                path="shippingDate" placeholder="Shippping date"/>--%>
                            <%--                                </div>--%>
                            <%--                                <div class="form-group">--%>
                            <%--                                    <label>Status</label>--%>
                            <%--                                    <form:select path="status" class="form-control">--%>
                            <%--                                        <form:option value="">Awaiting Confirmation</form:option>--%>
                            <%--                                        <form:options items="${status}"/>--%>
                            <%--                                    </form:select>--%>
                            <%--                                    <form:errors path="status" cssClass="text-danger"--%>
                            <%--                                                 cssStyle="font-size: 14px; margin: 4px"/>--%>
                            <%--                                </div>--%>
                            <%--                                <div class="form-group">--%>
                            <%--                                    <label for="total">Total</label>--%>
                            <%--                                    <form:input type="number" class="form-control" readonly="true" id="total"--%>
                            <%--                                                path="total" placeholder="total"/>--%>
                            <%--                                </div>--%>

                            <%--                                <button type="submit" class="btn btn-primary mr-2"--%>
                            <%--                                        formaction="/admin/order-management/update" ${disabledSave}>Save--%>
                            <%--                                </button>--%>
                            <%--                                <button type="button" class="btn btn-light"--%>
                            <%--                                        onclick="window.location.href='/admin/order-management'">Cancel--%>
                            <%--                                </button>--%>
                            <%--                            </form:form>--%>
                            <%--                        </div>--%>
                            <%--                    </div>--%>
                            <%--                </div>--%>
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
                                                            <th>Update</th>
                                                            <th>View</th>
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
                                                                <td>
                                                                    <a class="edit"
                                                                       href="/admin/order-management/edit/${order.orderId}">
                                                                        <i class="mdi mdi-table-edit"
                                                                           style="font-size: 1.5rem; color: darkgreen"></i>
                                                                    </a>
                                                                </td>
                                                                <td><i class="mdi mdi-eye-outline" type="button"
                                                                       data-toggle="modal" data-target="#exampleModal"
                                                                       style="font-size: 1.5rem; color: sandybrown; cursor: pointer"></i>
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
                                    ...
                                </div>
                                <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
                                    ...
                                </div>
                                <div class="tab-pane fade" id="contact1" role="tabpanel" aria-labelledby="contact1-tab">
                                    ...
                                </div>
                                <div class="tab-pane fade" id="contact2" role="tabpanel" aria-labelledby="contact2-tab">
                                    ...
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