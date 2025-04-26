package Controller.Home;

import dal.reportDAO;
import model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import model.BillDetail;

@WebServlet(name = "Report", urlPatterns = {"/report"})
public class Report extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Cấu hình UTF-8 cho encoding và response
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        // Lấy đối tượng session và user hiện tại
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        // Kiểm tra xem người dùng có đăng nhập chưa
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Lấy các tham số từ form phản hồi
        String subjectReport = request.getParameter("subject_report");
        String contentReport = request.getParameter("content_report");

        // Kiểm tra nếu có nội dung phản hồi
        if (subjectReport != null && contentReport != null && !subjectReport.isEmpty() && !contentReport.isEmpty()) {
            reportDAO dao = new reportDAO();
            try {
                // Gửi phản hồi vào database
                dao.InsertReport(String.valueOf(user.getUser_id()), contentReport, subjectReport, user.getUser_email());
                // Gửi thông báo thành công
                request.setAttribute("msgc", "Phản hồi của bạn đã được gửi thành công!");
            } catch (Exception e) {
                // Gửi thông báo lỗi nếu có vấn đề xảy ra
                request.setAttribute("msgc", "Đã xảy ra lỗi khi gửi phản hồi. Vui lòng thử lại!");
                e.printStackTrace();
            }
        } else {
            request.setAttribute("msgc", "Vui lòng nhập đầy đủ chủ đề và nội dung phản hồi.");
        }

        // Giữ lại thông tin sản phẩm và gửi thông báo
        // Lấy lại danh sách chi tiết đơn hàng từ session hoặc database
        List<BillDetail> details = getBillDetails(user);  // Cần tạo phương thức này để lấy chi tiết đơn hàng
        request.setAttribute("detail", details);

        // Chuyển tiếp về lại trang lịch sử đơn hàng mà không thay đổi URL
        RequestDispatcher dispatcher = request.getRequestDispatcher("billdetail.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    // Giả sử bạn có một phương thức để lấy chi tiết đơn hàng của user
    private List<BillDetail> getBillDetails(User user) {
        // Thực hiện truy vấn hoặc lấy từ session nếu cần
        // Ví dụ:
        List<BillDetail> details = new ArrayList<>();
        // Giả sử bạn có phương thức trong DAO để lấy chi tiết hóa đơn
        // details = dao.getBillDetails(user.getUser_id());
        return details;
    }
}
