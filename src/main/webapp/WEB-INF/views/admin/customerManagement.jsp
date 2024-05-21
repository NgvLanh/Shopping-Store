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
                        <li class="breadcrumb-item"><a href="admin">Admin</a></li>
                        <li class="breadcrumb-item active" aria-current="page"> Customer management </li>
                    </ol>
                </nav>
            </div>
            <div class="row">
                <div class="col-lg-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Customer Table</h4>
                            <%--                            <p class="card-description"> Add class <code>.table-striped</code>--%>
                            </p>
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                    <tr>
                                        <th>User</th>
                                        <th>First name</th>
                                        <th>Email</th>
                                        <th>Phone</th>
                                        <th>Adress</th>
                                        <th>City</th>
                                        <th>Created_At</th>
                                        <th>Update</th>
                                        <th>Delete</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td class="py-1">
                                            <img src="../../assets/images/faces-clipart/pic-1.png" alt="image">
                                        </td>
                                        <td>Herman Beck</td>
                                        <td>
                                            hermanbeck@gmail.com
                                        </td>
                                        <td>091111123</td>
                                        <td>Q.NinhKieu</td>
                                        <td>Can Tho</td>
                                        <td>19/04/2024 - 20:03</td>
                                        <td><i class="mdi mdi-table-edit"
                                               style="font-size: 1.5rem; color: darkgreen"></i></td>
                                        <td onclick="confirmDelete(this)"><i class="mdi mdi-delete"
                                                                             style="font-size: 1.5rem; color: red"></i></td>
                                    </tr>
                                    <tr>
                                        <td class="py-1">
                                            <img src="../../assets/images/faces-clipart/pic-2.png" alt="image">
                                        </td>
                                        <td>Messsy Adam</td>
                                        <td>
                                            MessyAdam@gmail.com
                                        </td>
                                        <td>091116295</td>
                                        <td>Q.CaiRang</td>
                                        <td>Can Tho</td>
                                        <td>19/04/2024 - 20:03</td>
                                        <td><i class="mdi mdi-table-edit"
                                               style="font-size: 1.5rem; color: darkgreen"></i></td>
                                        <td onclick="confirmDelete(this)"><i class="mdi mdi-delete"
                                                                             style="font-size: 1.5rem; color: red"></i></td>
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
<%--            <div class="d-sm-flex justify-content-center justify-content-sm-between">--%>
<%--                <span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright © bootstrapdash.com 2020</span>--%>
<%--                <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center"> Free <a href="https://www.bootstrapdash.com/" target="_blank">Bootstrap dashboard template</a> from Bootstrapdash.com</span>--%>
<%--            </div>--%>
        </footer>
    </div>
</div>