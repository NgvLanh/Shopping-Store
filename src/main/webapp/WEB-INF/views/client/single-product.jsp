<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!--================ End Header Menu Area =================-->
<style>
    select {
        display: block !important;
    }
</style>
<!-- ================ start banner area ================= -->
<section class="blog-banner-area" id="blog">
    <div class="container h-100">
        <div class="blog-banner">
            <div class="text-center">
                <h1>Shop Single</h1>
                <nav aria-label="breadcrumb" class="banner-breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/home">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Shop Single</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</section>
<!-- ================ end banner area ================= -->


<!--================Single Product Area =================-->
<div class="product_image_area">
    <div class="container">
        <%--@elvariable id="productItem" type="com.poly.entities.ProductItem"--%>
        <form:form class="row s_product_inner"
                   modelAttribute="productItem" method="post">
            <div class="col-lg-6">
                <div class="owl-carousel owl-theme s_Product_carousel">
                    <div class="single-prd-item">
                        <img class="img-fluid" src="../../uploads/${productItem.product.image}" alt="">
                    </div>
                </div>
            </div>
            <div class="col-lg-5 offset-lg-1">
                <div class="s_product_text">
                    <h3>${productItem.product.name}</h3>
                    <h2>$
                        <fmt:formatNumber value="${productItem.price}"/>
                    </h2>
                    <ul class="list">
                        <li>
                            <a class="active" href="#">
                                <span>Category</span>
                                    ${productItem.product.category.name}</a>
                        </li>
                    </ul>
                    <p>
                            ${productItem.product.description}
                    </p>
                    <div class="product_count d-flex">
                        <label for="qty">Quantity:</label>
                        <div class="position-relative">
                            <button class="increase items-count" type="button" style="right: -25px;">
                                <i class="ti-angle-up"></i>
                            </button>
                            <input type="text" name="quantity" id="qty" size="2" maxlength="3" value="1"
                                   title="quantity"
                                   class="input-text qty text-center w-100 px-1"/>
                            <button class="reduced items-count" type="button" style="right: -25px;">
                                <i class="ti-angle-down"></i>
                            </button>
                        </div>
                    </div>
                    <div class="card_area row">
                        <div class="col-md-8">
                            <label>Color</label>
                            <div class="row">
                                <jsp:useBean id="colors" scope="request" type="java.util.Set"/>
                                <c:forEach var="color" items="${colors}">
                                    <div class="col-md-3 d-flex" style="gap: 4px;">
                                        <input type="radio" name="color" id="${color.colorName}"
                                               value="${color.colorId}"
                                               style="transform: scale(1.5); margin: 0 8px; accent-color: ${color.colorName}">
                                        <label for="${color.colorName}" class="m-0"
                                               style="cursor: pointer">${color.colorName}</label>
                                    </div>
                                </c:forEach>
                                <span class="text-danger w-100 ml-3">${msgColor}</span>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label for="size">Size</label>
                            <div class="row">
                                <jsp:useBean id="sizes" scope="request" type="java.util.Set"/>
                                <select name="size" id="size" class="form-control w-50">
                                    <option value="">Size</option>
                                    <c:forEach var="size" items="${sizes}">
                                        <option value="${size.sizeId}">${size.sizeName}</option>
                                    </c:forEach>
                                </select>
                                <span class="text-danger">${msgSize}</span>
                            </div>
                        </div>
                    </div>
                    <div class="add_to_cart mt-4 d-flex flex-column">
                        <button type="submit" class="button primary-btn"
                                formaction="/add-to-cart?product_id=${productItem.product.productId}">Add
                            to Cart
                        </button>
                        <span class="w-100 text-danger font-weight-medium mt-2"
                              style="font-size: 14px">${outOfStock}</span>
                    </div>
                </div>
            </div>
        </form:form>
    </div>
</div>
<!--================End Single Product Area =================-->

