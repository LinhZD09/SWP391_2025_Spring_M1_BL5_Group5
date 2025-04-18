<%-- 
    Document   : dashboard
    Created on : Apr 17, 2025, 8:19:15 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Quản Lí</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    </head>
    <body>
        <!-- nav bar -->
        <div class="container-fluid">
            <div class="row" style="height: 100vh">
                <!-- first row -->
                <div class="col-2 col-sm-3 col-x1-2 bg-dark">
                    <div class="container">
                        <div class="sticky-top">
                            <nav class="navbar bg-dark border-bottom border-white mb-3" data-bs-theme="dark">
                                <div class="container-fluid">
                                    <a class="navbar-brand" href="#">Quản Lí</a>
                                </div>
                            </nav>
                            <nav class="nav flex-column">
                                <a class="nav-link text-white" style="white-space:nowrap" href="#">
                                    <i class="bi bi-speedometer2"></i> 
                                    <span class="d-none d-sm-inline ms-2">Thống kê</span>

                                </a>
                                <a class="nav-link text-white" style="white-space:nowrap" href="#">
                                    <i class="bi bi-grid"></i>
                                    <span class="d-none d-sm-inline ms-2">Quản Lí Sản phẩm</span>
                                </a>
                                <a class="nav-link text-white" style="white-space:nowrap" href="admin/customer.jsp">
                                    <i class="bi bi-person-circle"></i>
                                    <span class="d-none d-sm-inline ms-2">Quản lí khách hàng</span>
                                </a>
                                <a class="nav-link text-white" style="white-space:nowrap" href="#">
                                    <i class="bi bi-person-circle"></i>
                                    <span class="d-none d-sm-inline ms-2">Quản lí người dùng</span>
                                </a>
                                <a class="nav-link text-white" href="#">Link</a>
                                <a class="nav-link text-white" href="#">Link</a>
                            </nav>

                        </div>
                    </div>
                </div>
                <!-- second row -->
                <div class="col-10 col-sm-9 col-x1-10 p-0 m-0">
                    <nav class="navbar navbar-expand-lg bg-body-tertiary mb-3">
                        <div class="container-fluid">
                            <ul class="navbar-nav ms-auto">
                                <li class="nav-item">
                                    <a class="nav-link" href="#"><i class="bi bi-arrow-bar-right me-2"></i>Logout</a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                    <div class="px-3">
                        <p>hello</p>

                    </div>
                </div>
            </div>          
        </div>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js" integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq" crossorigin="anonymous"></script>
    </body>
</html>
