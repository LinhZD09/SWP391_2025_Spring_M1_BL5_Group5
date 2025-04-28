<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Lịch sử đơn hàng</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

        <!-- CSS 
        ========================= -->
        <!-- Plugins CSS -->
        <link rel="stylesheet" href="assets/css/plugins.css">
        <!-- Main Style CSS -->
        <link rel="stylesheet" href="assets/css/style.css">
    </head>

    <body>

        <!-- Main Wrapper Start -->
        <!--Offcanvas menu area start-->
        <div class="off_canvars_overlay"></div>
        <jsp:include page="layout/menu.jsp"/>

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

        <div class="shopping_cart_area">
            <div class="container">  
                <div class="row">
                    <div class="col-12">
                        <div class="table_desc">
                            <div class="cart_page table-responsive">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>Ảnh</th>
                                            <th>Tên sản phẩm</th>
                                            <th>Size</th>
                                            <th>Màu</th>
                                            <th>Số lượng</th>
                                            <th>Đơn giá</th>
                                            <th>Phản hồi</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${detail}" var="d">
                                            <tr>
                                                <td><a href="product?action=productdetail&product_id=${d.product.product_id}"><img src="${d.product.img}" alt="" style="width: 60px;"></a></td>
                                                <td><a href="product?action=productdetail&product_id=${d.product.product_id}">${d.product.product_name}</a></td>
                                                <td>${d.size}</td>
                                                <td>${d.color}</td>
                                                <td>${d.quantity}</td>
                                                <td><fmt:formatNumber pattern="###,###" value="${d.price}"/></td>
                                                <td>
                                                    <c:if test="${not user.isAdmin eq 'True' and not user.isStoreStaff eq 'True'}">
                                                        <form method="post" action="report" style="display: flex; flex-direction: column; gap: 8px; width: 200px;">
                                                            <input type="text" name="subject_report" placeholder="Chủ đề phản hồi" required />
                                                            <textarea name="content_report" placeholder="Nhập nội dung phản hồi..." required style="resize: none; height: 80px; padding: 6px; border-radius: 4px; border: 1px solid #ccc;"></textarea>
                                                            <input type="hidden" name="user_id" value="${user.user_id}" />
                                                            <button type="submit" style="background-color: #28a745; color: white; border: none; padding: 6px 12px; border-radius: 4px; cursor: pointer;">Gửi phản hồi</button>
                                                        </form>

                                                    </c:if>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        <c:if test="${not empty requestScope.msgc}">
                                        <div style="margin-top: 10px; color: green; font-weight: bold;">
                                            ${requestScope.msgc}
                                        </div>
                                    </c:if>
                                    </tbody>

                                </table>
                                <!-- Bảng danh sách phản hồi -->
                                <div style="margin-top: 30px;">
                                    <h3>Danh sách phản hồi</h3>
                                    <div class="table_desc">
                                        <div class="cart_page table-responsive">
                                            <table>
                                                <thead>
                                                    <tr>
                                                        <th>Chủ đề phản hồi</th>
                                                        <th>Nội dung</th>
                                                        <th>Email người gửi</th>
                                                        <th>Phản hồi từ Admin</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${reports}" var="r">
                                                        <tr>
                                                            <td>${r.subject_report}</td>
                                                            <td>${r.content_report}</td>
                                                            <td>${r.user_email}</td>
                                                            <td>
                                                                <c:choose>
                                                                    <c:when test="${not empty r.admin_reply}">
                                                                        ${r.admin_reply}
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <i>Chưa phản hồi</i>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>
                </div>
            </div>     
        </div>
        <!-- shopping cart area end -->

        <!--footer area start-->
        <jsp:include page="layout/footer.jsp"/>
        <!--footer area end-->

        <!-- JS
        ============================================ -->


        <!--map js code here-->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAdWLY_Y6FL7QGW5vcO3zajUEsrKfQPNzI"></script>
        <script  src="https://www.google.com/jsapi"></script>
        <script src="assets/js/map.js"></script>


        <!-- Plugins JS -->
        <script src="assets/js/plugins.js"></script>

        <!-- Main JS -->
        <script src="assets/js/main.js"></script>



    </body>

</html>