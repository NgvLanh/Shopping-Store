<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--================ End Header Menu Area =================-->

<!-- ================ start banner area ================= -->
<section class="blog-banner-area" id="category">
    <div class="container h-100">
        <div class="blog-banner">
            <div class="text-center">
                <h1>Shopping Cart</h1>
                <nav aria-label="breadcrumb" class="banner-breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Shopping Cart</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</section>
<!-- ================ end banner area ================= -->


<!--================Cart Area =================-->
<section class="cart_area">
    <div class="container">
        <div class="cart_inner">
            <div class="table-responsive">
                <table class="table" style="table-layout: fixed; width: 100%;">
                    <thead>
                    <tr>
                        <th scope="col" style="width: 30%">Product</th>
                        <th scope="col" style="width: 10%">Price</th>
                        <th scope="col" style="width: 30%">Quantity</th>
                        <th scope="col" style="width: 20%">Total</th>
                        <th scope="col" style="width: 10%">Delete</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="item" items="${cartItems}">
                        <form action="/cart/update-quantity/${item.cartItemId}" method="post">
                            <span id="cartItemId">${item.cartItemId}</span>
                            <tr>
                                <td>
                                    <div class="media">
                                        <div class="d-flex">
                                            <img src="../../uploads/${item.productItem.product.image}" alt=""
                                                 width="150px">
                                        </div>
                                        <div class="media-body">
                                            <p>${item.productItem.product.name}</p>
                                            <p style="color: ${item.productItem.color.colorName}">${item.productItem.color.colorName}</p>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <h5>$
                                        <b id="price">${item.productItem.price}</b>
                                    </h5>
                                </td>
                                <td>
                                    <div class="product_count">
                                        <button class="increase items-count" type="button" style="right: -25px;">
                                            <i class="ti-angle-up"></i>
                                        </button>
                                        <input type="number" name="qty" id="sst" maxlength="3" value="${item.quantity}"
                                               title="Quantity:" oninput="this.form.submit()"
                                               class="input-text qty">
                                        <button class="reduced items-count" type="button" style="right: -25px;">
                                            <i class="ti-angle-down"></i>
                                        </button>
                                    </div>
                                    <i class="ml-5">Stock:
                                        <b id="stock">${item.productItem.quantity}</b>
                                    </i>
                                </td>
                                <td>
                                    <h5 class="d-flex">$
                                        <b id="total">${item.productItem.price * item.quantity}</b>
                                    </h5>
                                </td>
                                <td>
                                    <button type="button" class="btn" onclick="
                                            window.location.href = '/cart/delete?cart_item_id=${item.cartItemId}';
                                            ">Delete
                                    </button>
                                </td>
                            </tr>
                        </form>
                    </c:forEach>
                    <tr class="bottom_button">
                        <td colspan="3">
                            <a class="button" href="#">Update Cart</a>
                        </td>
                        <td colspan="5">
                            <div class="d-flex align-items-center position-relative">
                                <input type="text" class="form-control" placeholder="Coupon Code">
                                <a class="btn btn-primary" href="#">Apply</a>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5">
                            <div class="d-flex justify-content-end">
                                <h5 class="mr-2">Subtotal $</h5>
                                <h5 id="subtotal"></h5>
                            </div>

                        </td>
                    </tr>
                    <tr class="shipping_area">
                        <td colspan="4">
                            <h5>Shipping</h5>
                        </td>
                        <td colspan="1">
                            <div class="shipping_box">
                                <ul class="list">
                                    <li><a href="#">Online</a></li>
                                    <li class="active"><a href="#">Offline</a></li>
                                </ul>
                                <h6>Calculate Shipping <i class="fa fa-caret-down" aria-hidden="true"></i></h6>
                                <select class="shipping_select">
                                    <option value="can-tho">Can Tho</option>
                                </select>
                                <select class="shipping_select">
                                    <option value="nha-so-mot">Nha So 1</option>
                                </select>
                                <input type="text" placeholder="Address details">
                            </div>
                        </td>
                    </tr>
                    <tr class="out_button_area">
                        <td colspan="4">

                        </td>
                        <td colspan="1">
                            <div class="checkout_btn_inner d-flex align-items-center">
                                <a class="gray_btn" href="/home">Continue Shopping</a>
                                <a class="primary-btn ml-2" href="/cart?" data-toggle="modal"
                                   data-target="#exampleModal">Checkout</a>
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>
<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="margin-top: 200px; z-index: 10;">
        <div class="modal-content">
            <div class="modal-body">
                <div class="order_box">
                    <h2>Your Order</h2>
                    <ul class="list">
                        <li><a href="#"><h4>Product <span>Total</span></h4></a></li>
                        <c:forEach var="item" items="${cartItems}">
                            <li><a href="#">${item.productItem.product.name} <span class="middle">x</span> <span
                                    class="last">$720.00</span></a></li>
                        </c:forEach>
                    </ul>
                    <ul class="list list_2">
                        <li><a href="#">Subtotal <span>$2160.00</span></a></li>
                        <li><a href="#">Shipping <span>Flat rate: $50.00</span></a></li>
                        <li><a href="#">Total <span>$2210.00</span></a></li>
                    </ul>
                    <div class="payment_item">
                        <div class="radion_btn">
                            <input type="radio" id="f-option5" name="selector">
                            <label for="f-option5">Check payments</label>
                            <div class="check"></div>
                        </div>
                        <p>Please send a check to Store Name, Store Street, Store Town, Store State / County,
                            Store Postcode.</p>
                    </div>
                    <div class="payment_item active">
                        <div class="radion_btn">
                            <input type="radio" id="f-option6" name="selector">
                            <label for="f-option6">Paypal </label>
                            <img src="img/product/card.jpg" alt="">
                            <div class="check"></div>
                        </div>
                        <p>Pay via PayPal; you can pay with your credit card if you donât have a PayPal
                            account.</p>
                    </div>
                    <div class="creat_account">
                        <input type="checkbox" id="f-option4" name="selector">
                        <label for="f-option4">Iâve read and accept the </label>
                        <a href="#">terms &amp; conditions*</a>
                    </div>
                    <div class="text-center">
                        <a class="button button-paypal" href="#">Proceed to Paypal</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--================End Cart Area =================-->
