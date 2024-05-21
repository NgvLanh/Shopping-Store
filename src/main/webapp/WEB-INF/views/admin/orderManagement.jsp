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
                <div class="col-md-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Order form</h4>
                            <p class="card-description">Basic form layout</p>
                            <form class="forms-sample">
                                <div class="form-group">
                                    <label for="exampleInputOrderid">Order Id</label>
                                    <input type="text" class="form-control" id="exampleInputOrderid" placeholder="orderid">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputProductid">Product Id</label>
                                    <input type="text" class="form-control" id="exampleInputProductid" placeholder="productid">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputDate">Date</label>
                                    <input type="date" class="form-control" id="exampleInputDate" placeholder="date">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputStatus">Status</label>
                                    <input type="text" class="form-control" id="exampleInputStatus" placeholder="status">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputTotal">Total</label>
                                    <input type="text" class="form-control" id="exampleInputTotal" placeholder="total">
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
                                        <th>Delete</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>M1</td>
                                        <td>C1</td>
                                        <!-- <td class="text-danger"> 28.76% <i class="mdi mdi-arrow-down"></i>
                                        </td> -->
                                        <td>18/05/2024</td>
                                        <!-- <td>
                                            <label class="badge badge-danger">Pending</label>
                                        </td> -->
                                        <td>Chờ xác nhận</td>
                                        <td>500.000</td>
                                        <td><i class="mdi mdi-table-edit"
                                               style="font-size: 1.5rem; color: darkgreen"></i></td>
                                        <td onclick="confirmDelete(this)"><i class="mdi mdi-delete"
                                                                             style="font-size: 1.5rem; color: red"></i></td>
                                    </tr>
                                    <tr>
                                        <td>M2</td>
                                        <td>C2</td>
                                        <!-- <td class="text-danger"> 28.76% <i class="mdi mdi-arrow-down"></i>
                                        </td> -->
                                        <td>17/05/2024</td>
                                        <!-- <td>
                                            <label class="badge badge-danger">Pending</label>
                                        </td> -->
                                        <td>Chờ xác nhận</td>
                                        <td>600.000</td>
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