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
                <h3 class="page-title text-success">Size & color management</h3>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="admin">Admin</a></li>
                        <li class="breadcrumb-item active" aria-current="page"> Size & color management</li>
                    </ol>
                </nav>
            </div>
            <div class="row">
                <div class="col-md-6 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">

                            <p class="card-description"></p>
                            <form class="forms-sample">
                                <div class="form-group">
                                    <label for="exampleInputUsername1">Color Name</label>
                                    <input type="text" class="form-control" id="exampleInputUsername1"
                                           placeholder="Username">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputUsername1">Description</label>
                                    <input type="text" class="form-control" id=""
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
                            <h4 class="card-title card-description ">Color Table</h4>
                            <div class="table-responsive">
                                <table class="table table-hover text-center">
                                    <thead>
                                    <tr>
                                        <th>Color</th>
                                        <th>Description</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>
                                            <span class="badge badge-dark p-2">Dark</span>
                                        </td>
                                        <td>
                                            #52575D
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <span class="badge badge-danger p-2">Pink</span>
                                        </td>
                                        <td>
                                            #FF70AB
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <span class="badge badge-light p-2 text-dark">White</span>
                                        </td>
                                        <td>
                                            #FEFDED
                                        </td>

                                    </tr>
                                    <tr>
                                        <td>
                                            <span class="badge badge-warning p-2">Yellow</span>
                                        </td>
                                        <td>
                                            #F5D97E
                                        </td>

                                    </tr>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <hr>
                <div class="col-md-6 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title"></h4>
                            <p class="card-description"></p>
                            <form class="forms-sample">
                                <div class="form-group">
                                    <label for="exampleInputUsername1">Size</label>
                                    <input type="text" class="form-control" id=""
                                           placeholder="Size">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputUsername1">Description</label>
                                    <input type="text" class="form-control" id=""
                                           placeholder="Description">
                                </div>

                                <button type="submit" class="btn btn-primary mr-2">Submit</button>
                                <button type="button" class="btn btn-light">Cancel</button>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title card-description ">Size Table</h4>
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th>Size</th>
                                        <th>Description</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>XS</td>
                                        <td>Very small- For people weighing under 45kg.</td>
                                    </tr>
                                    <tr>
                                        <td>S</td>
                                        <td>Small- For people weighing from 45-55kg.</td>
                                    </tr>
                                    <tr>
                                        <td>M</td>
                                        <td>Medium size- For people weighing from 55-65kg.</td>
                                    </tr>
                                    <tr>
                                        <td>L</td>
                                        <td>Large size- For people weighing from 65-75kg.</td>
                                    </tr>
                                    <tr>
                                        <td>XL</td>
                                        <td>Very large size- For people weighing from 75-85kg.</td>
                                    </tr>
                                    <tr>
                                        <td>XXL</td>
                                        <td>Extra Extra Large: For people weighing from 85-95kg.</td>
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
                <span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Design by Mr. Teo</span>
            </div>
        </footer>
    </div>
</div>