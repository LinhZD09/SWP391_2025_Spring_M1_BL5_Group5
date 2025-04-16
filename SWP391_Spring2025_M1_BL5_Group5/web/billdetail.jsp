<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Lịch sử đơn hàng</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

        <!-- CSS -->
        <link rel="stylesheet" href="assets/css/plugins.css">
        <link rel="stylesheet" href="assets/css/style.css">
    </head>

    <body>
        <!--Off‑canvas overlay-->
        <div class="off_canvars_overlay"></div>

        <!-- Menu -->
        <jsp:include page="layout/menu.jsp"/>

        <!-- Breadcrumb -->
        <div class="breadcrumbs_area other_bread">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="breadcrumb_content">
                            <ul>
                                <li><a href="home">Trang chủ</a></li>
                                <li>/</li>
                                <li>Lịch sử đơn hàng</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Lịch sử đơn hàng -->
        <div class="shopping_cart_area">
            <div class="container">

                <!-- Nút Back -->
                <div class="row mb-3">
                    <div class="col-12">
                        <a href="${pageContext.request.contextPath}/user?action=myaccount#orders"
                           class="btn"
                           style="background:#007bff;color:#fff;">
                            &larr;&nbsp;Quay lại Đơn Hàng
                        </a>
                    </div>
                </div>

                <!-- Thiết lập phân trang -->
                <c:set var="itemsPerPage" value="3"/>
                <c:set var="currentPage" value="${param.page != null ? param.page : 1}"/>
                <c:set var="startIndex"  value="${(currentPage - 1) * itemsPerPage}"/>
                <c:set var="endIndex"    value="${startIndex + itemsPerPage}"/>
                <c:if test="${endIndex gt detail.size()}">
                    <c:set var="endIndex" value="${detail.size()}"/>
                </c:if>

                <form>
                    <div class="row">
                        <div class="col-12">
                            <div class="table_desc">
                                <div class="cart_page table-responsive">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th class="product_thumb">Ảnh</th>
                                                <th class="product-price">Tên sản phẩm</th>
                                                <th class="product_quantity">Size</th>
                                                <th class="product-price">Màu</th>
                                                <th class="product_quantity">Số lượng</th>
                                                <th class="product_total">Đơn giá</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${detail}" var="d"
                                                       begin="${startIndex}" end="${endIndex - 1}">
                                                <tr>
                                                    <td class="product_thumb">
                                                        <a href="product?action=productdetail&product_id=${d.product.product_id}">
                                                            <img src="${d.product.img}" alt="">
                                                        </a>
                                                    </td>
                                                    <td class="product_name">
                                                        <a href="product?action=productdetail&product_id=${d.product.product_id}">
                                                            ${d.product.product_name}
                                                        </a>
                                                    </td>
                                                    <td class="product-price">${d.size}</td>
                                                    <td class="product-price">${d.color}</td>
                                                    <td class="product_quantity">${d.quantity}</td>
                                                    <!-- Giá: 398.000 VND -->
                                                    <td class="product_total">
                                                        <c:set var="tmp">
                                                            <fmt:formatNumber value="${d.price}"
                                                                              type="number"
                                                                              groupingUsed="true"
                                                                              minFractionDigits="0"
                                                                              maxFractionDigits="0"/>
                                                        </c:set>
                                                        <c:set var="price" value="${fn:replace(tmp, ',', '.')}"/>
                                                        ${price}&nbsp;VND
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div><!-- cart_page -->
                            </div><!-- table_desc -->
                        </div>
                    </div>
                </form>

                <!-- Tính & hiển thị trang -->
                <c:set var="totalItems"  value="${detail.size()}"/>
                <c:set var="totalPages"
                       value="${(totalItems/itemsPerPage) + (totalItems%itemsPerPage==0?0:1)}"/>

                <div class="row mt-3">
                    <div class="col-12">
                        <nav aria-label="Page navigation">
                            <ul class="pagination justify-content-center">
                                <c:forEach var="i" begin="1" end="${totalPages}">
                                    <li class="page-item ${i == currentPage ? 'active' : ''}">
                                        <a class="page-link" href="?page=${i}">${i}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </nav>
                    </div>
                </div>

            </div><!-- container -->
        </div><!-- shopping_cart_area -->

        <!-- Footer -->
        <jsp:include page="layout/footer.jsp"/>

        <!-- JS -->
        <script src="assets/js/plugins.js"></script>
        <script src="assets/js/main.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAdWLY_Y6FL7QGW5vcO3zajUEsrKfQPNzI"></script>
        <script src="https://www.google.com/jsapi"></script>
        <script src="assets/js/map.js"></script>
    </body>
</html>
