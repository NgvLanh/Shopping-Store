<!--================ End Header Menu Area =================-->

<!-- ================ start banner area ================= -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<section class="blog-banner-area" id="category">
    <div class="container h-100">
        <div class="blog-banner">
            <div class="text-center">
                <h1>Order Tracking</h1>
                <nav aria-label="breadcrumb" class="banner-breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Order Tracking</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</section>
<!-- ================ end banner area ================= -->


<!--================Tracking Box Area =================-->
<section class="tracking_box_area section-margin--small">
    <div class="container">
        <div class="tracking_box_inner">
            <p>To track your order please enter your Order ID in the box below and press the "Track" button. This
                was given to you on your receipt and in the confirmation email you should have received.</p>
            <form class="row tracking_form" action="/tracking-order" method="post" novalidate="novalidate">
                <div class="col-md-8 form-group">
                    <input type="text" class="form-control border border-dark-subtle rounded" id="order" value="${orderId}" name="orderId"
                           placeholder="Order ID"
                           onfocus="this.placeholder = ''" onblur="this.placeholder = 'Order ID'">
                    <b><i class="text-danger" style="font-size: 20px; margin: 4px">${message}</i></b>
                </div>
                <div class="col-md-4 form-group">
                    <button type="submit" class="button button-tracking" data-toggle="modal"
                            data-target="#exampleModal">
                        Track Order
                    </button>
                </div>
            </form>


          <%--  <div class="grid-margin" style="margin-top: 20px">
                <div class="card ">
                    <div class="card-body col-lg-12 stretch-card">
                        <h4 class="card-title">Order Table</h4>
                        <div class="table-responsive">
                            <table class="table table-hover" style="cursor: pointer">
                                <thead>
                                <tr>
                                    <th>Order Id</th>
                                    <th>Customer Name</th>
                                    <th>Order Date</th>
                                    <th>Date Shipping (Expected to)</th>
                                    <th>Status</th>
                                    <th>Total</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:choose>
                                    <c:when test="${not empty item}">
                                        <c:forEach var="item" items="${item}">
                                            <tr>
                                                <td>${item.orderId}</td>
                                                <td>${item.customer.name}</td>
                                                <td>
                                                    <fmt:formatDate value="${item.date}"/>
                                                </td>
                                                <td>
                                                    <fmt:formatDate value="${item.shippingDate}"/>
                                                </td>
                                                <td class="status">${item.status}</td>
                                                <td>${item.total}</td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td colspan="6" class="text-danger" style="
                                    font-size: 24px; margin: 4px">Order not found
                                            </td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>--%>

                            <c:if test="${not empty item}">
                                <table class="table table-hover"  style="margin-top: 20px" style="cursor: pointer">
                                    <thead>
                                    <tr>
                                        <th>Order Id</th>
                                        <th>Customer Name</th>
                                        <th>Order Date</th>
                                        <th>Date Shipping (Expected to)</th>
                                        <th>Status</th>
                                        <th>Total</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="item" items="${item}">
                                        <tr>
                                            <td>${item.orderId}</td>
                                            <td>${item.customer.name}</td>
                                            <td>
                                                <fmt:formatDate value="${item.date}"/>
                                            </td>
                                            <td>
                                                <fmt:formatDate value="${item.shippingDate}"/>
                                            </td>
                                            <td class="status">${item.status}</td>
                                            <td>${item.total}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </c:if>

    </div>
    </div>
</section>
<!-- Button trigger modal -->


<!-- Modal -->

<!--================End Tracking Box Area =================-->


<!--================ Start footer Area =================-->
<!-- Modal -->
<%--
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Order</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">


                <c:choose>
                    <c:when test="${not empty item}">

                        <tr>
                            <td>${item.orderId}</td>
                            <td>${item.customer.name}</td>
                            <td>
                                <fmt:formatDate value="${item.date}"/>
                            </td>
                            <td>
                                <fmt:formatDate value="${item.shippingDate}"/>
                            </td>
                            <td class="status">${item.status}</td>
                            <td>${item.total}</td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="6">No data available</td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
--%>
