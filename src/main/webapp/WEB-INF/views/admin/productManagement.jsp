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
                            <%--@elvariable id="product" type="com.poly.entities.Product"--%>
                            <form:form class="forms-sample row" method="post"
                                       modelAttribute="product" enctype="multipart/form-data">
                                <form:hidden path="productId"/>
                                <div class="form-group col-md-6">
                                    <label for="name">Name</label>
                                    <form:input path="name" type="text" class="form-control" id="name"
                                                placeholder="Product name"/>
                                    <form:errors path="name" cssClass="text-danger"
                                                 cssStyle="font-size: 14px; margin: 4px"/>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="description">Description</label>
                                    <form:input path="description" type="text" class="form-control"
                                                id="description"
                                                placeholder="Description"/>
                                    <form:errors path="description" cssClass="text-danger"
                                                 cssStyle="font-size: 14px; margin: 4px"/>
                                </div>
                                <form:hidden path="image"/>
                                <div class="form-group col-md-6">
                                    <label for="image">Image</label>
                                    <input name="photo" type="file" class="form-control" id="photo"
                                           placeholder="Image"/>
                                    <div class="border d-block mt-2" style="height: 200px;">
                                        <img src="../../../uploads/${srcImage}" alt="image" id="imagePreview"
                                             width="50%"
                                             height="100%"
                                             style="display: none; margin: auto">
                                    </div>
                                    <span class="text-danger"
                                          style="font-size: 14px; margin: 4px">${msgImage}</span>
                                </div>
                                <div class="form-group col-md-6">
                                    <div class="row">
                                        <div class="form-group col-md-12">
                                            <label for="brand">Brand</label>
                                            <form:select path="brand" class="form-control" id="brand">
                                                <form:option value="">-- Select Brand --</form:option>
                                                <jsp:useBean id="brands" scope="request" type="java.util.List"/>
                                                <form:options items="${brands}" itemLabel="name"/>
                                            </form:select>
                                            <form:errors path="brand" cssClass="text-danger"
                                                         cssStyle="font-size: 14px; margin: 4px"/>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="category">Category</label>
                                            <form:select path="category" class="form-control" id="category">
                                                <form:option value="">-- Select Category --</form:option>
                                                <jsp:useBean id="categories" scope="request" type="java.util.List"/>
                                                <form:options items="${categories}" itemLabel="name"/>
                                            </form:select>
                                            <form:errors path="category" cssClass="text-danger"
                                                         cssStyle="font-size: 14px; margin: 4px"/>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="supplier">Supplier</label>
                                            <form:select path="supplier" class="form-control" id="supplier">
                                                <form:option value="">-- Select Supplier --</form:option>
                                                <jsp:useBean id="suppliers" scope="request" type="java.util.List"/>
                                                <form:options items="${suppliers}" itemLabel="supplierName"/>
                                                <!-- Add more options as necessary -->
                                            </form:select>
                                            <form:errors path="supplier" cssClass="text-danger"
                                                         cssStyle="font-size: 14px; margin: 4px"/>
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
                                        <th>Brand</th>
                                        <th>Description</th>
                                        <th>Category</th>
                                        <th>Supplier</th>
                                        <th>Update</th>
                                        <th>Variation</th>
                                        <th>Delete</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%-- Danh sách các phần tử --%>
                                    <c:set var="items" value="${products}"/>
                                    <%-- Biến đếm --%>
                                    <c:set var="count" value="0"/>
                                    <c:forEach var="product" items="${products}">
                                        <c:set var="count" value="${count + 1}"/> <%-- Tăng biến đếm --%>
                                        <tr>
                                            <td>${count}</td>

                                            <td><img src="../../../uploads/${product.image}" alt=""></td>
                                            <td>${product.name}</td>
                                            <td>
                                                    ${product.brand.name}
                                            </td>
                                            <td>
                                                    ${product.description}
                                            </td>
                                            <td>
                                                    ${product.category.name}
                                            </td>
                                            <td>
                                                    ${product.supplier.supplierName}
                                            </td>
                                            <td>
                                                <a href="/admin/product-management/edit/${product.productId}">
                                                    <i class="mdi mdi-table-edit"
                                                       style="font-size: 1.5rem; color: darkgreen"></i>
                                                </a>
                                            </td>
                                            <td>
                                                <!-- Button trigger modal -->
                                                <a href="/admin/product-variation-management?product_id=${product.productId}">
                                                    <i class="mdi mdi-table-plus" data-toggle="modal"
                                                       data-target="#staticBackdrop"
                                                       style="font-size: 1.5rem; color: coral"></i>
                                                </a>
                                            </td>
                                            <td>
                                                <a onclick="confirmDelete(${product.productId})">
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
<%----%>
<script>
    <c:if test="${msgDeleteProduct}">
        Swal.fire({
            title: "Something went wrong?",
            text: "Product data still exists so cannot be deleted!",
            icon: "error",
            confirmButtonText: "Ok"
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = `/admin/product-management`;
            }
        });
    </c:if>
    // confirm delete
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

    // photo review
    const photo = document.getElementById('photo');
    photo.addEventListener('change', () => {
        const file = photo.files[0];
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
