<%@ page import="java.text.NumberFormat" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <title>Thanh toán thành công</title>
    <style>
        .container {
            margin-top: 50px;
        }

        .card {
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .card h1, .card h2 {
            color: #28a745;
        }

        .card table {
            margin-top: 20px;
        }

        .btn-primary {
            margin-top: 20px;
            width: 100%;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="w-75 mx-auto">
        <div class="card">
            <h1 class="text-center">Thanh toán thành công</h1>
            <h2 class="text-center">Chi tiết đơn hàng</h2>
            <table class="table table-striped table-bordered">
                <tbody>
                <tr>
                    <td><strong>Mã đơn hàng:</strong></td>
                    <td><span>${orderId}</span></td>
                </tr>
                <tr>
                    <td><strong>Tổng tiền:</strong></td>
                    <td>
                        <span>
                            <fmt:formatNumber value="${totalPrice / 100}"/> VND
                        </span>
                    </td>
                </tr>
                <tr>
                    <td><strong>Thời gian thanh toán:</strong></td>
                    <td>
                        <span>
                            <fmt:formatDate value="${paymentTime}" type="both"/>
                        </span>
                    </td>
                </tr>
                <tr>
                    <td><strong>Mã giao dịch:</strong></td>
                    <td><span>${transactionId}</span></td>
                </tr>
                </tbody>
            </table>
            <a href="/home" class="btn btn-primary">Về trang chủ</a>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>
