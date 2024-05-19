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
                <h3 class="page-title">Orders management</h3>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="admin">Admin</a></li>
                        <li class="breadcrumb-item active" aria-current="page"> Orders management </li>
                    </ol>
                </nav>
            </div>
            <div class="row">
                <div class="col-md-6 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Order form</h4>
                            <p class="card-description">Basic form layout</p>
                            <form class="forms-sample">
                                <div class="form-group">
                                    <label for="exampleInputUsername1">Username</label>
                                    <input type="text" class="form-control" id="exampleInputUsername1" placeholder="Username">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Email">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputConfirmPassword1">Confirm Password</label>
                                    <input type="password" class="form-control" id="exampleInputConfirmPassword1" placeholder="Password">
                                </div>
                                <div class="form-check form-check-flat form-check-primary">
                                    <label class="form-check-label">
                                        <input type="checkbox" class="form-check-input"> Remember me <i class="input-helper"></i></label>
                                </div>
                                <button type="submit" class="btn btn-primary mr-2"> Submit </button>
                                <button class="btn btn-light">Cancel</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Hoverable Table</h4>
                            <p class="card-description"> Add class <code>.table-hover</code>
                            </p>
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th>User</th>
                                        <th>Product</th>
                                        <th>Sale</th>
                                        <th>Status</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>Jacob</td>
                                        <td>Photoshop</td>
                                        <td class="text-danger"> 28.76% <i class="mdi mdi-arrow-down"></i>
                                        </td>
                                        <td>
                                            <label class="badge badge-danger">Pending</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Messsy</td>
                                        <td>Flash</td>
                                        <td class="text-danger"> 21.06% <i class="mdi mdi-arrow-down"></i>
                                        </td>
                                        <td>
                                            <label class="badge badge-warning">In progress</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>John</td>
                                        <td>Premier</td>
                                        <td class="text-danger"> 35.00% <i class="mdi mdi-arrow-down"></i>
                                        </td>
                                        <td>
                                            <label class="badge badge-info">Fixed</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Peter</td>
                                        <td>After effects</td>
                                        <td class="text-success"> 82.00% <i class="mdi mdi-arrow-up"></i>
                                        </td>
                                        <td>
                                            <label class="badge badge-success">Completed</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Dave</td>
                                        <td>53275535</td>
                                        <td class="text-success"> 98.05% <i class="mdi mdi-arrow-up"></i>
                                        </td>
                                        <td>
                                            <label class="badge badge-warning">In progress</label>
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
                <span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright © bootstrapdash.com 2020</span>
                <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center"> Free <a href="https://www.bootstrapdash.com/" target="_blank">Bootstrap dashboard template</a> from Bootstrapdash.com</span>
            </div>
        </footer>
    </div>
</div>