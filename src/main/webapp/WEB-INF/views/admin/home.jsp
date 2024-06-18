<%@ page import="java.util.List" %>
<%@ page import="com.poly.entities.Customer" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="main-panel">
    <div class="content-wrapper pb-0">
        <div class="page-header flex-wrap">
            <h3 class="mb-0"> Hi, welcome back!
            </h3>
        </div>
        <div class="row">
            <div class="col-xl-3 col-lg-12 stretch-card grid-margin">
                <div class="row">
                    <div class="col-xl-12 col-md-6 stretch-card grid-margin grid-margin-sm-0 pb-sm-3">
                        <div class="card bg-warning">
                            <div class="card-body px-3 py-4">
                                <div class="d-flex justify-content-between align-items-start">
                                    <div class="color-card">
                                        <p class="mb-0 color-card-head">Product</p>
                                        <h2 class="text-white">${totalOrderProDay}
                                        </h2>
                                    </div>
                                    <i class="card-icon-indicator mdi mdi-basket bg-inverse-icon-warning"></i>
                                </div>
                                <h6 class="text-white">Total products sold today.</h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-12 col-md-6 stretch-card grid-margin grid-margin-sm-0 pb-sm-3">
                        <div class="card bg-danger">
                            <div class="card-body px-3 py-4">
                                <div class="d-flex justify-content-between align-items-start">
                                    <div class="color-card">
                                        <p class="mb-0 color-card-head">Payment</p>
                                        <h2 class="text-white">${totalPaymentDay}
                                        </h2>
                                    </div>
                                    <i class="card-icon-indicator mdi mdi-cube-outline bg-inverse-icon-danger"></i>
                                </div>
                                <h6 class="text-white">Total payment today.</h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-12 col-md-6 stretch-card grid-margin grid-margin-sm-0 pb-sm-3">
                        <div class="card bg-success">
                            <div class="card-body px-3 py-4">
                                <div class="d-flex justify-content-between align-items-start">
                                    <div class="color-card">
                                        <p class="mb-0 color-card-head">Order</p>
                                        <h2 class="text-white">${totalOrderDay}</h2>
                                    </div>
                                    <i class="card-icon-indicator mdi mdi-account-circle bg-inverse-icon-success"></i>
                                </div>
                                <h6 class="text-white">Total order today.</h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-12 col-md-6 stretch-card grid-margin grid-margin-sm-0 pb-sm-3 pb-lg-0 pb-xl-3">
                        <div class="card bg-primary">
                            <div class="card-body px-3 py-4">
                                <div class="d-flex justify-content-between align-items-start">
                                    <div class="color-card">
                                        <p class="mb-0 color-card-head">Total amount</p>
                                        <h2 class="text-white"> $${totalDate}
                                        </h2>
                                    </div>
                                    <i class="card-icon-indicator mdi mdi-briefcase-outline bg-inverse-icon-primary"></i>
                                </div>
                                <h6 class="text-white">Total order amount today.</h6>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-9 stretch-card grid-margin">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-7">
                                <h5>Business Survey</h5>
                                <%--                                <p class="text-muted"> Show overview jan 2018 - Dec 2019 <a--%>
                                <%--                                        class="text-muted font-weight-medium pl-2" href="#"><u>See--%>
                                <%--                                    Details</u></a>--%>
                                </p>
                            </div>
                            <div class="col-sm-5 text-md-right">
                                <button type="button"
                                        class="btn btn-icon-text mb-3 mb-sm-0 btn-inverse-primary font-weight-normal">
                                </button>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-4">
                                <div class="card mb-3 mb-sm-0">
                                    <div class="card-body py-3 px-4">
                                        <p class="m-0 survey-head">Total products sold month</p>
                                        <div class="d-flex justify-content-between align-items-end flot-bar-wrapper">
                                            <div>
                                                <h3 class="m-0 survey-value">${totalPrMonth}</h3>
                                                <%--                                                <p class="text-success m-0">-310 avg. sales</p>--%>
                                            </div>
                                            <div id="earningChart" class="flot-chart"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="card mb-3 mb-sm-0">
                                    <div class="card-body py-3 px-4">
                                        <p class="m-0 survey-head">Total order by month</p>
                                        <div class="d-flex justify-content-between align-items-end flot-bar-wrapper">
                                            <div>
                                                <h3 class="m-0 survey-value">${totalOrderPrMonth}</h3>
                                                <%--                                                <p class="text-danger m-0">-310 avg. sales</p>--%>
                                            </div>
                                            <div id="productChart" class="flot-chart"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="card">
                                    <div class="card-body py-3 px-4">
                                        <p class="m-0 survey-head">Total order amount month</p>
                                        <div class="d-flex justify-content-between align-items-end flot-bar-wrapper">
                                            <div>
                                                <h3 class="m-0 survey-value">$${totalAmount}</h3>
                                                <%--                                                <p class="text-success m-0">-310 avg. sales</p>--%>
                                            </div>
                                            <div id="orderChart" class="flot-chart"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%--                        <div class="row my-3">--%>
                        <%--                            <div class="col-sm-12">--%>
                        <%--                                <div class="flot-chart-wrapper">--%>
                        <%--                                    <div id="flotChart" class="flot-chart">--%>
                        <%--                                        <canvas class="flot-base"></canvas>--%>
                        <%--                                    </div>--%>
                        <%--                                </div>--%>
                        <%--                            </div>--%>
                        <%--                        </div>--%>
                        <div class="row my-3">
                            <div class="col-sm-12">
                                <canvas id="myChart" style="width:100%;"></canvas>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-8">
                            </div>
                            <div class="col-sm-4">
                                <p class="mb-0 text-muted">Sales Revenue</p>
                                <h5 class="d-inline-block survey-value mb-0"> $${totalYear} </h5>
                                <p class="d-inline-block text-danger mb-0"> Year </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xl-4 col-md-6 grid-margin stretch-card">
                <div class="card card-invoice">
                    <div class="card-body">
                        <h4 class="card-title pb-3">Pending invoices</h4>
                        <c:forEach var="item" items="${findTop5OrdersWithCustomers}">
                            <a href="/admin/order-management" style="text-decoration: none;">
                                <div class="list-card">
                                    <div class="row align-items-center">
                                        <div class="col-7 col-sm-8">
                                            <div class="row align-items-center p-2">
                                                <div class="col-sm-4">
                                                    <img src="../../uploads/${item.image}" alt=""/>
                                                </div>
                                                <div class="col-sm-8 pr-0 pl-sm-0">
                                                    <span>${item.date}</span>
                                                    <h6 class="mb-1 mb-sm-0">${item.name}</h6>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-5 col-sm-4">
                                            <div class="d-flex pt-1 align-items-center">
                                                <div class="bg-info text-white rounded p-1">
                                                    $ ${item.total}
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="col-xl-4 col-md-6 grid-margin stretch-card">
                <!--datepicker-->
                <div class="card">
                    <div class="card-body">
                        <div id="inline-datepicker" class="datepicker table-responsive"></div>
                    </div>
                </div>
                <!--datepicker ends-->
            </div>
        </div>
    </div>
    <footer class="footer">
        <%--        <div class="d-sm-flex justify-content-center justify-content-sm-between">--%>
        <%--            <span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright © bootstrapdash.com 2020</span>--%>
        <%--            <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center"> Free <a--%>
        <%--                    href="https://www.bootstrapdash.com/" target="_blank">Bootstrap dashboard template</a> from Bootstrapdash.com</span>--%>
        <%--        </div>--%>
    </footer>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

<script>
    let xValues = [];
    let yValues = [];
    <c:forEach var="monthlySales" items="${monthlySalesSummary}">
    xValues.push("${monthlySales.saleYear}" + " - " + "${monthlySales.saleMonth}");
    yValues.push(${monthlySales.totalAmount});
    </c:forEach>
    let barColors = ["red", "green", "blue",
        "orange", "brown"];

    new Chart("myChart", {
        type: "bar",
        data: {
            labels: xValues,
            datasets: [{
                backgroundColor: barColors,
                data: yValues
            }]
        },
        options: {
            legend: {display: false},
            title: {
                display: true,
                text: "Chart by month"
            }
        }
    });
</script>
