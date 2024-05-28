<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="content-wrapper">
    <div class="main-panel">
        <div class="content-wrapper">
            <div class="page-header">
                <h3 class="page-title">Discounts Management</h3>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/admin/dashboard">Admin</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Discounts Management</li>
                    </ol>
                </nav>
            </div>
            <div class="row">
                <div class="col-md-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Discount Form</h4>
                            <p class="card-description">Create - Update</p>
                            <form:form class="forms-sample row" method="post" action="/admin/discounts-management/create"
                                       modelAttribute="discount" enctype="multipart/form-data">



                                <div class="form-group col-md-6">
                                    <label for="productItem">Product Item</label>
                                    <form:select path="productItem" class="form-control" id="productItem">
                                        <form:option value="">-- Select Product Item --</form:option>
                                    </form:select>
                                    <form:errors path="productItem" cssClass="text-danger" cssStyle="font-size: 14px; margin: 4px"/>
                                </div>

                                <div class="form-group col-md-6">
                                    <label for="code">Code</label>
                                    <form:input path="code" type="text" class="form-control" id="code" placeholder="Code"/>
                                    <form:errors path="code" cssClass="text-danger" cssStyle="font-size: 14px; margin: 4px"/>
                                </div>

                                <div class="form-group col-md-6">
                                    <label for="percentNumber">Percent</label>
                                    <form:input path="percentNumber" type="number" class="form-control" id="percentNumber" placeholder="PercentNumber"/>
                                    <form:errors path="percentNumber" cssClass="text-danger" cssStyle="font-size: 14px; margin: 4px"/>
                                </div>



                                <div class="form-group col-md-6">
                                    <label for="endTime">End Time</label>
                                    <form:input path="endTime" type="datetime-local" class="form-control" id="endTime" placeholder="End Time"/>
                                    <form:errors path="endTime" cssClass="text-danger" cssStyle="font-size: 14px; margin: 4px"/>
                                </div>

                                <div class="col-md-12">
                                    <button type="submit" class="btn btn-primary mr-2">Save</button>
                                    <button type="button" class="btn btn-light" >Cancel</button>
                                </div>
                            </form:form>
                        </div>
                    </div>
                </div>

                <div class="col-lg-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Discount Table</h4>
                            <p class="card-description">All discounts</p>
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th>Discount ID</th>
                                        <th>Product Item</th>
                                        <th>Code</th>
                                        <th>Percent</th>
                                        <th>Create Time</th>
                                        <th>End Time</th>
                                        <th>Update</th>
                                        <th>Delete</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>Product A</td>
                                        <td>DISC2023</td>
                                        <td>10</td>
                                        <td>2023-01-01 12:00:00</td>
                                        <td>2023-12-31 23:59:59</td>
                                        <td>
                                            <button class="btn btn-warning">Update</button>

                                        </td>
                                        <td>
                                            <button class="btn btn-danger">Delete</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>Product B</td>
                                        <td>DISC2024</td>
                                        <td>15</td>
                                        <td>2023-01-02 14:00:00</td>
                                        <td>2024-01-01 23:59:59</td>
                                        <td>
                                            <button class="btn btn-warning">Update</button>

                                        </td>
                                        <td>
                                            <button class="btn btn-danger">Delete</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>Product C</td>
                                        <td>DISC2025</td>
                                        <td>20</td>
                                        <td>2023-02-01 10:00:00</td>
                                        <td>2024-02-01 10:00:00</td>
                                        <td>
                                            <button class="btn btn-warning">Update</button>

                                        </td>
                                        <td>
                                            <button class="btn btn-danger">Delete</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>4</td>
                                        <td>Product D</td>
                                        <td>DISC2026</td>
                                        <td>25</td>
                                        <td>2023-03-01 09:00:00</td>
                                        <td>2024-03-01 09:00:00</td>
                                        <td>
                                            <button class="btn btn-warning">Update</button>

                                        </td>
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
                <span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Design by Teo</span>
            </div>
        </footer>
    </div>
</div>
