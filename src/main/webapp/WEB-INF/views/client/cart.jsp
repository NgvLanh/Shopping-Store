<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

    select {
        display: block !important;
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
                    <c:set var="numberItem" value="${fn:length(cartItems)}"/>
                    <c:forEach var="item" items="${cartItems}">
                        <form action="/cart/update-quantity/${item.cartItemId}" method="post" id="itemCart">
                            <span class="d-none" id="cartItemId">${item.cartItemId}</span>
                            <tr>
                                <td>
                                    <div class="media">
                                        <div class="d-flex">
                                            <img src="../../uploads/${item.productItem.product.image}" alt=""
                                                 width="150px">
                                        </div>
                                        <div class="media-body">
                                            <a href="/single-product?product_id=${item.productItem.product.productId}">${item.productItem.product.name}</a>
                                            <div style="display:flex; gap: 4px;">
                                                <p style="color: ${item.productItem.color.colorName}">${item.productItem.color.colorName}</p>
                                                - <p style="color: black">${item.productItem.size.sizeName}</p>
                                            </div>
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
                        <form action="/cart/add-code" method="post">
                            <td colspan="3">
                                <a class="button" href="/cart">Update Cart</a>
                            </td>
                            <td colspan="5">
                                <div class="coupon-container" style="display:flex; flex-direction: column">
                                    <div class="d-flex">
                                        <input type="text" class="form-control coupon-input" placeholder="Coupon Code"
                                               style="box-shadow: none;"
                                               name="code">
                                        <button type="submit" class="btn btn-primary apply-btn"
                                                style="background: #384aeb;">Apply
                                        </button>
                                    </div>
                                    <c:if test="${not empty msgCode}">
                                        <c:set var="discountPercent" value="${percent}"/>
                                        <div class="px-1 my-2 w-100" style="display:flex; justify-content: start">
                                            <span>${msgCode}</span>
                                        </div>
                                    </c:if>
                                </div>
                            </td>
                        </form>
                    </tr>
                    <tr class="shipping_area">
                        <td colspan="3">
                            <h5>Shipping</h5>
                            <div class="" style="z-index: 10">
                                <div class="row">
                                    <div class="col-md-12 mt-2">
                                        <label for="province"
                                               class="">Province/City:</label>
                                        <select id="province" class="form-control" onchange="fetchDistricts()">
                                            <option value="">Select Province/City</option>
                                        </select>
                                    </div>
                                    <div class="col-md-12 mt-2">
                                        <label for="district" class="">District:</label>
                                        <select id="district" class="form-control" onchange="fetchWards()">
                                            <option value="">Select District</option>
                                        </select>
                                    </div>
                                    <div class="col-md-12 mt-2">
                                        <label for="ward" class="">Ward:</label>
                                        <select id="ward" class="form-control" onchange="calculateShippingFee()">
                                            <option value="">Select Ward</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </td>
                        <td colspan="5">
                            <div class="col-md-12 mt-12 ">
                                <div class="d-flex justify-content-end">
                                    <p id="total-cart" class="mb-2">Subtotal: </p>
                                </div>
                                <div class="d-flex justify-content-end">
                                    <p class="mb-2">
                                        Discount (%):
                                    <p id="discount">${discountPercent}</p>
                                    </p>
                                </div>
                                <div class="d-flex justify-content-end">
                                    <p id="shippingFee" class="mb-2">Shipping fee: </p>
                                </div>
                                <div class="d-flex justify-content-end">
                                    <p id="tempSubtotal" class="d-none"></p>
                                    <p id="subtotal" class="mb-2">Total: </p>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr class="out_button_area">
                        <td colspan="4">
                        </td>
                        <td colspan="1">
                            <div class="checkout_btn_inner d-flex align-items-center">
                                <a class="gray_btn" href="/home">Continue Shopping</a>
                                <button class="primary-btn ml-2" id="check-out"
                                        data-toggle="modal"
                                        data-target="#exampleModal"
                                        style="border: none"
                                        <c:if test="${numberItem == 0}">
                                            disabled
                                        </c:if>
                                >Checkout
                                </button>

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
                                        <span class="middle">x${item.quantity}</span>
                                        <span class="last">$<fmt:formatNumber
                                                value="${item.productItem.price * item.quantity}"
                                                type="number" minFractionDigits="2"
                                                maxFractionDigits="2"/></span>
                                    </a>
                                </li>
                                <c:set var="subtotal" value="${subtotal + (item.productItem.price * item.quantity)}"/>
                            </c:forEach>

                            <%--                            <c:set var="shippingCost" value=""/>--%>
                            <%--                            <c:set var="total"--%>
                            <%--                                   value="${discountPercent == 0 ? (subtotal + shippingCost) : ((subtotal + shippingCost) * (100 - discountPercent)) / 100}"/>--%>

                            <ul class="list list_2">
                                <li><a href="#">Subtotal <span id="subtotal-bill">

                                </span></a>
                                </li>
                                <li><a href="#">Shipping <span id="shipping-bill"></span></a>
                                </li>
                                <li><a href="#">Discount
                                    <span>
                                        <c:if test="${not empty discountPercent}">
                                            ${discountPercent}%
                                        </c:if>
                                    </span>
                                </a>
                                </li>
                                <li><a href="#">Total <span id="total-bill">
                                </span></a></li>
                            </ul>

                            <!-- Hidden field to store the total value -->
                            <input type="hidden" name="total" id="input-hidden-total-bill"/>
                            <div class="payment_item">
                                <div class="radion_btn">
                                    <input type="radio" id="f-option5" name="payment-method" value="off" checked>
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
    const tempSubtotal = document.getElementById('tempSubtotal');

    function updateTotals() {
        let subtotalValue = 0;
        inputQuantities.forEach((inputQuantity, index) => {
            const qty = Number(inputQuantity.value);
            const priceValue = Number(prices[index].textContent);
            const totalValue = qty * priceValue;
            totals[index].textContent = totalValue.toFixed(2);
            subtotalValue += totalValue;
        });
        tempSubtotal.textContent = subtotalValue;
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

    const buttonCheckOut = setInterval(function () {
            const disabledButtonCheckOut = document.getElementById('check-out');
            const total = document.getElementById('total-bill');
            const itemCart = document.getElementById('itemCart');
            console.log(itemCart)
            disabledButtonCheckOut.disabled = total.textContent.trim() === '' || itemCart == null;
        }
        , 1000);

    window.addEventListener('DOMContentLoaded', () => {
        updateTotals();
    });

    const token = '498e4765-2862-11ef-8e53-0a00184fe694';  // Thay thế bằng token thực
    const shopId = '192565';  // Thay thế bằng shop ID thực

    const provinceId = 220;  // ID của tỉnh muốn lấy tên
    const districtId = 1574;  // ID của quận/huyện muốn lấy tên
    const wardId = "550307";  // ID của phường/xã muốn lấy tên

    document.addEventListener("DOMContentLoaded", function () {
        fetchProvinces();

        fetchProvinceNameById(provinceId)
            .then(provinceName => {
                document.getElementById('provinceName').textContent = 'Tên tỉnh/thành phố: ' + provinceName;
            })
            .catch(error => {
                console.error('Error:', error);
            });

        fetchDistrictNameById(districtId)
            .then(districtName => {
                document.getElementById('districtName').textContent = 'Tên quận/huyện: ' + districtName;
            })
            .catch(error => {
                console.error('Error:', error);
            });

        fetchWardNameById(wardId)
            .then(wardName => {
                document.getElementById('wardName').textContent = 'Tên phường/xã: ' + wardName;
            })
            .catch(error => {
                console.error('Error:', error);
            });
    });


    // Hàm lấy tên tỉnh/thành phố theo ID
    function fetchProvinceNameById(provinceId) {
        return fetch('https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/province', {
            headers: {
                'Content-Type': 'application/json',
                'Token': token
            }
        })
            .then(response => response.json())
            .then(data => {
                const province = data.data.find(province => province.ProvinceID === provinceId);
                if (province) {
                    return province.ProvinceName;
                } else {
                    throw new Error('Province not found');
                }
            })
            .catch(error => {
                console.error('Error fetching province name:', error);
                throw error;
            });
    }

    // Hàm lấy tên quận/huyện theo ID
    function fetchDistrictNameById(districtId) {
        return fetch('https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/district?province_id=' + provinceId + '&shop_id=' + shopId, {
            headers: {
                'Content-Type': 'application/json',
                'Token': token
            }
        })
            .then(response => response.json())
            .then(data => {
                const district = data.data.find(district => district.DistrictID === districtId);
                if (district) {
                    return district.DistrictName;
                } else {
                    throw new Error('District not found');
                }
            })
            .catch(error => {
                console.error('Error fetching district name:', error);
                throw error;
            });
    }

    // Hàm lấy tên phường/xã theo ID
    function fetchWardNameById(wardId) {
        return fetch('https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/ward?district_id=' + districtId + '&shop_id=' + shopId, {
            headers: {
                'Content-Type': 'application/json',
                'Token': token
            }
        })
            .then(response => response.json())
            .then(data => {
                const ward = data.data.find(ward => ward.WardCode === wardId);
                if (ward) {
                    return ward.WardName;
                } else {
                    throw new Error('Ward not found');
                }
            })
            .catch(error => {
                console.error('Error fetching ward name:', error);
                throw error;
            });
    }

    function fetchProvinces() {
        fetch('https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/province', {
            headers: {
                'Content-Type': 'application/json',
                'Token': token
            }
        })
            .then(response => response.json())
            .then(data => {
                const provinceSelect = document.getElementById('province');
                const sortedProvinces = data.data.sort((a, b) => a.ProvinceName.localeCompare(b.ProvinceName));
                sortedProvinces.forEach(province => {
                    const option = document.createElement('option');
                    option.value = province.ProvinceID;
                    option.textContent = province.ProvinceName;
                    provinceSelect.appendChild(option);
                });
            })
            .catch(error => console.error('Error fetching provinces:', error));
    }

    function fetchDistricts() {
        const provinceId = document.getElementById('province').value;
        if (!provinceId) return;

        fetch('https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/district?province_id=' + provinceId + '&shop_id=' + shopId, {
            headers: {
                'Content-Type': 'application/json',
                'Token': token
            }
        })
            .then(response => response.json())
            .then(data => {
                const districtSelect = document.getElementById('district');
                districtSelect.innerHTML = '<option value="">Select District</option>';
                const wardSelect = document.getElementById('ward');
                wardSelect.innerHTML = '<option value="">Select Ward</option>';
                const sortedDistricts = data.data.sort((a, b) => a.DistrictName.localeCompare(b.DistrictName));
                sortedDistricts.forEach(district => {
                    const option = document.createElement('option');
                    option.value = district.DistrictID;
                    option.textContent = district.DistrictName;
                    districtSelect.appendChild(option);
                });
            })
            .catch(error => console.error('Error fetching districts:', error));
    }

    function fetchWards() {
        const districtId = document.getElementById('district').value;
        if (!districtId) return;

        fetch('https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/ward?district_id=' + districtId + '&shop_id=' + shopId, {
            headers: {
                'Content-Type': 'application/json',
                'Token': token
            }
        })
            .then(response => response.json())
            .then(data => {
                const wardSelect = document.getElementById('ward');
                wardSelect.innerHTML = '<option value="">Select Ward</option>';
                const sortedWards = data.data.sort((a, b) => a.WardName.localeCompare(b.WardName));
                sortedWards.forEach(ward => {
                    const option = document.createElement('option');
                    option.value = ward.WardCode;
                    option.textContent = ward.WardName;
                    wardSelect.appendChild(option);
                });
            })
            .catch(error => console.error('Error fetching wards:', error));
    }

    // Hàm định dạng số thành tiền tệ
    function formatCurrency(number) {
        return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }

    function calculateShippingFee() {
        const toDistrictId = document.getElementById('district').value;
        const toWardCode = document.getElementById('ward').value;
        if (!toDistrictId || !toWardCode) {
            alert('Please select your address.');
            return;
        }

        const params = new URLSearchParams({
            from_district_id: 1574,
            from_ward_code: '550307',
            service_id: 53320,
            service_type_id: '',
            to_district_id: toDistrictId,
            to_ward_code: toWardCode,
            height: 10,
            length: 10,
            weight: 10,
            width: 10,
            insurance_value: 10000,
            cod_failed_amount: 2000,
            coupon: ''
        });

        fetch('https://dev-online-gateway.ghn.vn/shiip/public-api/v2/shipping-order/fee?' + params.toString(), {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
                'Token': token,
                'ShopId': shopId
            }
        })
            .then(response => response.json())
            .then(data => {
                const shippingFeeElement = document.getElementById('shippingFee');
                const subtotal = document.getElementById('subtotal');
                const total = document.getElementById('total-cart');
                const shippingBill = document.getElementById('shipping-bill');
                const discount = document.getElementById('discount');
                // bill
                const subtotalBill = document.getElementById('subtotal-bill');
                const totalBill = document.getElementById('total-bill');
                const inputHiddenTotal = document.getElementById('input-hidden-total-bill');

                if (data.code === 200 && data.data) {
                    // const formattedShippingFee = formatCurrency(data.data.total);
                    const formattedShippingFee = data.data.total / 25000;
                    total.textContent = 'Subtotal: $' + Number(tempSubtotal.textContent).toFixed(2);
                    subtotalBill.textContent = '$ ' + Number(tempSubtotal.textContent).toFixed(2);
                    shippingFeeElement.textContent = 'Shipping fee: $ ' + formattedShippingFee.toFixed(2);
                    shippingBill.textContent = '$ ' + formattedShippingFee.toFixed(2);
                    subtotal.textContent = 'Total: $ ' + ((Number(tempSubtotal.textContent) + formattedShippingFee) * (100 - Number(discount.textContent)) / 100).toFixed(2);
                    totalBill.textContent = '$ ' + ((Number(tempSubtotal.textContent) + formattedShippingFee) * (100 - Number(discount.textContent)) / 100).toFixed(2);
                    inputHiddenTotal.value = (Number((Number(tempSubtotal.textContent) + formattedShippingFee) * (100 - Number(discount.textContent)) / 100)).toFixed(2);
                } else {
                    shippingFeeElement.textContent = 'Cannot calculating shipping fee';
                }
            })
            .catch(error => {
                console.error('Error calculating shipping fee:', error);
                document.getElementById('shippingFee').textContent = 'Error calculating shipping fee';
            });
    }
</script>

<!--================ Start footer Area =================-->
