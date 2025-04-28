package Controller.Admin;

import dal.SaleOffDAO;
import model.SaleOff;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.User;

@WebServlet(name = "SaleOffServlet", urlPatterns = {"/saleoff"})
public class SaleOffServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        try {
            HttpSession session = request.getSession();
            model.User user = (User) session.getAttribute("user");
            // Kiểm tra người dùng có phải admin không

            if (user != null && user.getIsAdmin().equalsIgnoreCase("true")) {
                String action = request.getParameter("action");
                SaleOffDAO saleOffDAO = new SaleOffDAO();

                // Các tham số tìm kiếm
                String saleCode = request.getParameter("saleCode");
                String discountType = request.getParameter("discountType");
                String sortDiscountValue = request.getParameter("sortDiscountValue");

                // Các tham số phân trang
                String pageIndexStr = request.getParameter("page");
                int pageIndex = 1;
                if (pageIndexStr != null) {
                    try {
                        pageIndex = Integer.parseInt(pageIndexStr);
                    } catch (NumberFormatException e) {
                        pageIndex = 1;
                    }
                }
                int pageSize = 5; // ví dụ 5 sản phẩm mỗi trang
                if (action == null || action.equals("")) {
                    List<SaleOff> saleOffList;

                    //nếu không nhập gì, lấy tất cả sale off
                    if ((saleCode == null || saleCode.trim().isEmpty())
                            && (discountType == null || discountType.trim().isEmpty())
                            && (sortDiscountValue == null || sortDiscountValue.trim().isEmpty())) {

                        saleOffList = saleOffDAO.getAllSaleOffs();
                    } else {
                        //nếu có nhập vào thanh tìm kiếm
                        saleOffList = saleOffDAO.searchSaleOffs(saleCode, discountType, sortDiscountValue);
                    }
                    int totalRecords = saleOffList.size();
                    int totalPages = (int) Math.ceil((double) totalRecords / pageSize);

                    int fromIndex = (pageIndex - 1) * pageSize;
                    int toIndex = Math.min(fromIndex + pageSize, totalRecords);

                    List<SaleOff> allSaleOffList = new ArrayList<>();
                    if (fromIndex < totalRecords) {
                        saleOffList = saleOffList.subList(fromIndex, toIndex);
                    }

                    // Gửi dữ liệu qua JSP
                    request.setAttribute("saleOffs", saleOffList);
                    request.setAttribute("totalPages", totalPages);
                    request.setAttribute("pageIndex", pageIndex);

                    // Giữ lại thông tin tìm kiếm khi phân trang
                    request.setAttribute("saleCode", saleCode);
                    request.setAttribute("discountType", discountType);
                    request.setAttribute("sortDiscountValue", sortDiscountValue);
                    request.setAttribute("saleOffs", saleOffList);
                    request.getRequestDispatcher("admin/saleoff.jsp").forward(request, response);
                }

            } else {
                response.sendRedirect("user?action=login");
                return;
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("404.jsp");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        // Kiểm tra quyền admin từ session
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user != null && user.getIsAdmin().equalsIgnoreCase("true")) {
            if (action.equalsIgnoreCase("add")) {
                addSaleOff(request, response);
            } else if (action.equalsIgnoreCase("update")) {
                updateSaleOff(request, response);
            } else if (action.equalsIgnoreCase("delete")) {
                deleteSaleOff(request, response);
            }
        } else {
            response.sendRedirect("user?action=login");
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// 

    private void addSaleOff(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    private void updateSaleOff(HttpServletRequest request, HttpServletResponse response) {
        try {
            // Lấy các tham số từ request
            String saleCode = request.getParameter("saleCode");
            String discountType = request.getParameter("discountType");
            Double discountValue = Double.valueOf(request.getParameter("discountValue"));
            Double maxDiscount = Double.valueOf(request.getParameter("maxDiscount"));
            String startDateStr = request.getParameter("startDate");
            String endDateStr = request.getParameter("endDate");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            int saleId = Integer.parseInt(request.getParameter("saleId"));

            // Chuyển đổi startDate và endDate từ String sang Date
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date startDate = null;
            Date endDate = null;

            try {
                if (startDateStr != null && !startDateStr.isEmpty()) {
                    startDate = dateFormat.parse(startDateStr);
                }
                if (endDateStr != null && !endDateStr.isEmpty()) {
                    endDate = dateFormat.parse(endDateStr);
                }
            } catch (ParseException e) {
                e.printStackTrace();
                // Bạn có thể thêm một thông báo lỗi ở đây để người dùng biết
            }

            // Tạo đối tượng SaleOff để cập nhật
            SaleOff updatedSaleOff = new SaleOff(saleId, saleCode, discountType, discountValue, maxDiscount, startDate, endDate, quantity);

            // Cập nhật vào cơ sở dữ liệu
            SaleOffDAO saleOffDAO = new SaleOffDAO();
            boolean updateSuccess = saleOffDAO.updateSaleOff(updatedSaleOff);

            // Kiểm tra kết quả cập nhật
            if (updateSuccess) {
                // Nếu thành công, redirect về danh sách
                response.sendRedirect("saleoff");
            } else {
                // Nếu không thành công, chuyển hướng đến trang lỗi hoặc hiển thị thông báo lỗi
                request.setAttribute("errorMessage", "Cập nhật thất bại. Vui lòng thử lại.");
                request.getRequestDispatcher("admin/saleoff.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            try {
                // Nếu có lỗi xảy ra, chuyển hướng đến trang lỗi
                response.sendRedirect("404.jsp");
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }

    }

    private void deleteSaleOff(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
