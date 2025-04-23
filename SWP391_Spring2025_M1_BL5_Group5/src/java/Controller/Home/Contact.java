package Controller.Home;

import dal.reportDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class Contact extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.getRequestDispatcher("contact.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        reportDAO dao = new reportDAO();
        
        // Lấy thông tin người dùng từ session
        String user_id = (String) session.getAttribute("user_id");  // Giả sử bạn lưu user_id trong session
        String user_email = (String) session.getAttribute("user_email");  // Giả sử bạn lưu user_email trong session
        
        // Kiểm tra nếu người dùng chưa đăng nhập
        if (user_email == null || user_id == null) {
            String msg = "Bạn cần đăng nhập để gửi phản hồi.";
            request.setAttribute("contact_msg", msg);
            request.setAttribute("contact_msg_success", false);  // Failure flag
            request.getRequestDispatcher("contact.jsp").forward(request, response);  // Chuyển tiếp đến contact.jsp
            return;
        }
        
        // Lấy dữ liệu form
        String subject_report = request.getParameter("subject_report");
        String content_report = request.getParameter("content_report");
        
        // Kiểm tra nếu các trường bắt buộc không bị bỏ trống
        if (subject_report == null || subject_report.trim().isEmpty() || content_report == null || content_report.trim().isEmpty()) {
            String msg = "Vui lòng nhập đầy đủ thông tin.";
            request.setAttribute("contact_msg", msg);
            request.setAttribute("contact_msg_success", false);  // Failure flag
            request.getRequestDispatcher("contact.jsp").forward(request, response);  // Chuyển tiếp đến contact.jsp
            return;
        }

        // Chèn phản hồi vào cơ sở dữ liệu
        dao.InsertReport(user_id, content_report, subject_report, user_email);

        // Trả về thông báo thành công
        String msg = "Bạn đã gửi phản hồi thành công cho cửa hàng.";
        request.setAttribute("contact_msg", msg);
        request.setAttribute("contact_msg_success", true);  // Success flag
        request.getRequestDispatcher("contact.jsp").forward(request, response);  // Chuyển tiếp đến contact.jsp
    }

    @Override
    public String getServletInfo() {
        return "Contact Servlet to handle contact form submissions";
    }
}
