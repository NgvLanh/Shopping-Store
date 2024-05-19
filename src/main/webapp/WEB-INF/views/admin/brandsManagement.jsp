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
                <h3 class="page-title text-danger">Brands management</h3>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="admin">Admin</a></li>
                        <li class="breadcrumb-item active" aria-current="page"> Brands management</li>
                    </ol>
                </nav>
            </div>
            <div class="row">
                <div class="col-md-6 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title card-description "></h4>

                            <form class="forms-sample">

                                <div class="form-group">
                                    <label for="exampleInputEmail1" class="text-success">Brand name:</label>
                                    <input type="email" class="form-control" id="exampleInputEmail1"
                                           placeholder="Brand name">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1" class="text-warning">Description:</label>
                                    <input type="password" class="form-control" id="exampleInputPassword1"
                                           placeholder="Description">
                                </div>

                                <button type="submit" class="btn btn-primary mr-2"> Submit</button>
                                <button class="btn btn-light">Cancel</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title card-description">Brands Table</h4>
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th class="text-success">Brand name</th>
                                        <th class="text-warning">Description</th>

                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>

                                        <td>Balenciaga</td>
                                        <td>
                                            <label>Description</label>
                                        </td>
                                    </tr>
                                    <tr>

                                        <td>Louis Vuiton</td>
                                        <td>
                                            <label>Description</label>
                                        </td>
                                    </tr>
                                    <tr>

                                        <td>Light Calvary </td>
                                        <td>
                                            <label>Description</label>
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
                <span class="text-muted d-block text-center text-sm-left d-sm-inline-block"></span>
                <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center"> Free <a
                        href="https://www.bootstrapdash.com/" target="_blank">Bootstrap dashboard template</a> from Bootstrapdash.com</span>
            </div>
        </footer>
    </div>
</div>