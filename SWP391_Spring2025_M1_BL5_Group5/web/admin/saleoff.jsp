<%-- 
    Document   : customer
    Created on : 16 thg 4, 2025, 15:34:18
    Author     : truon
--%>







<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Danh sách nhân viên | Quản trị Admin</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Main CSS-->
        <link rel="stylesheet" type="text/css" href="admin/css/main.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <!-- or -->
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">

        <!-- Font-icon css-->
        <link rel="stylesheet" type="text/css"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">

    </head>

    <body onload="time()" class="app sidebar-mini rtl">
        <!-- Navbar-->nload="time()" class="app sidebar-mini rtl"
        <!-- Navbar-->
        <header class="app-header">
            <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
                                            aria-label="Hide Sidebar"></a>
            <!-- Navbar Right Menu-->
            <ul class="app-nav">


                <!-- User Menu-->
                <li><a class="app-nav__item" href="home"><i class='bx bx-log-out bx-rotate-180'></i> </a>

                </li>
            </ul>
        </header>
        <!-- Sidebar menu-->
        <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
        <aside class="app-sidebar">
            <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="admin/images/user.png" width="50px"
                                                alt="User Image">
                <div>
                    <p class="app-sidebar__user-name"><b>${sessionScope.user.user_name}</b></p>
                    <p class="app-sidebar__user-designation">Chào mừng bạn trở lại</p>
                </div>
            </div>
            <hr>
            <ul class="app-menu">
                <li><a class="app-menu__item" href="dashboard"><i class='app-menu__icon bx bx-tachometer'></i><span class="app-menu__label">Bảng thống kê</span></a></li>
                <li><a class="app-menu__item" href="categorymanager"><i class='app-menu__icon bx bxs-category'></i><span class="app-menu__label">Quản lý danh mục</span></a></li>
                <li><a class="app-menu__item" href="productmanager"><i class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Quản lý sản phẩm</span></a></li>
                <li><a class="app-menu__item" href="ordermanager"><i class='app-menu__icon bx bx-task'></i><span class="app-menu__label">Quản lý đơn hàng</span></a></li>

                <!-- Conditionally Display Menu Items -->
                <c:if test="${sessionScope.user.isAdmin}">
                    <li><a class="app-menu__item" href="customermanager"><i class='app-menu__icon bx bx-user-voice'></i><span class="app-menu__label">Quản lý khách hàng</span></a></li>
                    <li><a class="app-menu__item" href="reportmanager"><i class='app-menu__icon bx bx-receipt'></i><span class="app-menu__label">Quản lý phản hồi</span></a></li>
                    <li><a class="app-menu__item" href="aboutmanager"><i class='app-menu__icon bx bx-receipt'></i><span class="app-menu__label">Quản lý trang giới thiệu</span></a></li>
                    <li><a class="app-menu__item" href="commentmanager"><i class='app-menu__icon bx bx-receipt'></i><span class="app-menu__label">Quản lý bình luận</span></a></li>
                    <li><a class="app-menu__item" href="saleoff"><i class='app-menu__icon bx bx-receipt'></i><span class="app-menu__label">Quản lý sale</span></a></li>
                            </c:if>
            </ul>
        </aside>                 
        <!-- Sidebar menu-->
        <div class="app-sidebar__overlay" data-toggle="sidebar"></div>

        <main class="app-content">
            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb side">
                    <li class="breadcrumb-item active"><a href="#"><b>Quản Lý Sale Off</b></a></li>
                </ul>
                <div id="clock"></div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <div class="tile-body">
                            <!-- Button to Add Sale Off -->
                            <div class="row mb-3">
                                <div class="col-md-12 text-right">
                                    <!-- Nút "Thêm Mới" để mở modal -->
                                    <!-- Nút "Thêm Mới" để mở Modal -->
                                    <button class="btn btn-success" data-toggle="modal" data-target="#addSaleModal">
                                        <i class="fa fa-plus"></i> Thêm Mới
                                    </button>

                                </div>
                            </div>

                            <!-- tìm kiếm -->
                            <form action="saleoff" method="get">
                                <div class="row">
                                    <div class="form-group col-md-4">
                                        <label class="control-label">Sale Code</label>
                                        <input class="form-control" type="text" name="saleCode" value="${param.saleCode}">
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label class="control-label">Discount Type</label>
                                        <select class="form-control" name="discountType">
                                            <option value="">Select Discount Type</option>
                                            <option value="Percentage" ${param.discountType == 'Percentage' ? 'selected' : ''}>Percentage</option>
                                            <option value="Fixed" ${param.discountType == 'Fixed' ? 'selected' : ''}>Fixed</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label class="control-label">Sort by Discount Value</label>
                                        <select class="form-control" name="sortDiscountValue">
                                            <option value="">Select Sorting Order</option>
                                            <option value="desc" ${param.sortDiscountValue == 'desc' ? 'selected' : ''}>High to Low</option>
                                            <option value="asc" ${param.sortDiscountValue == 'asc' ? 'selected' : ''}>Low to High</option>
                                        </select>
                                    </div>
                                </div>
                                <button class="btn btn-primary" type="submit">Search</button>
                            </form>
                            <!-- tìm kiếm -->
                            <nav aria-label="Page navigation" style="margin-top: 20px; text-align: center;">
                                <ul class="pagination" style="display: inline-flex; padding-left: 0; list-style: none; border-radius: 5px;">
                                    <c:forEach var="i" begin="1" end="${totalPages}">
                                        <li style="margin: 0 5px;" class="page-item ${i == pageIndex ? 'active' : ''}">
                                            <a class="page-link" href="saleoff?page=${i}&saleCode=${saleCode}&discountType=${discountType}&sortDiscountValue=${sortDiscountValue}" 
                                               style="padding: 8px 12px; border: 1px solid #dee2e6; border-radius: 5px; color: #007bff; text-decoration: none; background-color: ${i == pageIndex ? '#007bff' : '#fff'}; color: ${i == pageIndex ? '#fff' : '#007bff'};">
                                                ${i}
                                            </a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </nav>

                            <!-- Sale Off Table -->

                            <table border="1">
                                <tr>
                                    <th>Số thứ tự </th>
                                    <th>Sale ID</th>
                                    <th>Sale Code</th>
                                    <th>Discount Type</th>
                                    <th>Discount Value</th>
                                    <th>Max Discount</th>
                                    <th>Start Date</th>
                                    <th>End Date</th>
                                    <th>Quantity</th>
                                    <th>Action</th>
                                </tr>
                                <c:forEach var="saleOff" items="${saleOffs}" varStatus="status">
                                    <tr>
                                        <td>${status.index + 1}</td>
                                        <td>${saleOff.saleId}</td>
                                        <td>${saleOff.saleCode}</td>
                                        <td>${saleOff.discountType}</td>
                                        <td>${saleOff.discountValue}</td>
                                        <td>${saleOff.maxDiscount}</td>
                                        <td>${saleOff.start_date}</td>
                                        <td>${saleOff.end_date}</td>
                                        <td>${saleOff.quantity}</td>
                                        <td>
                                            <!-- Nút sửa, chuyển đến servlet editSale với saleId -->
                                            <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" 
                                                    id="show-emp" data-toggle="modal" 
                                                    data-target="#ModalUP${saleOff.saleId}">
                                                <i class="fas fa-edit"></i>
                                            </button>
                                            <!-- Nút xoá, chuyển đến servlet deleteSale với saleId -->
                                            <!-- Nút xoá, chuyển đến servlet deleteSale với saleId -->
                                            <form action="saleoff" method="post" style="display:inline;">
                                                <input type="hidden" name="action" value="delete">
                                                <input type="hidden" name="saleId" value="${saleOff.saleId}">
                                                <button class="btn btn-danger btn-sm" type="submit" title="Delete">
                                                    <i class="fas fa-trash-alt"></i>
                                                </button>
                                            </form>
                                        </td>
                                    </tr>                                  
                                </c:forEach>
                            </table>
                            <c:forEach var="saleOff" items="${saleOffs}" varStatus="status">
                                <div class="modal fade" id="ModalUP${saleOff.saleId}" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
                                     data-keyboard="false">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <div class="modal-body">
                                                <form action="saleoff" method="post">
                                                    <input type="hidden" name="action" value="update">
                                                    <input type="hidden" name="saleId" value="${saleOff.saleId}">
                                                    <div class="row">
                                                        <div class="form-group  col-md-12">
                                                            <span class="thong-tin-thanh-toan">
                                                                <h5>Chỉnh sửa thông tin giảm giá</h5>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="form-group col-md-6">
                                                            <label class="control-label">Sale id</label>
                                                            <input class="form-control" type="text" readonly name="saleId" value="${saleOff.saleId}">
                                                        </div>
                                                        <div class="form-group col-md-6">   
                                                            <label class="control-label">Sale COde</label>
                                                            <input class="form-control" type="text"  name="saleCode" value="${saleOff.saleCode}">
                                                        </div>
                                                        <div class="form-group col-md-6">
                                                            <label class="control-label">Discount Type</label>
                                                            <select class="form-control" name="discountType">
                                                                <option value="Percentage" ${saleOff.discountType == 'Percentage' ? 'selected' : ''}>Percentage</option>
                                                                <option value="Fixed" ${saleOff.discountType == 'Fixed' ? 'selected' : ''}>Fixed</option>
                                                            </select>
                                                        </div>
                                                        <div class="form-group col-md-6">
                                                            <label class="control-label">Discount value</label>
                                                            <input class="form-control" type="number"  name="discountValue" value="${saleOff.discountValue}">
                                                        </div>
                                                        <div class="form-group col-md-6">
                                                            <label class="control-label">Max Discount</label>
                                                            <input class="form-control" type="number"  name="maxDiscount" value="${saleOff.maxDiscount}">
                                                        </div>
                                                        <div class="form-group col-md-6">
                                                            <label class="control-label">Start Date</label>
                                                            <input class="form-control" type="Date"  name="startDate" value="${saleOff.start_date}">
                                                        </div>
                                                        <div class="form-group col-md-6">
                                                            <label class="control-label">End Date</label>
                                                            <input class="form-control" type="Date"  name="endDate" value="${saleOff.end_date}">
                                                        </div>
                                                        <div class="form-group col-md-6">
                                                            <label class="control-label">Số lượng</label>
                                                            <input class="form-control" type="text" min="1" name="quantity" value="${saleOff.quantity}">
                                                        </div>
                                                    </div>
                                                    <BR>
                                                    <button class="btn btn-save" type="submit">Lưu lại</button>
                                                    <a class="btn btn-cancel" data-dismiss="modal" href="saleoff">Hủy bỏ</a>
                                                    <BR>
                                                </form> 
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <c:forEach var="saleOff" items="${saleOffs}" varStatus="status">
                                <!--
                               MODAL add
                                -->
                                <div class="modal fade" id="addSaleModal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
                                     data-keyboard="false" aria-labelledby="addSaleModalLabel">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <div class="modal-body">
                                                <form action="saleoff" method="post"></form>
                                                <input type="hidden" name="action" value="add">

                                                <div class="row">
                                                    <div class="form-group  col-md-12">
                                                        <span class="thong-tin-thanh-toan">
                                                            <h5>Thêm giảm giá</h5>
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="form-group col-md-6">
                                                        <label class="control-label">Sale id</label>
                                                        <input class="form-control" type="text" readonly name="saleId" >
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label class="control-label">Sale Code</label>
                                                        <input class="form-control" type="text"  name="saleCode" >
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label class="control-label">Discount Type id</label>
                                                        <input class="form-control" type="text"  name="discountType" >
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label class="control-label">Discount value</label>
                                                        <input class="form-control" type="text"  name="discountValue" >
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label class="control-label">Max Discount</label>
                                                        <input class="form-control" type="text"  name="maxDiscount" >
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label class="control-label">Start Date</label>
                                                        <input class="form-control" type="Date"  name="startDate" >
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label class="control-label">End Date</label>
                                                        <input class="form-control" type="Date"  name="endDate">
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label class="control-label">Số lượng</label>
                                                        <input class="form-control" type="text" min="1" name="quantity" >
                                                    </div>
                                                </div>
                                            </div>

                                            <BR>
                                            <button class="btn btn-save" type="submit">Lưu lại</button>
                                            <a class="btn btn-cancel" data-dismiss="modal" href="saleoff">Hủy bỏ</a>
                                            <BR>
                                            </form>        

                                        </div>
                                    </div>
                                </div>

                                <!--
                              MODAL
                                -->
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>

        </main>
        <!-- Modal sửa -->

        <!-- Essential javascripts for application to work-->
        <script src="admin/js/jquery-3.2.1.min.js"></script>
        <script src="admin/js/popper.min.js"></script>
        <script src="admin/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="admin/js/main.js"></script>
        <!-- The javascript plugin to display page loading on top-->
        <script src="admin/js/plugins/pace.min.js"></script>
        <!-- Page specific javascripts-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
        <!-- Data table plugin-->
        <script type="text/javascript" src="admin/js/plugins/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="admin/js/plugins/dataTables.bootstrap.min.js"></script>
        <script type="text/javascript">
        $('#sampleTable').DataTable();
        //Thời Gian
        function time() {
            var today = new Date();
            var weekday = new Array(7);
            weekday[0] = "Chủ Nhật";
            weekday[1] = "Thứ Hai";
            weekday[2] = "Thứ Ba";
            weekday[3] = "Thứ Tư";
            weekday[4] = "Thứ Năm";
            weekday[5] = "Thứ Sáu";
            weekday[6] = "Thứ Bảy";
            var day = weekday[today.getDay()];
            var dd = today.getDate();
            var mm = today.getMonth() + 1;
            var yyyy = today.getFullYear();
            var h = today.getHours();
            var m = today.getMinutes();
            var s = today.getSeconds();
            m = checkTime(m);
            s = checkTime(s);
            nowTime = h + " giờ " + m + " phút " + s + " giây";
            if (dd < 10) {
                dd = '0' + dd
            }
            if (mm < 10) {
                mm = '0' + mm
            }
            today = day + ', ' + dd + '/' + mm + '/' + yyyy;
            tmp = '<span class="date"> ' + today + ' - ' + nowTime +
                    '</span>';
            document.getElementById("clock").innerHTML = tmp;
            clocktime = setTimeout("time()", "1000", "Javascript");

            function checkTime(i) {
                if (i < 10) {
                    i = "0" + i;
                }
                return i;
            }
        }
        </script>
        <script>

            $(document).ready(jQuery(function () {
                jQuery(document).on('click', '.trash', function () {
                    swal({
                        title: "Cảnh báo",
                        text: "Bạn có chắc chắn là muốn xóa sản phẩm này?",
                        buttons: ["Hủy bỏ", "Đồng ý"],
                    })
                            .then((willDelete) => {
                                if (willDelete) {
                                    window.location = "productmanager?action=deleteproduct&product_id=" + $(this).attr("value");
                                    swal("Đã xóa thành công.!", {
                                        icon: "success",
                                    });
                                }
                            });
                });
            }));
        </script>
        <script>
            var myApp = new function () {
                this.printTable = function () {
                    var tab = document.getElementById('sampleTable');
                    var win = window.open('', '', 'height=700,width=700');
                    win.document.write(tab.outerHTML);
                    win.document.close();
                    win.print();
                }
            }
        </script>
    </body>
</html>



