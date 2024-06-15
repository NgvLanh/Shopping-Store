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
                                <%--                                <li class="nav-item"><a class="nav-link" href="/single-product">Product Details</a></li>--%>
                                <%--                                <li class="nav-item"><a class="nav-link" href="/checkout">Product Checkout</a></li>--%>
                                <li class="nav-item"><a class="nav-link" href="/your-order">Your order</a></li>
                                <%--                                <li class="nav-item"><a class="nav-link" href="/cart">Shopping Cart</a></li>--%>
                            </ul>
                        </li>
                        <%--                        <li class="nav-item submenu dropdown">--%>
                        <%--                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button"--%>
                        <%--                               aria-haspopup="true"--%>
                        <%--                               aria-expanded="false">Blog</a>--%>
                        <%--                            <ul class="dropdown-menu">--%>
                        <%--                                <li class="nav-item"><a class="nav-link" href="/blog">Blog</a></li>--%>
                        <%--                                <li class="nav-item"><a class="nav-link" href="/single-blog">Blog Details</a></li>--%>
                        <%--                            </ul>--%>
                        <%--                        </li>--%>
                        <li class="nav-item submenu dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button"
                               aria-haspopup="true"
                               aria-expanded="false">Pages</a>
                            <ul class="dropdown-menu">
                                <li class="nav-item"><a class="nav-link" href="/login">Login</a></li>
                                <li class="nav-item"><a class="nav-link" href="/register">Register</a></li>
                            </ul>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="/tracking-order">Tracking</a></li>
                    </ul>

                    <ul class="nav-shop d-flex" style="justify-content: center; align-items: center">
                        <li class="nav-item">
                            <!-- Button trigger modal -->
                            <i class="ti-search"></i>
                        </li>
                        <li class="nav-item">
                            <button onclick="window.location.href='/cart'"><i class="ti-shopping-cart"></i><span
                                    class="nav-shop__circle">
                                <c:choose>
                                    <c:when test="${not empty sessionScope.itemNumber}">
                                        ${sessionScope.itemNumber == 0 ? '' : sessionScope.itemNumber}
                                    </c:when>
                                </c:choose>
                            </span></button>
                        </li>
                        <li class="nav-item submenu dropdown"
                            id="account-show">
                            <button style="gap: 4px;"
                                    class="nav-link dropdown-toggle d-flex align-items-center justify-content-center"
                                    data-toggle="dropdown" role="button"
                                    aria-haspopup="true"
                                    aria-expanded="false" id="account">
                                <c:choose>
                                    <c:when test="${not empty sessionScope.customer}">
                                        <p style="text-transform: uppercase; margin: 0;">${sessionScope.customer.name}</p>
                                    </c:when>
                                    <c:otherwise>
                                        <p></p>
                                    </c:otherwise>
                                </c:choose>
                            </button>
                            <ul class="dropdown-menu m-0 p-0">
                                <li class="nav-item m-0 d-flex justify-content-center">
                                    <a class="nav-link px-0 text-dark"
                                       href="/logout">Logout</a></li>
                            </ul>
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
        const accountShow = document.getElementById("account-show");
        if (account.textContent.trim() === '') {
            accountShow.style.display = 'none';
        } else {
            accountShow.style.display = 'block';
        }
    })
</script>