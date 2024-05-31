<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                <h3 class="page-title text-primary">Reviews management</h3>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/admin/dashboard">Admin</a></li>
                        <li class="breadcrumb-item active " aria-current="page"> Reviews management</li>
                    </ol>
                </nav>
            </div>
            <div class="row">
                <div class="col-lg-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Review Table</h4>
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                    <tr>
                                        <th>Photo</th>
                                        <th>Name</th>
                                        <th>Rating</th>
                                        <th>Comment</th>
                                        <th>Reviews Date</th>
                                        <th>Delete</th>
                                        <th>View details</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <jsp:useBean id="reviews" scope="request" type="java.util.List"/>
                                    <c:forEach var="review" items="${reviews}">
                                        <tr>
                                            <td class="py-1">
                                                <img src="../../../uploads/${review.customer.image}" alt="image">
                                            </td>
                                            <td>
                                                    ${review.customer.name}
                                            </td>
                                            <td>
                                                    ${review.rating}
                                            </td>
                                            <td>
                                                    ${review.comment}
                                            </td>
                                            <td>
                                                <fmt:formatDate value="${review.reviewDate}"/>
                                            </td>
                                            <td>
                                                <a class="btn btn-danger" href="/admin/review-management/delete/${review.reviewId}">
                                                    Delete
                                                </a>
                                            </td>
                                            <td>
                                                <button class="btn btn-warning"
                                                        onclick="window.location.href='/single-product'">View details
                                                </button>
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

            </div>
        </footer>
    </div>
</div>