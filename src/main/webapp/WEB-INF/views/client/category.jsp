<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<section class="blog-banner-area" id="category">
    <div class="container h-100">
        <div class="blog-banner">
            <div class="text-center">
                <h1>Shop Category</h1>
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


<!-- ================ category section start ================= -->
<section class="section-margin--small mb-5">
    <div class="container">
        <div class="row">
            <div class="col-xl-3 col-lg-4 col-md-5">
                <form action="" onchange="filterData()">
                    <div class="sidebar-categories">
                        <div class="head">Price</div>
                        <ul class="main-categories">
                            <li class="common-filter">
                                <ul>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <span class="mx-2">0</span>
                                        <input type="range" id="priceRange" class="mx-2">
                                        <span class="mx-2">${maxPrice}</span>
                                    </div>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="sidebar-categories">
                        <div class="head">Category</div>
                        <ul class="main-categories">
                            <li class="common-filter">
                                <ul>
                                    <c:forEach items="${categories}" var="category">
                                        <li class="filter-list">
                                            <input class="pixel-radio" type="checkbox" name="category"
                                                   value="${category.categoryId}"
                                                   id="category-${category.categoryId}">
                                            <label for="category-${category.categoryId}">
                                                    ${category.name}
                                            </label>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="sidebar-categories">
                        <div class="head">Browse Categories</div>
                        <ul class="main-categories">
                            <li class="common-filter">
                                <ul>
                                    <c:forEach items="${brands}" var="brand">
                                        <li class="filter-list">
                                            <input class="pixel-radio" type="checkbox" name="brand"
                                                   value="${brand.brandId}"
                                                   id="brand-$${brand.brandId}">
                                            <label for="brand-$${brand.brandId}">${brand.name}</label>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </form>
            </div>
            <div class="col-xl-9 col-lg-8 col-md-7">
                <!-- Start Filter Bar -->
                <div class="filter-bar d-flex flex-wrap align-items-center">
                    <div class="sorting">
                        <select>
                            <option value="1">Default sorting</option>
                            <option value="1">Default sorting</option>
                            <option value="1">Default sorting</option>
                        </select>
                    </div>
                    <div class="sorting mr-auto">
                        <select>
                            <option value="1">Show 12</option>
                            <option value="1">Show 12</option>
                            <option value="1">Show 12</option>
                        </select>
                    </div>
                    <div>
                        <form action="/category" method="post" class="mb-3">
                            <div class="input-group filter-bar-search">
                                <input onchange="searchProduct()" type="text" placeholder="Search" id="keywords"
                                       name="keywords">
                                <div class="input-group-append">
                                    <button type="button">
                                        <i class="ti-search"></i>
                                    </button>
                                </div>
                            </div>
                        </form>

                    </div>
                </div>
                <!-- End Filter Bar -->
                <!-- Start Best Seller -->
                <section class="lattest-product-area pb-40 category-list">
                    <div class="row" id="card-product">
                        <%--                       cart product --%>
                    </div>
                </section>
                <!-- End Best Seller -->
            </div>
        </div>
    </div>
</section>
<!-- ================ category section end ================= -->