<!--================Product Description Area =================-->
<section class="product_description_area">
    <div class="container">
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" id="review-tab" data-toggle="tab" href="#review" role="tab"
                   aria-controls="review"
                   aria-selected="false">Reviews</a>
            </li>
        </ul>
        <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade show active" id="review" role="tabpanel" aria-labelledby="review-tab">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="row total_rate">
                            <div class="col-6">
                                <div class="box_total">
                                    <h5>Overall</h5>
                                    <h4>4.0</h4>
                                    <h6>(03 Reviews)</h6>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="rating_list">
                                    <h3>Based on 3 Reviews</h3>
                                    <ul class="list">
                                        <li><a href="#">5 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                                class="fa fa-star"></i><i
                                                class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
                                        <li><a href="#">4 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                                class="fa fa-star"></i><i
                                                class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
                                        <li><a href="#">3 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                                class="fa fa-star"></i><i
                                                class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
                                        <li><a href="#">2 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                                class="fa fa-star"></i><i
                                                class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
                                        <li><a href="#">1 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                                class="fa fa-star"></i><i
                                                class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="review_list">
                            <div class="review_item">
                                <div class="media">
                                    <div class="d-flex">
                                        <img src="img/product/review-1.png" alt="">
                                    </div>
                                    <div class="media-body">
                                        <h4>Blake Ruiz</h4>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                </div>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                                    incididunt ut labore et
                                    dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
                                    laboris nisi ut aliquip ex ea
                                    commodo</p>
                            </div>
                            <div class="review_item">
                                <div class="media">
                                    <div class="d-flex">
                                        <img src="img/product/review-2.png" alt="">
                                    </div>
                                    <div class="media-body">
                                        <h4>Blake Ruiz</h4>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                </div>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                                    incididunt ut labore et
                                    dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
                                    laboris nisi ut aliquip ex ea
                                    commodo</p>
                            </div>
                            <div class="review_item">
                                <div class="media">
                                    <div class="d-flex">
                                        <img src="img/product/review-3.png" alt="">
                                    </div>
                                    <div class="media-body">
                                        <h4>Blake Ruiz</h4>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                </div>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                                    incididunt ut labore et
                                    dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
                                    laboris nisi ut aliquip ex ea
                                    commodo</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="review_box">
                            <h4>Add a Review</h4>
                            <p>Your Rating:</p>
                            <ul class="list">
                                <li><a href="#"><i class="fa fa-star"></i></a></li>
                                <li><a href="#"><i class="fa fa-star"></i></a></li>
                                <li><a href="#"><i class="fa fa-star"></i></a></li>
                                <li><a href="#"><i class="fa fa-star"></i></a></li>
                                <li><a href="#"><i class="fa fa-star"></i></a></li>
                            </ul>
                            <p>Outstanding</p>
                            <form action="#/" class="form-contact form-review mt-3">
                                <div class="form-group">
                                    <input class="form-control" name="name" type="text" placeholder="Enter your name"
                                           required>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" name="email" type="email"
                                           placeholder="Enter email address" required>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" name="subject" type="text" placeholder="Enter Subject">
                                </div>
                                <div class="form-group">
                                    <textarea class="form-control different-control w-100" name="textarea" id="textarea"
                                              cols="30" rows="5" placeholder="Enter Message"></textarea>
                                </div>
                                <div class="form-group text-center text-md-right mt-3">
                                    <button type="submit" class="button button--active button-review">Submit Now
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--================End Product Description Area =================-->

