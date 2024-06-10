<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    .text-secondary.mx-1.p-1:hover {
        color: #0b20ea !important;
    }
</style>
<header class="header_area">
    <div class="main_menu">
        <nav class="navbar navbar-expand-lg navbar-light">
            <div class="container">
                <a class="navbar-brand logo_h" href="/home">
                    <img src="/assets/images/logo.png" alt="" width="120px" style="margin-top: -10px">
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
                    <ul class="nav navbar-nav menu_nav ml-auto mr-auto">
                        <li class="nav-item active"><a class="nav-link" href="/home">Home</a></li>
                        <li class="nav-item submenu dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button"
                               aria-haspopup="true"
                               aria-expanded="false">Shop</a>
                            <ul class="dropdown-menu">
                                <li class="nav-item"><a class="nav-link" href="/category">Shop Category</a></li>
                                <li class="nav-item"><a class="nav-link" href="/single-product">Product Details</a></li>
                                <li class="nav-item"><a class="nav-link" href="/checkout">Product Checkout</a></li>
                                <li class="nav-item"><a class="nav-link" href="/confirmation">Confirmation</a></li>
                                <li class="nav-item"><a class="nav-link" href="/cart">Shopping Cart</a></li>
                            </ul>
                        </li>
                        <li class="nav-item submenu dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button"
                               aria-haspopup="true"
                               aria-expanded="false">Blog</a>
                            <ul class="dropdown-menu">
                                <li class="nav-item"><a class="nav-link" href="/blog">Blog</a></li>
                                <li class="nav-item"><a class="nav-link" href="/single-blog">Blog Details</a></li>
                            </ul>
                        </li>
                        <li class="nav-item submenu dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button"
                               aria-haspopup="true"
                               aria-expanded="false">Pages</a>
                            <ul class="dropdown-menu">
                                <li class="nav-item"><a class="nav-link" href="login">Login</a></li>
                                <li class="nav-item"><a class="nav-link" href="register">Register</a></li>
                                <li class="nav-item"><a class="nav-link" href="tracking-order">Tracking</a></li>
                            </ul>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="contact">Contact</a></li>
                        <li class="nav-item submenu dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button"
                               aria-haspopup="true"
                               aria-expanded="false">
                                <%--                                <spring:message code="language"/>--%>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="nav-item"><a class="nav-link" href="?lang=vi">Vietnamese</a></li>
                                <li class="nav-item"><a class="nav-link" href="?lang=en">English</a></li>
                            </ul>
                        </li>
                    </ul>

                    <ul class="nav-shop">
                        <li class="nav-item">
                            <!-- Button trigger modal -->
                            <button type="button" class="" data-toggle="modal" data-target="#searchModal">
                                <i class="ti-search"></i>
                            </button>
                            <!-- Modal -->
                            <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="searchModalLabel"
                                 aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-body pt-0">
                                            <form action="#" method="post">
                                                <label for="search"></label>
                                                <input type="text" id="search"
                                                       class="w-100 border-secondary p-2 rounded"
                                                       placeholder="Search anything here ..."
                                                       style="border: 1px solid;">
                                            </form>
                                        </div>
                                        <div class="modal-footer p-1">
                                            <button type="button" class="text-secondary mx-1 p-1">Search</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="nav-item">
                            <button onclick="window.location.href='cart'"><i class="ti-shopping-cart"></i><span
                                    class="nav-shop__circle">
                                <c:choose>
                                    <c:when test="${not empty sessionScope.itemNumber}">
                                        ${sessionScope.itemNumber == 0 ? '' : sessionScope.itemNumber}
                                    </c:when>
                                </c:choose>
                            </span></button>
                        </li>
                        <li class="nav-item">
                            <span class="button button-header" id="account">
                                <c:choose>
                                    <c:when test="${not empty sessionScope.customer}">
                                        <p style="text-transform: uppercase; margin: 0;">${sessionScope.customer.name}</p>
                                    </c:when>
                                    <c:otherwise>
                                        <p></p>
                                    </c:otherwise>
                                </c:choose>
                            </span>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</header>
<!-- Button trigger modal -->
<script>
    window.addEventListener("DOMContentLoaded", () => {
        const account = document.getElementById("account");
        if (account.textContent.trim() === '') {
            account.style.display = 'none';
        } else {
            account.style.display = 'block';
        }
    })
</script>