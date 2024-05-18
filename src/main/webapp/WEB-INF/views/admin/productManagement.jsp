<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="c" %>
<style>
    input[type="file"]::file-selector-button {
        background: linear-gradient(to right, whitesmoke, skyblue);
        border: none;
        padding: 5px 10px;
        border-radius: 4px;
        cursor: pointer;
    }

    .form-control:not(input[type="file"]) {
        padding: 12px !important;
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
                <div class="col-md-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Product form</h4>
                            <p class="card-description">Create - Update</p>
                            <form:form class="forms-sample row" method="post" action="/product-management/create"
                                       modelAttribute="product" enctype="multipart/form-data">
                                <div class="form-group col-md-6">
                                    <label for="name">Name</label>
                                    <form:input path="name" type="text" class="form-control" id="name"
                                                placeholder="Product name"/>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="description">Description</label>
                                    <form:input path="description" type="text" class="form-control" id="description"
                                                placeholder="Description"/>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="price">Price</label>
                                    <form:input path="price" type="text" class="form-control" id="price"
                                                placeholder="Price"/>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="quantity">Quantity</label>
                                    <form:input path="quantity" type="text" class="form-control" id="quantity"
                                                placeholder="Quantity"/>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="image">Image</label>
                                    <form:input path="image" type="file" class="form-control" id="image"
                                                placeholder="Image"/>
                                    <div class="border d-block mt-2" style="height: 200px;">
                                        <img src="${image}" alt="image" id="imagePreview" width="50%" height="100%"
                                             style="display: none; margin: auto">
                                    </div>
                                </div>
                                <script>
                                    document.addEventListener('DOMContentLoaded', () => {
                                        const imagePreview = document.getElementById('imagePreview');
                                        if (imagePreview.src !== 'http://localhost:8080/product-management' &&
                                            imagePreview.src !== 'http://localhost:8080/product-management/create') {
                                            imagePreview.style.display = 'block';
                                        }
                                    });
                                    document.getElementById('image').addEventListener('change', function (event) {
                                        const file = event.target.files[0];
                                        if (file) {
                                            const reader = new FileReader();
                                            reader.onload = function (e) {
                                                const imagePreview = document.getElementById('imagePreview');
                                                imagePreview.src = e.target.result;
                                                imagePreview.style.display = 'block';
                                            };
                                            reader.readAsDataURL(file);
                                        } else {
                                            const imagePreview = document.getElementById('imagePreview');
                                            imagePreview.style.display = 'none';
                                            imagePreview.src = '';
                                        }
                                    });
                                </script>
                                <div class="form-group col-md-6">
                                    <div class="form-group">
                                        <label for="brand">Brand</label>
                                        <form:select path="brand" class="form-control" id="brand">
                                            <form:option value="2">Brand 2</form:option>
                                            <!-- Add more options as necessary -->
                                        </form:select>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <label for="category">Category</label>
                                            <form:select path="category" class="form-control" id="category">
                                                <form:option value="null">-- Select Category --</form:option>
                                                <form:option value="">Category 1</form:option>
                                                <!-- Add more options as necessary -->
                                            </form:select>
                                        </div>

                                        <div class="form-group col-md-6">
                                            <label for="supplier">Supplier</label>
                                            <form:select path="supplier" class="form-control" id="supplier">
                                                <form:option value="null">-- Select Supplier --</form:option>
                                                <form:option value="">Supplier 1</form:option>
                                                <!-- Add more options as necessary -->
                                            </form:select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="form-group col-md-6">
                                                <label for="color">Color</label>
                                                <form:select path="color" class="form-control" id="color">
                                                    <form:option value="null">-- Select Color --</form:option>
                                                    <form:option value="red">Color Red</form:option>
                                                    <!-- Add more options as necessary -->
                                                </form:select>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="size">Size</label>
                                                <form:select path="size" class="form-control" id="size">
                                                    <form:option value="null">-- Select Size --</form:option>
                                                    <form:option value="s">Size S</form:option>
                                                    <!-- Add more options as necessary -->
                                                </form:select>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <button type="submit" class="btn btn-primary mr-2">Create</button>
                                    <button type="button" class="btn btn-light"
                                            onclick="window.location.href='/product-management'">Cancel
                                    </button>
                                </div>
                            </form:form>
                        </div>
                    </div>
                </div>
                <!-- The table part remains unchanged -->
                <div class="col-lg-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Product table</h4>
                            <p class="card-description">
                                All of products
                            </p>
                            <div class="table-responsive">
                                <table class="table table-hover" style="cursor: pointer">
                                    <thead>
                                    <tr>
                                        <th>Image</th>
                                        <th>Name</th>
                                        <th>Price</th>
                                        <th>Color</th>
                                        <th>Quantity</th>
                                        <th>Brand</th>
                                        <th>Description</th>
                                        <th>Category</th>
                                        <th>Size</th>
                                        <th>Supplier</th>
                                        <th>Update</th>
                                        <th>Delete</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td><img src="../../../uploads/s7-1497188_lifestyle.webp" alt=""></td>
                                        <td>Classic Fit Cotton-Linen Polo Shirt</td>
                                        <td>$125.00</td>
                                        <td>
                                            <label class="badge" style="background:white;">
                                                White
                                            </label>
                                        </td>
                                        <td>120</td>
                                        <td>Polo Ralph Lauren</td>
                                        <td>
                                            <%-- Description --%>
                                        </td>
                                        <td>T-shirt</td>
                                        <td>M</td>
                                        <td>New House</td>
                                        <td><i class="mdi mdi-table-edit" style="font-size: 1.5rem; color: darkgreen"></i></td>
                                        <td><i class="mdi mdi-delete" style="font-size: 1.5rem; color: red"></i></td>
                                    </tr>
                                    <tr>
                                        <td><img src="../../../uploads/s7-AI710944762001_lifestyle.webp" alt=""></td>
                                        <td>Classic Fit Striped Mesh Polo Shirt</td>
                                        <td>$115.00</td>
                                        <td>
                                            <label class="badge" style="background: black; color: white">
                                                Black
                                            </label>
                                        </td>
                                        <td>110</td>
                                        <td>Polo Ralph Lauren</td>
                                        <td>
                                            <%-- Description --%>
                                        </td>
                                        <td>T-shirt</td>
                                        <td>L</td>
                                        <td>New House</td>
                                        <td><i class="mdi mdi-table-edit" style="font-size: 1.5rem; color: darkgreen"></i></td>
                                        <td><i class="mdi mdi-delete" style="font-size: 1.5rem; color: red"></i></td>
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
                <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center"> Free <a
                        href="https://www.bootstrapdash.com/" target="_blank">Bootstrap dashboard template</a> from Bootstrapdash.com</span>
            </div>
        </footer>
    </div>
</div>
