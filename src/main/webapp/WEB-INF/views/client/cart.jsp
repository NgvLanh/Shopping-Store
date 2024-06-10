<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<style>
    .coupon-container {
        display: flex;
        align-items: center;
        position: relative;
    }

    .coupon-input {
        flex: 1;
        margin-right: 10px; /* Khoảng cách giữa input và nút */
    }

    .apply-btn {
        min-width: 80px; /* Đảm bảo nút có độ rộng tối thiểu */
        border-radius: 5px; /* Đường viền cong */
    }

</style>
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
                            <span class="d-none" id="cartItemId">${item.cartItemId}</span>
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

                                        <input type="number" name="qty" id="sst" maxlength="3" value="${item.quantity}"
                                               min="1" max="${item.productItem.quantity}"
                                               title="Quantity:" oninput="this.form.submit()"
                                               class="input-text qty">

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
                            <a class="button" href="/cart">Update Cart</a>
                        </td>
                        <td colspan="5">
                            <div class="coupon-container">
                                <input type="text" class="form-control coupon-input" placeholder="Coupon Code">
                                <button class="btn btn-primary apply-btn">Apply</button>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5">
                            <div class="d-flex flex-column align-items-end">
                                <div class="my-2">
                                    <h5>Shipping fee: $ 2.00</h5>
                                </div>
                                <div class="d-flex">
                                    <h5 class="mr-2">Subtotal $</h5>
                                    <h5 id="subtotal"></h5>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr class="shipping_area">
                        <td colspan="4">
                            <h5>Shipping</h5>
                        </td>
                        <td colspan="1">
                            <div class="shipping_box">
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
                    <form action="/order" method="post">
                        <h2>Your Order</h2>
                        <ul class="list">
                            <li>
                                <a href="#">
                                    <h4>Product<span>Total</span></h4>
                                </a>
                            </li>
                            <c:set var="subtotal" value="0"/>
                            <c:forEach var="item" items="${cartItems}">
                                <li>
                                    <a href="/cart">${item.productItem.product.name}
                                        <span class="middle">${item.quantity}x</span>
                                        <span class="last">$<fmt:formatNumber
                                                value="${item.productItem.price * item.quantity}"
                                                type="number" minFractionDigits="2"
                                                maxFractionDigits="2"/></span>
                                    </a>
                                </li>
                                <c:set var="subtotal" value="${subtotal + (item.productItem.price * item.quantity)}"/>
                            </c:forEach>

                            <c:set var="shippingCost" value="2"/>
                            <c:set var="total" value="${subtotal + shippingCost}"/>

                            <ul class="list list_2">
                                <li><a href="#">Subtotal <span>$<fmt:formatNumber value="${subtotal}" type="number"
                                                                                  minFractionDigits="2"
                                                                                  maxFractionDigits="2"/></span></a>
                                </li>
                                <li><a href="#">Shipping <span>$<fmt:formatNumber value="${shippingCost}" type="number"
                                                                                  minFractionDigits="2"
                                                                                  maxFractionDigits="2"/></span></a>
                                </li>
                                <li><a href="#">Total <span>$<fmt:formatNumber value="${total}" type="number"
                                                                               minFractionDigits="2"
                                                                               maxFractionDigits="2"/></span></a></li>
                            </ul>

                            <!-- Hidden field to store the total value -->
                            <input type="hidden" name="total" value="${total}"/>
                            <div class="payment_item">
                                <div class="radion_btn">
                                    <input type="radio" id="f-option5" name="payment-method" value="off">
                                    <label for="f-option5">Payment on delivery</label>
                                    <div class="check"></div>
                                </div>
                                <p>Receive goods then pay directly with the delivery person.</p>
                            </div>
                            <div class="payment_item active">
                                <div class="radion_btn">
                                    <input type="radio" id="f-option6" name="payment-method" value="onl">
                                    <label for="f-option6">Online payment</label>
                                    <img src="img/product/card.jpg" alt="">
                                    <div class="check"></div>
                                </div>
                                <p>Pay quickly with online wallet or banking.</p>
                            </div>
                            <div class="text-center">
                                <button type="submit" class="button button-paypal">Order now</button>
                            </div>
                        </ul>
                    </form>
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
        let shippingFee = 2.00;
        subtotalValue += shippingFee;
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
