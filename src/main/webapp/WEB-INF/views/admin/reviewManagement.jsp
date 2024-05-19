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
                        <li class="breadcrumb-item"><a href="admin">Admin</a></li>
                        <li class="breadcrumb-item active " aria-current="page"> Reviews management</li>
                    </ol>
                </nav>
            </div>
            <div class="row">
                <div class="col-lg-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Review Table</h4>

                            </p>
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                    <tr>
                                        <th>Photo</th>
                                        <th>Name</th>
                                        <th>Rating</th>
                                        <th>Comment</th>
                                        <th>Reviews Date</th>
                                        <th></th>

                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td class="py-1">
                                            <img src="../../assets/images/faces-clipart/pic-1.png" alt="image">
                                        </td>
                                        <td>John</td>
                                        <td >

                                            <i class="mdi mdi-star text-warning">
                                            <i class="mdi mdi-star ">
                                            <i class="mdi mdi-star ">
                                            <i class="mdi mdi-star">
                                            <i class="mdi mdi-star">


                                        </td>
                                        <td>Very good</td>
                                        <td>2024-05-19</td>
                                        <td>
                                            <button class="btn btn-danger">Delete</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="py-1">
                                            <img src="../../assets/images/faces-clipart/pic-1.png" alt="image">
                                        </td>
                                        <td>Tony</td>
                                        <td >

                                            <i class="mdi mdi-star text-warning">
                                                <i class="mdi mdi-star ">
                                                    <i class="mdi mdi-star ">



                                        </td>
                                        <td>Medium</td>
                                        <td>2024-05-19</td>
                                        <td>
                                            <button class="btn btn-danger">Delete</button>
                                        </td>

                                    </tr> <tr>
                                        <td class="py-1">
                                            <img src="../../assets/images/faces-clipart/pic-1.png" alt="image">
                                        </td>
                                        <td>Alice</td>
                                        <td >

                                            <i class="mdi mdi-star text-warning">
                                                <i class="mdi mdi-star ">
                                                    <i class="mdi mdi-star ">
                                                        <i class="mdi mdi-star">



                                        </td>
                                        <td>Good</td>
                                        <td>2024-05-19</td>
                                        <td>
                                            <button class="btn btn-danger">Delete</button>
                                        </td>
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

            </div>
        </footer>
    </div>
</div>