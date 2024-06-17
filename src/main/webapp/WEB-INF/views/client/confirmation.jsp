<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- ================ start banner area ================= -->
<section class="blog-banner-area" id="category">
    <div class="container h-100">
        <div class="blog-banner">
            <div class="text-center">
                <h1>Your Order</h1>
                <nav aria-label="breadcrumb" class="banner-breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Shop Category</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</section>
<!-- ================ end banner area ================= -->

<!--================Order Details Area =================-->
<section class="order_details section-margin--small">
    <div class="container">
        <p class="text-center billing-alert">
            <c:choose>
                <c:when test="${not empty sessionScope.customer}">
                    Thank you. Your order has been received.
                </c:when>
                <c:otherwise>
                    Please log in to view your order.
                </c:otherwise>
            </c:choose>
        </p>
        <c:forEach var="order" items="${orders}">
            <div class="order_details_table">
                <h2>Order Details (${order.orderId})</h2>
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col">Date</th>
                            <th scope="col">Status</th>
                            <th scope="col">Total</th>
                            <th scope="col">Cancel</th>
                            <th scope="col">Received</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>
                                <p>${order.date}</p>
                            </td>
                            <td>
                                <h5 class="status">${order.status}</h5>
                            </td>
                            <td>
                                <p>
                                        ${order.total}
                                        <%--                                    <fmt:formatNumber value="${order.total}"/>--%>
                                </p>
                            </td>
                            <td>
                                <button class="cancel btn btn-outline-dark" onclick="confirmCancel(${order.orderId})">
                                    Cancel
                                </button>
                            </td>
                            <td>
                                <button class="received btn btn-outline-success"
                                        onclick="confirmReceived(${order.orderId})">
                                    Yes
                                </button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="mt-4">
                    <p class="d-flex align-items-center">
                        <a href="/your-order/order-details?order_id=${order.orderId}">
                            View all products
                        </a>
                        <button class="btn" type="button" data-toggle="collapse"
                                data-target="#collapse${order.orderId}" aria-expanded="false"
                                aria-controls="collapseExample"
                                style="transform: rotate(90deg); color: #007bff; background: transparent;
                                box-shadow: none !important; padding: 8px;">
                            >
                        </button>
                    </p>
                    <div class="collapse" id="collapse${order.orderId}">
                        <div class="card card-body">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th scope="col">Name</th>
                                    <th scope="col">Quantity</th>
                                    <th scope="col">Price</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="item" items="${orderItems}">
                                    <tr>
                                        <td>
                                            <p>${item.productItem.product.name}</p>
                                        </td>
                                        <td>
                                            <h5>${item.quantity}</h5>
                                        </td>
                                        <td>
                                            <p>
                                                    ${item.price}
                                            </p>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</section>
<!--================End Order Details Area =================-->
<script>

    const receivedButtons = document.querySelectorAll('.received');
    const cancelButtons = document.querySelectorAll('.cancel');
    const statusElements = document.querySelectorAll('.status');

    cancelButtons.forEach((cancelButton, index) => {
        const orderStatus = statusElements[index].textContent.trim().toLowerCase();
        cancelButton.disabled = (orderStatus !== 'wait to confirmation');
    });

    receivedButtons.forEach((receivedButton, index) => {
        const orderStatus = statusElements[index].textContent.trim().toLowerCase();
        receivedButton.disabled = (orderStatus !== 'shipping orders');
    });

    const confirmReceived = (id) => {
        Swal.fire({
            title: "Are you sure?",
            text: "You won't be able to revert this!",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Yes, Received it!"
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire({
                    title: "Received!",
                    text: "Thank you for your order.",
                    icon: "success"
                }).then(() => {
                    window.location.href = `/your-order/update-status?status=delivered&order_id=` + id;
                });
            }
        });
    }
    const confirmCancel = (id) => {
        Swal.fire({
            title: "Are you sure?",
            text: "You won't be able to revert this!",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Yes, Cancel it!"
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire({
                    title: "Cancel!",
                    text: "Your order has been Canceled.",
                    icon: "success"
                }).then(() => {
                    window.location.href = `/your-order/update-status?status=cancel&order_id=` + id;
                });
            }
        });
    }
</script>

<!--================ Start footer Area =================-->