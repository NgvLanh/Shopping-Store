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
                            <p class="card-description">Basic form layout</p>
                            <%--@elvariable id="order" type="com.poly.entities.Order"--%>
                            <form:form class="forms-sample" method="post" modelAttribute="order">
                                <div class="form-group">
                                    <label for="exampleInputOrderid">Order Id</label>
                                    <form:input type="text" class="form-control" id="exampleInputOrderid"
                                                disabled="true"
                                                path="id" placeholder="orderid"/>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputProductid">Product Id</label>
                                    <form:input type="text" class="form-control" id="exampleInputProductid"
                                                disabled="true"
                                                path="idProduct" placeholder="productid"/>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputDate">Date</label>
                                    <form:input type="date" class="form-control" id="exampleInputDate" disabled="true"
                                                path="date" placeholder="date"/>
                                </div>
                                <div class="form-group">
                                    <label>Status</label>
                                    <form:select path="status" class="form-control">
                                        <form:option value="">Awaiting Confirmation</form:option>
                                        <form:option value="">Confirmed</form:option>
                                        <form:option value="">Cancelled</form:option>
                                    </form:select>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputTotal">Total</label>
                                    <form:input type="text" class="form-control" disabled="true" id="exampleInputTotal"
                                                path="total" placeholder="total"/>
                                </div>

                                <button type="submit" class="btn btn-primary mr-2"> Submit</button>
                                <button class="btn btn-light">Cancel</button>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Hoverable Table</h4>
                        <p class="card-description"> Add class <code>.table-hover</code>
                        </p>
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>Order Id</th>
                                    <th>Customer Id</th>
                                    <th>Order Date</th>
                                    <th>Status</th>
                                    <th>Total</th>
                                    <th>Update</th>
                                    <th>View</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="order" items="${orders}">
                                <tr>
                                    <td>${order.id}</td>
                                    <td>${order.idProduct}</td>
                                    <td>${order.date}</td>
                                    <td>${order.status}</td>
                                    <td>${order.total}</td>
                                    <td>
                                        <a href="/admin/order-management/edit/${order.id}">
                                            <i class="mdi mdi-table-edit"
                                               style="font-size: 1.5rem; color: darkgreen"></i>
                                        </a>
                                    </td>
                                    <td><i class="mdi mdi-eye-outline"
                                           style="font-size: 1.5rem; color: sandybrown"></i></td>
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