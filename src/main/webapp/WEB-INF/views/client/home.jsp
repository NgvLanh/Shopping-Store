<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<main class="site-main">

    <!--================ Hero banner start =================-->
    <section class="hero-banner">
        <div class="container">
            <div class="row no-gutters align-items-center pt-60px">
                <div class="col-5 d-none d-sm-block">
                    <div class="hero-banner__img">
                        <img class="img-fluid" src="img/home/hero-banner.png" alt="">
                    </div>
                </div>
                <div class="col-sm-7 col-lg-6 offset-lg-1 pl-4 pl-md-5 pl-lg-0">
                    <div class="hero-banner__content">
                        <h4>FourFree shop is fun</h4>
                        <h1>Explore Excellence in Every Product</h1>
                        <p>Discover Joy in Shopping: Where Quality Meets Adventure!</p>
                        <a class="button button-hero" href="/category">Buy Now</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================ Hero banner start =================-->

    <!--================ Hero Carousel start =================-->
    <section class="section-margin mt-0">
        <div class="owl-carousel owl-theme hero-carousel">
            <c:forEach var="productItems" items="${productItemsList}">
                <a href="/single-product?product_id=${productItems.product.productId}"
                   class="hero-carousel__slide d-flex">
                    <img src="../../uploads/${productItems.product.image}" class="img-fluid"
                         style="height: 750px !important;">
                    <div href="#" class="hero-carousel__slideOverlay">
                        <h3>${productItems.product.name}</h3>
                        <p>$${productItems.price}</p>
                        <i class="text-white">${productItems.product.description}</i>
                    </div>
                </a>
            </c:forEach>
        </div>
    </section>
    <!--================ Hero Carousel end =================-->

    <!-- ================ trending product section start ================= -->
    <section class="section-margin calc-60px">
        <div class="container">
            <div class="section-intro pb-60px">
                <p>Popular Item in the market</p>
                <h2>Trending <span class="section-intro__style">Product</span></h2>
            </div>
            <div class="row">
                <jsp:useBean id="trendingProducts" scope="request" type="org.springframework.data.domain.Page"/>
                <c:forEach var="product" items="${trendingProducts.content}">
                    <a href="/single-product?product_id=${product.productId}">
                        <div class="col-md-6 col-lg-4 col-xl-3">
                            <div class="card text-center card-product">
                                <div class="card-product__img">
                                    <img style="height: 320px;width: 260px" class="card-img"
                                         src="../../uploads/${product.image}" alt="">
                                    <ul class="card-product__imgOverlay">
                                        <li>
                                            <button>
                                                <i class="ti-search"></i>
                                            </button>
                                        </li>
                                        <li>
                                            <button>
                                                <i class="ti-shopping-cart"></i>
                                            </button>
                                        </li>
                                        <li>
                                            <button>
                                                <i class="ti-heart"></i>
                                            </button>
                                        </li>
                                    </ul>
                                </div>
                                <div class="card-body">
                                    <p>${product.brand.name}</p>
                                    <h4 class="card-product__title">
                                        <a href="single-product">${product.name}</a>
                                    </h4>
                                    <p class="card-product__price">${product.category.name}</p>
                                </div>
                            </div>
                        </div>
                    </a>
                </c:forEach>
            </div>
            <div class="d-flex justify-content-center mt-4">
                <c:forEach var="i" begin="1" end="${trendingProducts.totalPages}" step="1">
                    <a href="?page=${i-1}"
                       class="text-white mx-1 d-flex align-items-center justify-content-center"
                       style="text-decoration: none; width: 32px; height: 28px; background: #384aeb; border-radius: 4px;">
                            ${i}
                    </a>
                </c:forEach>
            </div>
        </div>
    </section>
    <!-- ================ trending product section end ================= -->


    <!-- ================ offer section start ================= -->
    <section class="offer" id="parallax-1" data-anchor-target="#parallax-1"
             data-300-top="background-position: 20px 30px" data-top-bottom="background-position: 0 20px">
        <div class="container">
            <div class="row">
                <div class="col-xl-5">
                    <div class="offer__content text-center">
                        <h3>Up To 50% Off</h3>
                        <h4>Winter Sale</h4>
                        <p>Him she'd let them sixth saw light</p>
                        <a class="button button--active mt-3 mt-xl-4" href="#">Shop Now</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ================ offer section end ================= -->

    <!-- ================ Best Selling item  carousel ================= -->
    <section class="section-margin calc-60px">
        <div class="container">
            <div class="section-intro pb-60px">
                <p>Popular Item in the market</p>
                <h2>Best <span class="section-intro__style">Sellers</span></h2>
            </div>
            <div class="owl-carousel owl-theme" id="bestSellerCarousel">
                <c:forEach var="productItems" items="${productItemsList}">

                    <div class="card text-center card-product">
                        <div class="card-product__img">
                            <img style="height: 320px; width: 260px"
                                 src="../../uploads/${productItems.product.image}" alt="">
                            <ul class="card-product__imgOverlay">
                                <li>
                                    <button>
                                        <i class="ti-search"></i>
                                    </button>
                                </li>
                                <li>
                                    <button>
                                        <a href="/single-product?product_id=${productItems.product.productId}">
                                            <i class="ti-shopping-cart"></i>
                                        </a>
                                    </button>
                                </li>
                                <li>
                                    <button>
                                        <i class="ti-heart"></i>
                                    </button>
                                </li>
                            </ul>
                        </div>
                        <div class="card-body">
                            <p>${productItems.product.brand.name}</p>
                            <h4 class="card-product__title">
                                <a href="single-product">${productItems.product.name}</a>
                            </h4>
                            <p class="card-product__price">${productItems.product.category.name}</p>
                        </div>
                    </div>

                </c:forEach>
            </div>
        </div>
    </section>
    <!-- ================ Best Selling item  carousel end ================= -->

    <!-- ================ Blog section start ================= -->
    <%--    <section class="blog">--%>
    <%--        <div class="container">--%>
    <%--            <div class="section-intro pb-60px">--%>
    <%--                <p>Popular Item in the market</p>--%>
    <%--                <h2>Latest <span class="section-intro__style">News</span></h2>--%>
    <%--            </div>--%>

    <%--            <div class="row">--%>
    <%--                <div class="col-md-6 col-lg-4 mb-4 mb-lg-0">--%>
    <%--                    <div class="card card-blog">--%>
    <%--                        <div class="card-blog__img">--%>
    <%--                            <img class="card-img rounded-0" src="img/blog/blog1.png" alt="">--%>
    <%--                        </div>--%>
    <%--                        <div class="card-body">--%>
    <%--                            <ul class="card-blog__info">--%>
    <%--                                <li><a href="#">By Admin</a></li>--%>
    <%--                                <li><a href="#"><i class="ti-comments-smiley"></i> 2 Comments</a></li>--%>
    <%--                            </ul>--%>
    <%--                            <h4 class="card-blog__title"><a href="single-blog">The Richland Center Shooping News--%>
    <%--                                and weekly shooper</a></h4>--%>
    <%--                            <p>Let one fifth i bring fly to divided face for bearing divide unto seed. Winged divided--%>
    <%--                                light Forth.</p>--%>
    <%--                            <a class="card-blog__link" href="#">Read More <i class="ti-arrow-right"></i></a>--%>
    <%--                        </div>--%>
    <%--                    </div>--%>
    <%--                </div>--%>

    <%--                <div class="col-md-6 col-lg-4 mb-4 mb-lg-0">--%>
    <%--                    <div class="card card-blog">--%>
    <%--                        <div class="card-blog__img">--%>
    <%--                            <img class="card-img rounded-0" src="img/blog/blog2.png" alt="">--%>
    <%--                        </div>--%>
    <%--                        <div class="card-body">--%>
    <%--                            <ul class="card-blog__info">--%>
    <%--                                <li><a href="#">By Admin</a></li>--%>
    <%--                                <li><a href="#"><i class="ti-comments-smiley"></i> 2 Comments</a></li>--%>
    <%--                            </ul>--%>
    <%--                            <h4 class="card-blog__title"><a href="single-blog">The Shopping News also offers--%>
    <%--                                top-quality printing services</a></h4>--%>
    <%--                            <p>Let one fifth i bring fly to divided face for bearing divide unto seed. Winged divided--%>
    <%--                                light Forth.</p>--%>
    <%--                            <a class="card-blog__link" href="#">Read More <i class="ti-arrow-right"></i></a>--%>
    <%--                        </div>--%>
    <%--                    </div>--%>
    <%--                </div>--%>

    <%--                <div class="col-md-6 col-lg-4 mb-4 mb-lg-0">--%>
    <%--                    <div class="card card-blog">--%>
    <%--                        <div class="card-blog__img">--%>
    <%--                            <img class="card-img rounded-0" src="img/blog/blog3.png" alt="">--%>
    <%--                        </div>--%>
    <%--                        <div class="card-body">--%>
    <%--                            <ul class="card-blog__info">--%>
    <%--                                <li><a href="#">By Admin</a></li>--%>
    <%--                                <li><a href="#"><i class="ti-comments-smiley"></i> 2 Comments</a></li>--%>
    <%--                            </ul>--%>
    <%--                            <h4 class="card-blog__title"><a href="single-blog">Professional design staff and--%>
    <%--                                efficient equipment you’ll find we offer</a></h4>--%>
    <%--                            <p>Let one fifth i bring fly to divided face for bearing divide unto seed. Winged divided--%>
    <%--                                light Forth.</p>--%>
    <%--                            <a class="card-blog__link" href="#">Read More <i class="ti-arrow-right"></i></a>--%>
    <%--                        </div>--%>
    <%--                    </div>--%>
    <%--                </div>--%>
    <%--            </div>--%>
    <%--        </div>--%>
    <%--    </section>--%>
    <!-- ================ Blog section end ================= -->

    <!-- ================ Subscribe section start ================= -->
    <section class="subscribe-position">
        <div class="container">
            <div class="subscribe text-center">
                <h3 class="subscribe__title">Like , Subscribe & Share</h3>
                <p>Support US</p>
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
</main>