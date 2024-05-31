<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

    .row > span {
        padding: 10px;
        display: flex;
        gap: 12px;
    }

    .row > span > label {
        margin: 0;
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
                        <li class="breadcrumb-item"><a href="/admin/dashboard">Admin</a></li>
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
                            <%--@elvariable id="productItem" type="com.poly.entities.ProductItem"--%>
                            <form:form class="forms-sample row" method="post"
                                       modelAttribute="productItem" enctype="multipart/form-data">
                                <form:hidden path="product.productId"/>
                                <form:hidden path="productItemId"/>
                                <div class="form-group col-md-6">
                                    <label for="name">Name</label>
                                    <form:input path="product.name" type="text" class="form-control" id="name"
                                                placeholder="Product name"/>
                                    <form:errors path="product.name" cssClass="text-danger"
                                                 cssStyle="font-size: 14px; margin: 4px"/>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="description">Description</label>
                                    <form:input path="product.description" type="text" class="form-control"
                                                id="description"
                                                placeholder="Description"/>
                                    <form:errors path="product.description" cssClass="text-danger"
                                                 cssStyle="font-size: 14px; margin: 4px"/>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="price">Price</label>
                                    <form:input path="product.price" type="number" class="form-control" id="price"
                                                placeholder="Price"/>
                                    <form:errors path="product.price" cssClass="text-danger"
                                                 cssStyle="font-size: 14px; margin: 4px"/>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="quantity">Quantity</label>
                                    <form:input path="product.quantity" type="number" class="form-control" id="quantity"
                                                placeholder="Quantity"/>
                                    <form:errors path="product.quantity" cssClass="text-danger"
                                                 cssStyle="font-size: 14px; margin: 4px"/>
                                </div>
                                <form:hidden path="product.image"/>
                                <div class="form-group col-md-6">
                                    <label for="image">Image</label>
                                    <input name="image" type="file" class="form-control" id="image"
                                           placeholder="Image"/>
                                    <div class="border d-block mt-2" style="height: 200px;">
                                        <img src="../../../uploads/${srcImage}" alt="image" id="imagePreview" width="50%"
                                             height="100%"
                                             style="display: none; margin: auto">
                                    </div>
                                    <span class="text-danger"
                                          style="font-size: 14px; margin: 4px">${msgImage}</span>

                                </div>
                                <div class="form-group col-md-6">
                                    <div class="form-group col-md-12 p-0">
                                        <label for="brand">Brand</label>
                                        <form:select path="product.brand" class="form-control" id="brand">
                                            <form:option value="">-- Select Brand --</form:option>
                                            <jsp:useBean id="brands" scope="request" type="java.util.List"/>
                                            <form:options items="${brands}" itemLabel="name"/>
                                        </form:select>
                                        <form:errors path="product.brand" cssClass="text-danger"
                                                     cssStyle="font-size: 14px; margin: 4px"/>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <label for="category">Category</label>
                                            <form:select path="product.category" class="form-control" id="category">
                                                <form:option value="">-- Select Category --</form:option>
                                                <jsp:useBean id="categories" scope="request" type="java.util.List"/>
                                                <form:options items="${categories}" itemLabel="name"/>
                                            </form:select>
                                            <form:errors path="product.category" cssClass="text-danger"
                                                         cssStyle="font-size: 14px; margin: 4px"/>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="supplier">Supplier</label>
                                            <form:select path="product.supplier" class="form-control" id="supplier">
                                                <form:option value="">-- Select Supplier --</form:option>
                                                <jsp:useBean id="suppliers" scope="request" type="java.util.List"/>
                                                <form:options items="${suppliers}" itemLabel="supplierName"/>
                                                <!-- Add more options as necessary -->
                                            </form:select>
                                            <form:errors path="product.supplier" cssClass="text-danger"
                                                         cssStyle="font-size: 14px; margin: 4px"/>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <label>Color</label>
                                            <div style="user-select: none;" class="row">
                                                <jsp:useBean id="colors" scope="request" type="java.util.List"/>
                                                <form:checkboxes path="colors" items="${colors}" itemLabel="colorName"
                                                                 cssClass="m-0"
                                                                 cssStyle="transform: scale(1.5); accent-color: whitesmoke;"/>
                                                <form:errors path="colors" cssClass="text-danger col-12 p-0"
                                                             cssStyle="font-size: 14px; margin: 4px 12px"/>
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label>Size</label>
                                            <div style="user-select: none;" class="row">
                                                <jsp:useBean id="sizes" scope="request" type="java.util.List"/>
                                                <form:checkboxes path="sizes" items="${sizes}" itemLabel="sizeName"
                                                                 cssClass="m-0"
                                                                 cssStyle="transform: scale(1.5); accent-color: whitesmoke;"/>
                                                <form:errors path="sizes" cssClass="text-danger col-12 p-0"
                                                             cssStyle="font-size: 14px; margin: 4px 12px"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <button type="submit" class="btn btn-primary mr-2" ${disabledSave}
                                    formaction="/admin/product-management/create">Save
                                    </button>
                                    <button type="submit" class="btn btn-behance mr-2" ${disabledUpdate}
                                            formaction="/admin/product-management/update">
                                        Update
                                    </button>
                                    <button type="button" class="btn btn-light"
                                            onclick="window.location.href='/admin/product-management'">Cancel
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
                                        <th>Id</th>
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
                                    <c:forEach var="productItem" items="${productItemList}">
                                        <tr>
                                            <td>${productItem.productItemId}</td>
                                            <td><img src="../../../uploads/${productItem.product.image}" alt=""></td>
                                            <td>${productItem.product.name}</td>
                                            <td>
                                                <fmt:formatNumber value="${productItem.product.price}"/>
                                            </td>
                                            <td>
                                                <label class="badge" style="background:white;">
                                                    <c:forEach var="color" items="${productItem.colors}">
                                                        [ ${color.colorName} ]
                                                    </c:forEach>
                                                </label>
                                            </td>
                                            <td>
                                                    ${productItem.product.quantity}
                                            </td>
                                            <td>
                                                    ${productItem.product.brand.name}
                                            </td>
                                            <td>
                                                    ${productItem.product.description}
                                            </td>
                                            <td>
                                                    ${productItem.product.category.name}
                                            </td>
                                            <td>
                                                <c:forEach var="size" items="${productItem.sizes}">
                                                    [ ${size.sizeName} ]
                                                </c:forEach>
                                            </td>
                                            <td>
                                                    ${productItem.product.supplier.supplierName}
                                            </td>
                                            <td>
                                                <a href="/admin/product-management/edit/${productItem.productItemId}">
                                                    <i class="mdi mdi-table-edit"
                                                       style="font-size: 1.5rem; color: darkgreen"></i>
                                                </a>
                                            </td>
                                            <td>
                                                <a onclick="confirmDelete(${productItem.productItemId})">
                                                    <i class="mdi mdi-delete"
                                                       style="font-size: 1.5rem; color: red"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
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
<%----%>

<c:if test="${deleteError}">
    <script>
        Swal.fire({
            icon: "error",
            title: "Delete product error.",
        });
    </script>
</c:if>
<script>
    const confirmDelete = (id) => {
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
                }).then(() => {
                    window.location.href = `/admin/product-management/delete/` + id;
                });
            }
        });
    }

    // file review
    document.addEventListener('DOMContentLoaded', () => {
        const imagePreview = document.getElementById('imagePreview');
        if (imagePreview.src !== 'http://localhost:8080/uploads/') {
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
