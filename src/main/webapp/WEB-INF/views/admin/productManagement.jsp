<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="c" %>
<style>
    input[type="file"]::file-selector-button {
        background: linear-gradient(to left, whitesmoke, skyblue);
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
                            <%--@elvariable id="product" type="com.poly.entities.Product"--%>
                            <form:form class="forms-sample row" method="post" action="/admin/product-management/create"
                                       modelAttribute="product" enctype="multipart/form-data">
                                <div class="form-group col-md-6">
                                    <label for="name">Name</label>
                                    <form:input path="name" type="text" class="form-control" id="name"
                                                placeholder="Product name"/>
                                    <form:errors path="name" cssClass="text-danger"/>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="description">Description</label>
                                    <form:input path="description" type="text" class="form-control" id="description"
                                                placeholder="Description"/>
                                    <form:errors path="description" cssClass="text-danger"/>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="price">Price</label>
                                    <form:input path="price" type="text" class="form-control" id="price"
                                                placeholder="Price"/>
                                    <form:errors path="price" cssClass="text-danger"/>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="quantity">Quantity</label>
                                    <form:input path="quantity" type="text" class="form-control" id="quantity"
                                                placeholder="Quantity"/>
                                    <form:errors path="quantity" cssClass="text-danger"/>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="image">Image</label>
                                    <form:input path="file" type="file" class="form-control" id="image"
                                                placeholder="Image"/>

                                    <div class="border d-block mt-2" style="height: 200px;">
                                        <img src="${image}" alt="image" id="imagePreview" width="50%" height="100%"
                                             style="display: none; margin: auto">
                                    </div>
                                    <form:errors path="fileName" cssClass="text-danger"/>
                                </div>
                                <script>
                                    document.addEventListener('DOMContentLoaded', () => {
                                        const imagePreview = document.getElementById('imagePreview');
                                        if (imagePreview.src !== 'http://localhost:8080/admin/product-management' &&
                                            imagePreview.src !== 'http://localhost:8080/admin/product-management/create' ) {
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
                                            <form:option value="">-- Select Brand --</form:option>
                                            <form:option value="brand 1">Brand 1</form:option>
                                            <!-- Add more options as necessary -->
                                        </form:select>
                                        <form:errors path="brand" cssClass="text-danger"/>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <label for="category">Category</label>
                                            <form:select path="category" class="form-control" id="category">
                                                <form:option value="">-- Select Category --</form:option>
                                                <form:option value="category 1">Category 1</form:option>
                                                <!-- Add more options as necessary -->
                                            </form:select>
                                            <form:errors path="category" cssClass="text-danger"/>
                                        </div>

                                        <div class="form-group col-md-6">
                                            <label for="supplier">Supplier</label>
                                            <form:select path="supplier" class="form-control" id="supplier">
                                                <form:option value="">-- Select Supplier --</form:option>
                                                <form:option value="supplier 1">Supplier 1</form:option>
                                                <!-- Add more options as necessary -->
                                            </form:select>
                                            <form:errors path="supplier" cssClass="text-danger"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="form-group col-md-6">
                                                <label>Color</label>
                                                <div style="user-select: none;" class="row">
                                                    <div class="col-md-3 d-flex justify-content-center align-items-center">
                                                        <form:checkbox path="color" value="red" id="red"
                                                                       cssStyle="accent-color: red; transform: scale(1.5);"/>
                                                        <label for="red" style="cursor: pointer" class="m-2">Red</label>
                                                    </div>
                                                    <div class="col-md-3 d-flex align-content-center justify-content-between">
                                                        <form:checkbox path="color" value="blue" id="blue"
                                                                       cssStyle="accent-color: blue; transform: scale(1.5);"/>
                                                        <label for="blue" style="cursor: pointer"
                                                               class="m-2">Blue</label>
                                                    </div>
                                                    <div class="col-md-3 d-flex align-content-center justify-content-between">
                                                        <form:checkbox path="color" value="white" id="white"
                                                                       cssStyle="accent-color: white; transform: scale(1.5);"/>
                                                        <label for="white" style="cursor: pointer"
                                                               class="m-2">White</label>
                                                    </div>
                                                    <form:errors path="color" cssClass="text-danger"/>
                                                </div>

                                            </div>
                                            <div class="form-group col-md-6">
                                                <label>Size</label>
                                                <div style="user-select: none;" class="row">
                                                    <div class="col-md-3 d-flex align-content-center justify-content-around">
                                                        <form:checkbox path="size" value="s" id="s"
                                                                       cssStyle="accent-color: white; transform: scale(1.5);"/>
                                                        <label for="s" style="cursor: pointer"
                                                               class="m-2">S</label>
                                                    </div>
                                                    <div class="col-md-3 d-flex align-content-center justify-content-around">
                                                        <form:checkbox path="size" value="m" id="m"
                                                                       cssStyle="accent-color: white; transform: scale(1.5);"/>
                                                        <label for="m" style="cursor: pointer"
                                                               class="m-2">M</label>
                                                    </div>
                                                    <div class="col-md-3 d-flex align-content-center justify-content-around">
                                                        <form:checkbox path="size" value="l" id="l"
                                                                       cssStyle="accent-color: white; transform: scale(1.5);"/>
                                                        <label for="l" style="cursor: pointer"
                                                               class="m-2">L</label>
                                                    </div>
                                                    <div class="col-md-3 d-flex align-content-center justify-content-around">
                                                        <form:checkbox path="size" value="xl" id="xl"
                                                                       cssStyle="accent-color: white; transform: scale(1.5);"/>
                                                        <label for="xl" style="cursor: pointer"
                                                               class="m-2">XL</label>
                                                    </div>
                                                    <form:errors path="color" cssClass="text-danger"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <button type="submit" class="btn btn-primary mr-2">Create</button>
                                    <button type="button" class="btn btn-light"
                                            onclick="window.location.href='product-management'">Cancel
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
                                        <td><i class="mdi mdi-table-edit"
                                               style="font-size: 1.5rem; color: darkgreen"></i></td>
                                        <td onclick="confirmDelete(this)"><i class="mdi mdi-delete"
                                                                             style="font-size: 1.5rem; color: red"></i>
                                        </td>
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
                                        <td><i class="mdi mdi-table-edit"
                                               style="font-size: 1.5rem; color: darkgreen"></i></td>
                                        <td onclick="confirmDelete(this)"><i class="mdi mdi-delete"
                                                                             style="font-size: 1.5rem; color: red"></i>
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
                <span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Design by LANH</span>
                <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Contact to <a href="">lanhnvpc06581@fpt.edu.vn</a></span>
            </div>
        </footer>
    </div>
</div>
<script>
    const confirmDelete = (e) => {
        console.log(e)
        Swal.fire({
            title: "Are you sure?",
            text: "You won't be able to revert this!",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Yes, delete it!"
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire({
                    title: "Deleted!",
                    text: "Your file has been deleted.",
                    icon: "success"
                });
            }
        });
    }
</script>