<script>
    const reducedButtons = document.querySelectorAll('.reduced');
    const increaseButtons = document.querySelectorAll('.increase');
    const inputQuantities = document.querySelectorAll('#sst');
    const stocks = document.querySelectorAll('#stock');
    const prices = document.querySelectorAll('#price');
    const totals = document.querySelectorAll('#total');
    const subtotal = document.getElementById('subtotal');

    function updateTotals() {
        let subtotalValue = 0;
        inputQuantities.forEach((inputQuantity, index) => {
            const qty = Number(inputQuantity.value);
            const priceValue = Number(prices[index].textContent);
            const totalValue = qty * priceValue;
            totals[index].textContent = totalValue.toFixed(2);
            subtotalValue += totalValue;
        });

        subtotal.textContent = subtotalValue.toFixed(2);
    }

    inputQuantities.forEach((inputQuantity, index) => {
        inputQuantity.addEventListener('input', () => {
            let qty = Number(inputQuantity.value);
            const maxStock = Number(stocks[index].textContent);

            if (qty > maxStock) {
                inputQuantity.value = maxStock;
            } else if (isNaN(qty) || qty < 1) {
                inputQuantity.value = 1;
            }

            updateTotals();
        });
    });

    reducedButtons.forEach((reducedButton, index) => {
        reducedButton.addEventListener('click', () => {
            const inputQuantity = inputQuantities[index];
            if (inputQuantity.value > 1) {
                inputQuantity.value--;
                updateTotals();
            }
        });
    });

    increaseButtons.forEach((increaseButton, index) => {
        increaseButton.addEventListener('click', () => {
            const inputQuantity = inputQuantities[index];
            const maxStock = Number(stocks[index].textContent);
            if (Number(inputQuantity.value) < maxStock) {
                inputQuantity.value++;
                updateTotals();
            }
        });
    });

    window.addEventListener('DOMContentLoaded', () => {
        updateTotals();
    });
</script>

<!--================ Start footer Area =================-->
