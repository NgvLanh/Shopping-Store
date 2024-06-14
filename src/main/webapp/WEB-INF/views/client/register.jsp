<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- ================ start banner area ================= -->
<style>
    input[type="file"]::file-selector-button {

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

    .hidden {
        display: none;
    }

    .success-message {
        background-color: #d4edda;
        border-color: #c3e6cb;
        color: #155724;
        padding: 1rem;
        margin-bottom: 1rem;
        border: 1px solid transparent;
        border-radius: .25rem;
    }
</style>
<section class="blog-banner-area" id="category">
    <div class="container h-100">
        <div class="blog-banner">
            <div class="text-center">
                <h1>Register</h1>
                <nav aria-label="breadcrumb" class="banner-breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/home">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Register</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</section>
<section class="login_box_area section-margin">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="login_box_img">
                    <div class="hover">
                        <h4>Already have an account?</h4>
                        <p>There are advances being made in science and technology everyday, and a good example of this
                            is the</p>
                        <a class="button button-account" href="/login">Login Now</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="login_form_inner register_form_inner">
                    <h3>Register</h3>
                    <%--@elvariable id="customer" type="com.poly.entities.Customer"--%>
                    <form:form class="row login_form" method="post" id="signupForm"
                               modelAttribute="customer" enctype="multipart/form-data">
                        <form:hidden path="customerId"/>
                        <div class="col-md-12 form-group">
                            <form:input path="name" type="text" class="form-control" id="name" name="name"
                                        placeholder="Username"
                                        onfocus="this.placeholder = ''" onblur="this.placeholder = 'Username'"/>
                            <form:errors path="name"
                                         cssClass="text-danger"
                                         cssStyle="font-size: 14px; display: flex; justify-content: start"/>
                        </div>
                        <div class="col-md-12 form-group">
                            <form:input path="email" type="text" class="form-control" id="email" name="email"
                                        placeholder="Email Address"
                                        onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email Address'"/>
                            <form:errors path="email"
                                         cssClass="text-danger"
                                         cssStyle="font-size: 14px; display: flex; justify-content: start"/>
                            <span class="text-danger"
                                  style="font-size: 14px; display: flex; justify-content: start">${emailExist}</span>
                        </div>

                        <div class="col-md-12 form-group">
                            <form:input path="password" type="password" class="form-control" id="password"
                                        name="password"
                                        placeholder="Password"
                                        onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password'"/>
                            <form:errors path="password"
                                         cssClass="text-danger"
                                         cssStyle="font-size: 14px;  display: flex; justify-content: start"/>

                        </div>

                        <div class="col-md-12 form-group">
                            <form:input path="phone" type="tel" class="form-control" id="phone" name="phone"
                                        placeholder="Phone Number"
                                        onfocus="this.placeholder = ''" onblur="this.placeholder = 'Phone Number'"/>
                            <form:errors path="phone"
                                         cssClass="text-danger"
                                         cssStyle="font-size: 14px; display: flex; justify-content: start"/>
                            <span class="text-danger"
                                  style="font-size: 14px; display: flex; justify-content: start">${phoneExist}</span>
                        </div>

                        <div class="col-md-12 form-group">
                            <form:input path="address" type="text" class="form-control" id="address" name="address"
                                        placeholder="Address"
                                        onfocus="this.placeholder = ''" onblur="this.placeholder = 'Address'"/>
                            <form:errors path="address"
                                         cssClass="text-danger"
                                         cssStyle="font-size: 14px; display: flex; justify-content: start"/>
                        </div>

                        <div class="col-md-12 form-group">
                            <form:input path="city" type="text" class="form-control" id="city" name="city"
                                        placeholder="City"
                                        onfocus="this.placeholder = ''" onblur="this.placeholder = 'City'"/>
                            <form:errors path="city"
                                         cssClass="text-danger"
                                         cssStyle="font-size: 14px; display: flex; justify-content: start"/>
                        </div>

                        <div class="form-group col-md-12">
                            <input name="photo" type="file" class="form-control" id="photo"
                                   placeholder="Image"/>
                            <div class="border d-block mt-2" style="height: 200px;">
                                <img src="../../../uploads/" alt="image" id="imagePreview" width="50%"
                                     height="100%"
                                     style="display: none; margin: auto">
                            </div>
                                <%--                            <span class="text-danger"--%>
                                <%--                                  style="font-size: 14px; display: flex; justify-content: start">${msgImage}</span>--%>

                        </div>
                        <div class="col-md-12 form-group">
                            <div class="creat_account">
                                <input type="checkbox" id="f-option2" name="selector">
                                <label for="f-option2">Keep me logged in</label>
                            </div>
                        </div>
                        <div class="col-md-12 form-group">
                            <button type="submit" value="submit" class="button button-register w-100"
                                    formaction="/register/create">Register
                            </button>
                        </div>
                        <%--                        <form:errors path="*" element="li" delimiter=";"/>--%>

                    </form:form>
                    <div id="successMessage" class="hidden success-message">
                        Đăng ký thành công!
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script>
    document.getElementById('photo').addEventListener('change', () => {
        const photo = document.getElementById('photo');
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
    })

    // Lấy form và thành phần thông báo
    const form = document.getElementById('signupForm');
    const successMessage = document.getElementById('successMessage');

    // Bắt sự kiện submit của form
    form.addEventListener('submit', function (event) {
        // Ngăn chặn hành động mặc định của form
        event.preventDefault();

        // Hiển thị thông báo thành công
        successMessage.classList.remove('hidden');

        // Có thể thực hiện các hành động khác sau khi đăng ký thành công ở đây
    });
</script>