<!-- ================ top product area start ================= -->
<%--<section class="related-product-area">--%>
<%--    <div class="container">--%>
<%--        <div class="section-intro pb-60px">--%>
<%--            <p>Popular Item in the market</p>--%>
<%--            <h2>Top <span class="section-intro__style">Product</span></h2>--%>
<%--        </div>--%>
<%--        <div class="row mt-30">--%>
<%--            <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">--%>
<%--                <div class="single-search-product-wrapper">--%>
<%--                    <div class="single-search-product d-flex">--%>
<%--                        <a href="#"><img src="img/product/product-sm-1.png" alt=""></a>--%>
<%--                        <div class="desc">--%>
<%--                            <a href="#" class="title">Gray Coffee Cup</a>--%>
<%--                            <div class="price">$170.00</div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="single-search-product d-flex">--%>
<%--                        <a href="#"><img src="img/product/product-sm-2.png" alt=""></a>--%>
<%--                        <div class="desc">--%>
<%--                            <a href="#" class="title">Gray Coffee Cup</a>--%>
<%--                            <div class="price">$170.00</div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="single-search-product d-flex">--%>
<%--                        <a href="#"><img src="img/product/product-sm-3.png" alt=""></a>--%>
<%--                        <div class="desc">--%>
<%--                            <a href="#" class="title">Gray Coffee Cup</a>--%>
<%--                            <div class="price">$170.00</div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">--%>
<%--                <div class="single-search-product-wrapper">--%>
<%--                    <div class="single-search-product d-flex">--%>
<%--                        <a href="#"><img src="img/product/product-sm-4.png" alt=""></a>--%>
<%--                        <div class="desc">--%>
<%--                            <a href="#" class="title">Gray Coffee Cup</a>--%>
<%--                            <div class="price">$170.00</div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="single-search-product d-flex">--%>
<%--                        <a href="#"><img src="img/product/product-sm-5.png" alt=""></a>--%>
<%--                        <div class="desc">--%>
<%--                            <a href="#" class="title">Gray Coffee Cup</a>--%>
<%--                            <div class="price">$170.00</div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="single-search-product d-flex">--%>
<%--                        <a href="#"><img src="img/product/product-sm-6.png" alt=""></a>--%>
<%--                        <div class="desc">--%>
<%--                            <a href="#" class="title">Gray Coffee Cup</a>--%>
<%--                            <div class="price">$170.00</div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">--%>
<%--                <div class="single-search-product-wrapper">--%>
<%--                    <div class="single-search-product d-flex">--%>
<%--                        <a href="#"><img src="img/product/product-sm-7.png" alt=""></a>--%>
<%--                        <div class="desc">--%>
<%--                            <a href="#" class="title">Gray Coffee Cup</a>--%>
<%--                            <div class="price">$170.00</div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="single-search-product d-flex">--%>
<%--                        <a href="#"><img src="img/product/product-sm-8.png" alt=""></a>--%>
<%--                        <div class="desc">--%>
<%--                            <a href="#" class="title">Gray Coffee Cup</a>--%>
<%--                            <div class="price">$170.00</div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="single-search-product d-flex">--%>
<%--                        <a href="#"><img src="img/product/product-sm-9.png" alt=""></a>--%>
<%--                        <div class="desc">--%>
<%--                            <a href="#" class="title">Gray Coffee Cup</a>--%>
<%--                            <div class="price">$170.00</div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">--%>
<%--                <div class="single-search-product-wrapper">--%>
<%--                    <div class="single-search-product d-flex">--%>
<%--                        <a href="#"><img src="img/product/product-sm-1.png" alt=""></a>--%>
<%--                        <div class="desc">--%>
<%--                            <a href="#" class="title">Gray Coffee Cup</a>--%>
<%--                            <div class="price">$170.00</div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="single-search-product d-flex">--%>
<%--                        <a href="#"><img src="img/product/product-sm-2.png" alt=""></a>--%>
<%--                        <div class="desc">--%>
<%--                            <a href="#" class="title">Gray Coffee Cup</a>--%>
<%--                            <div class="price">$170.00</div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="single-search-product d-flex">--%>
<%--                        <a href="#"><img src="img/product/product-sm-3.png" alt=""></a>--%>
<%--                        <div class="desc">--%>
<%--                            <a href="#" class="title">Gray Coffee Cup</a>--%>
<%--                            <div class="price">$170.00</div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</section>--%>
<!-- ================ top product area end ================= -->

<!-- ================ Subscribe section start ================= -->
<section class="subscribe-position">
    <div class="container">
        <div class="subscribe text-center">
            <h3 class="subscribe__title">Get Update From Anywhere</h3>
            <p>Bearing Void gathering light light his eavening unto dont afraid</p>
            <div id="mc_embed_signup">
                <form target="_blank"
                      action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
                      method="get" class="subscribe-form form-inline mt-5 pt-1">
                    <div class="form-group ml-sm-auto">
                        <input class="form-control mb-1" type="email" name="EMAIL" placeholder="Enter your email"
                               onfocus="this.placeholder = ''" onblur="this.placeholder = 'Your Email Address '">
                        <div class="info"></div>
                    </div>
                    <button class="button button-subscribe mr-auto mb-1" type="submit">Subscribe Now</button>
                    <div style="position: absolute; left: -5000px;">
                        <input name="b_36c4fd991d266f23781ded980_aefe40901a" tabindex="-1" value="" type="text">
                    </div>

                </form>
            </div>

        </div>
    </div>