<!--================ Start related Product area =================-->
<section class="related-product-area section-margin--small mt-0">
    <div class="container">
        <div class="section-intro pb-60px">
            <p>Popular Item in the market</p>
            <h2>Top <span class="section-intro__style">Product</span></h2>
        </div>
        <div class="row mt-30">
            <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
                <div class="single-search-product-wrapper">
                    <div class="single-search-product d-flex">
                        <a href="#"><img src="img/product/product-sm-1.png" alt=""></a>
                        <div class="desc">
                            <a href="#" class="title">Gray Coffee Cup</a>
                            <div class="price">$170.00</div>
                        </div>
                    </div>
                    <div class="single-search-product d-flex">
                        <a href="#"><img src="img/product/product-sm-2.png" alt=""></a>
                        <div class="desc">
                            <a href="#" class="title">Gray Coffee Cup</a>
                            <div class="price">$170.00</div>
                        </div>
                    </div>
                    <div class="single-search-product d-flex">
                        <a href="#"><img src="img/product/product-sm-3.png" alt=""></a>
                        <div class="desc">
                            <a href="#" class="title">Gray Coffee Cup</a>
                            <div class="price">$170.00</div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
                <div class="single-search-product-wrapper">
                    <div class="single-search-product d-flex">
                        <a href="#"><img src="img/product/product-sm-4.png" alt=""></a>
                        <div class="desc">
                            <a href="#" class="title">Gray Coffee Cup</a>
                            <div class="price">$170.00</div>
                        </div>
                    </div>
                    <div class="single-search-product d-flex">
                        <a href="#"><img src="img/product/product-sm-5.png" alt=""></a>
                        <div class="desc">
                            <a href="#" class="title">Gray Coffee Cup</a>
                            <div class="price">$170.00</div>
                        </div>
                    </div>
                    <div class="single-search-product d-flex">
                        <a href="#"><img src="img/product/product-sm-6.png" alt=""></a>
                        <div class="desc">
                            <a href="#" class="title">Gray Coffee Cup</a>
                            <div class="price">$170.00</div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
                <div class="single-search-product-wrapper">
                    <div class="single-search-product d-flex">
                        <a href="#"><img src="img/product/product-sm-7.png" alt=""></a>
                        <div class="desc">
                            <a href="#" class="title">Gray Coffee Cup</a>
                            <div class="price">$170.00</div>
                        </div>
                    </div>
                    <div class="single-search-product d-flex">
                        <a href="#"><img src="img/product/product-sm-8.png" alt=""></a>
                        <div class="desc">
                            <a href="#" class="title">Gray Coffee Cup</a>
                            <div class="price">$170.00</div>
                        </div>
                    </div>
                    <div class="single-search-product d-flex">
                        <a href="#"><img src="img/product/product-sm-9.png" alt=""></a>
                        <div class="desc">
                            <a href="#" class="title">Gray Coffee Cup</a>
                            <div class="price">$170.00</div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
                <div class="single-search-product-wrapper">
                    <div class="single-search-product d-flex">
                        <a href="#"><img src="img/product/product-sm-1.png" alt=""></a>
                        <div class="desc">
                            <a href="#" class="title">Gray Coffee Cup</a>
                            <div class="price">$170.00</div>
                        </div>
                    </div>
                    <div class="single-search-product d-flex">
                        <a href="#"><img src="img/product/product-sm-2.png" alt=""></a>
                        <div class="desc">
                            <a href="#" class="title">Gray Coffee Cup</a>
                            <div class="price">$170.00</div>
                        </div>
                    </div>
                    <div class="single-search-product d-flex">
                        <a href="#"><img src="img/product/product-sm-3.png" alt=""></a>
                        <div class="desc">
                            <a href="#" class="title">Gray Coffee Cup</a>
                            <div class="price">$170.00</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--================ end related Product area =================-->
<script>
    const quantity = document.getElementById('qty');
    const increase = document.querySelector('.increase');
    const reduced = document.querySelector('.reduced');

    quantity.addEventListener('input', () => {
        if (isNaN(quantity.value)) {
            quantity.value = 1;
        } else if (quantity.value === '') {
            quantity.value = 1;
        }
    });
    increase.addEventListener('click', () => {
        quantity.value = parseInt(quantity.value) + 1;
    });
    reduced.addEventListener('click', () => {
        if (quantity.value > 1) {
            quantity.value = parseInt(quantity.value) - 1;
        }
    });
</script>
<!--================ Start footer Area =================-->
