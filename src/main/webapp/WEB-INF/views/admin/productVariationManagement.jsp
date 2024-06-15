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
                <h3 class="page-title">Products variation management</h3>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/admin/dashboard">Admin</a></li>
                        <li class="breadcrumb-item active" aria-current="page"> Products variation management</li>
                    </ol>
                </nav>
            </div>
            <div class="row">
                <div class="col-md-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Product variation form</h4>
                            <p class="card-description">Create - Update</p>
                            <%--@elvariable id="productItem" type="com.poly.entities.ProductItem"--%>
                            <form:form class="forms-sample row" method="post" modelAttribute="productItem"
                                       enctype="multipart/form-data">
                                <form:hidden path="productItemId"/>
                                <div class="form-group col-md-6">
                                    <label for="product">Product</label>
                                    <input type="hidden" value="${product.productId}" name="product" id="product">
                                    <input type="text" value="${product.name}" class="form-control" readonly>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="price">Price</label>
                                    <form:input path="price" type="number" class="form-control" id="price"
                                                placeholder="Product price"/>
                                    <form:errors path="price" cssClass="text-danger"
                                                 cssStyle="font-size: 14px; margin: 4px"/>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="quantity">Quantity</label>
                                    <form:input path="quantity" type="number" class="form-control" id="quantity"
                                                placeholder="Quantity"/>
                                    <form:errors path="quantity" cssClass="text-danger"
                                                 cssStyle="font-size: 14px; margin: 4px"/>
                                </div>
                                <div class="form-group col-md-6 row">
                                    <div class="form-group col-md-6">
                                        <label>Color</label>
                                        <form:select path="color" cssClass="form-control">
                                            <form:option value="">-- Select Color --</form:option>
                                            <form:options items="${colors}" itemLabel="colorName"/>
                                        </form:select>
                                        <form:errors path="color" cssClass="text-danger col-12 p-0"
                                                     cssStyle="font-size: 14px; margin: 4px 12px"/>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="size">Size</label>
                                        <form:select path="size" class="form-control" id="size">
                                            <form:option value="">-- Select Size --</form:option>
                                            <form:options items="${sizes}" itemLabel="sizeName" itemValue="sizeId"/>
                                        </form:select>
                                        <form:errors path="size" cssClass="text-danger"
                                                     cssStyle="font-size: 14px; margin: 4px"/>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <button type="submit" class="btn btn-primary mr-2" ${disabledSave}
                                            formaction="/admin/product-variation-management/create?product_id=${product.productId}">
                                        Save
                                    </button>
                                    <button type="submit" class="btn btn-behance mr-2" ${disabledUpdate}
                                            formaction="/admin/product-variation-management/update?product_id=${product.productId}">Update
                                    </button>
                                    <button type="button" class="btn btn-light"
                                            onclick="window.location.href='/admin/product-variation-management?product_id=${product.productId}'">Cancel
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
                            <h4 class="card-title">Product variation table</h4>
                            <p class="card-description">
                                All of products variation
                            </p>
                            <div class="table-responsive">
                                <table class="table table-hover" style="cursor: pointer">
                                    <thead>
                                    <tr>
                                        <th>Id</th>
                                        <%--                                        <th>Image</th>--%>
                                        <th>Name</th>
                                        <th>
                                            <a href="/admin/product-variation-management/sort?column=price"
                                               style="text-decoration: none; color: #0b0e11">
                                                Price
                                            </a>
                                        </th>
                                        <th>Quantity</th>
                                        <th>Color</th>
                                        <th>Size</th>
                                        <th>Update</th>
                                        <th>Delete</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <jsp:useBean id="productItems" scope="request" type="java.util.List"/>
                                    <c:forEach var="productItem" items="${productItems}">
                                        <tr>
                                            <td>${productItem.productItemId}</td>
                                            <td>${productItem.product.name}</td>
                                            <td>${productItem.price}</td>
                                            <td>
                                                    ${productItem.quantity}
                                            </td>
                                            <td>
                                                    <span class="badge py-2 px-3"
                                                          style="background: ${productItem.color.colorName};">

                                                    </span>
                                            </td>
                                            <td>
                                                    ${productItem.size.sizeName}
                                            </td>
                                            <td>
                                                <a href="/admin/product-variation-management/edit/${productItem.productItemId}?product_id=${product.productId}">
                                                    <i class="mdi mdi-table-edit"
                                                       style="font-size: 1.5rem; color: darkgreen"></i>
                                                </a>
                                            </td>
                                            <td>
                                                <a onclick="confirmDelete(${productItem.productItemId}, ${product.productId})">
                                                    <i class="mdi mdi-delete"
                                                       style="font-size: 1.5rem; color: red"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <%--                                <div class="d-flex justify-content-center mt-4">--%>
                                <%--                                    <c:forEach var="i" begin="1" end="${productItems.totalPages}" step="1">--%>
                                <%--                                        <a href="/admin/product-variation-management/page?page=${i-1}"--%>
                                <%--                                           class="bg-primary text-white rounded-lg mx-1 d-flex align-items-center justify-content-center"--%>
                                <%--                                           style="text-decoration: none; width: 32px; height: 28px">--%>
                                <%--                                                ${i}--%>
                                <%--                                        </a>--%>
                                <%--                                    </c:forEach>--%>
                                <%--                                </div>--%>
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
<script>
    // confirm delete
    const confirmDelete = (productItemId, productId) => {
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
                    window.location.href = `/admin/product-variation-management/delete/` + productItemId + "?product_id=" + productId;
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
