<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="c" %>
<style>
    input[type="file"]::file-selector-button {
        background: linear-gradient(to right, whitesmoke, skyblue);
        border: none;
        padding: 8px 10px;
        border-radius: 4px;
        cursor: pointer;
    }
</style>
<div class="content-wrapper">
    <div class="main-panel">
        <div class="content-wrapper">
            <div class="page-header">
                <h3 class="page-title">Products management</h3>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="admin">Admin</a></li>
                        <li class="breadcrumb-item active" aria-current="page"> Products management</li>
                    </ol>
                </nav>
            </div>
            <div class="row">
                <div class="col-md-6 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Product form</h4>
                            <p class="card-description">Create - Update</p>
                            <form:form class="forms-sample" method="post" action="/product-management/create" modelAttribute="product" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label for="name">Name</label>
                                    <form:input path="name" type="text" class="form-control" id="name" placeholder="Product name"/>
                                </div>
                                <div class="form-group">
                                    <label for="description">Description</label>
                                    <form:input path="description" type="text" class="form-control" id="description" placeholder="Description"/>
                                </div>
                                <div class="form-group">
                                    <label for="price">Price</label>
                                    <form:input path="price" type="text" class="form-control" id="price" placeholder="Price"/>
                                </div>
                                <div class="form-group">
                                    <label for="quantity">Quantity</label>
                                    <form:input path="quantity" type="text" class="form-control" id="quantity" placeholder="Quantity"/>
                                </div>
                                <div class="form-group">
                                    <label for="image">Image</label>
                                    <form:input path="image" type="file" class="form-control" id="image" placeholder="Image"/>
                                </div>
                                <div class="form-group">
                                    <label for="category">Category</label>
                                    <form:select path="category" class="form-control" id="category">
                                        <form:option value="1">Category 1</form:option>
                                        <!-- Add more options as necessary -->
                                    </form:select>
                                </div>
                                <div class="form-group">
                                    <label for="band">Band</label>
                                    <form:select path="band" class="form-control" id="band">
                                        <form:option value="2">Band 2</form:option>
                                        <!-- Add more options as necessary -->
                                    </form:select>
                                </div>
                                <div class="form-group">
                                    <label for="supplier">Supplier</label>
                                    <form:select path="supplier" class="form-control" id="supplier">
                                        <form:option value="3">Supplier 3</form:option>
                                        <!-- Add more options as necessary -->
                                    </form:select>
                                </div>

                                <button type="submit" class="btn btn-primary mr-2">Create</button>
                                <button type="button" class="btn btn-light"
                                        onclick="window.location.href='/product-management'">Cancel</button>
                            </form:form>
                        </div>
                    </div>
                </div>
                <!-- The table part remains unchanged -->
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
                                        <td class="text-danger"> 28.76% <i class="mdi mdi-arrow-down"></i></td>
                                        <td><label class="badge badge-danger">Pending</label></td>
                                    </tr>
                                    <tr>
                                        <td>Messsy</td>
                                        <td>Flash</td>
                                        <td class="text-danger"> 21.06% <i class="mdi mdi-arrow-down"></i></td>
                                        <td><label class="badge badge-warning">In progress</label></td>
                                    </tr>
                                    <tr>
                                        <td>John</td>
                                        <td>Premier</td>
                                        <td class="text-danger"> 35.00% <i class="mdi mdi-arrow-down"></i></td>
                                        <td><label class="badge badge-info">Fixed</label></td>
                                    </tr>
                                    <tr>
                                        <td>Peter</td>
                                        <td>After effects</td>
                                        <td class="text-success"> 82.00% <i class="mdi mdi-arrow-up"></i></td>
                                        <td><label class="badge badge-success">Completed</label></td>
                                    </tr>
                                    <tr>
                                        <td>Dave</td>
                                        <td>53275535</td>
                                        <td class="text-success"> 98.05% <i class="mdi mdi-arrow-up"></i></td>
                                        <td><label class="badge badge-warning">In progress</label></td>
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