</section>
<script>
    function searchProduct() {
        const keywords = document.getElementById("keywords").value.toLowerCase();
        const filteredProducts = productItemsList.filter(item =>
            item.product.name.toLowerCase().includes(keywords)
        );
        renderProductList(filteredProducts);
    }

    function filterData() {
        let priceRange = document.getElementById("priceRange");
        let brands = document.getElementsByName("brand");
        let categories = document.getElementsByName("category");

        // Khởi tạo đối tượng option
        let option = {
            price: Number(priceRange.value),
            brand: [],
            category: []
        };

        // Thu thập các thương hiệu đã được chọn
        brands.forEach((brand) => {
            if (brand.checked) {
                option.brand.push(brand.value);
            }
        });

        // Thu thập các danh mục đã được chọn
        categories.forEach((category) => {
            if (category.checked) {
                option.category.push(category.value);
            }
        });

        filterProducts(option);

    }

    // Dữ liệu mẫu
    const productItemsList = [];
    <c:forEach items="${productItems}" var="productItem">
    productItemsList.push({
        productItemId: '${productItem.productItemId}',
        product: {
            productId: '${productItem.product.productId}',
            name: '${productItem.product.name}',
            description: '${productItem.product.description}',
            image: '${productItem.product.image}',
            category: {
                categoryId: '${productItem.product.category.categoryId}',
                name: '${productItem.product.category.name}'
            },
            brand: {
                brandId: '${productItem.product.brand.brandId}',
                name: '${productItem.product.brand.name}'
            },
            supplier: {
                supplierId: '${productItem.product.supplier.supplierId}',
                supplierName: '${productItem.product.supplier.supplierName}',
                contactName: '${productItem.product.supplier.contactName}',
                contactPhone: '${productItem.product.supplier.contactPhone}',
                contactEmail: '${productItem.product.supplier.contactEmail}',
                address: '${productItem.product.supplier.address}',
                city: '${productItem.product.supplier.city}'
            }
        },
        price: Number('${productItem.price}'),
        quantity: Number('${productItem.quantity}'),
        color: '${productItem.color}',
        size: '${productItem.size}',
        discounts: []
    });
    </c:forEach>

    function filterProducts(option) {
        const filteredProducts = productItemsList.filter(item =>
            (option.price === 0 || item.price <= option.price) &&
            (option.brand.length === 0 || option.brand.includes(item.product.brand.brandId)) &&
            (option.category.length === 0 || option.category.includes(item.product.category.categoryId))
        );
        renderProductList(filteredProducts);
    }

    // Function to render the product list
    function renderProductList(products) {
        const productList = document.getElementById('card-product');
        let productHTML = '';
        products.forEach((productItem) => {
            productHTML +=
                '<div class="col-md-6 col-lg-4">' +
                '<div class="card text-center card-product">' +
                '<a href="/single-product?product_id=' + productItem.product.productId + '">' +
                '<div class="card-product__img">' +
                '<img style="height: 280px; width: 260px" src="../../../uploads/' + productItem.product.image + '" alt="">' +
                '<ul class="card-product__imgOverlay">' +
                '<li><button><i class="ti-search"></i></button></li>' +
                '<li><button><i class="ti-shopping-cart"></i></button></li>' +
                '<li><button><i class="ti-heart"></i></button></li>' +
                '</ul>' +
                '</div>' +
                '<div class="card-body">' +
                '<p>' + productItem.product.brand.name + '</p>' +
                '<h4 class="card-product__title">' + productItem.product.name + '</h4>' +
                '<p class="card-product__price">$' + productItem.price + '</p>' +
                '</div>' +
                '</a>' +
                '</div>' +
                '</div>';
        });
        productList.innerHTML = productHTML;
    }

    // Initial rendering of the product list with all products
    renderProductList(productItemsList);
</script>
<!-- ================ Subscribe section end ================= -->


<!--================ Start footer Area =================-->
