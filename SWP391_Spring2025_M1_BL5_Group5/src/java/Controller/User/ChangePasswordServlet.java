/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.User;
import java.sql.SQLException;
import model.User;
import dal.userDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ChangePasswordServlet", urlPatterns = {"/users"})
public class ChangePasswordServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ChangePasswordServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePasswordServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy thông tin từ form
        String oldPassword = request.getParameter("old_password");
        String newPassword = request.getParameter("new_password");
        String confirmNewPassword = request.getParameter("confirm_new_password");
        userDAO usersDAO = new userDAO();
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("user");  // Lấy thông tin người dùng từ session

        if (currentUser == null) {
            response.sendRedirect("login.jsp");  // Nếu người dùng chưa đăng nhập, chuyển hướng tới trang đăng nhập
            return;
        }

        // Kiểm tra mật khẩu cũ có khớp không
        if (!oldPassword.equals(currentUser.getUser_pass())) {
            session.setAttribute("error_pass", "Mật khẩu cũ không chính xác");
            response.sendRedirect("my-account.jsp");  // Quay lại trang tài khoản
            return;
        }

        // Kiểm tra mật khẩu mới và xác nhận mật khẩu mới có khớp không
        if (!newPassword.equals(confirmNewPassword)) {
            session.setAttribute("error_pass", "Mật khẩu mới và xác nhận mật khẩu không khớp");
            response.sendRedirect("my-account.jsp");  // Quay lại trang tài khoản
            return;
        }

        // Cập nhật mật khẩu mới trong cơ sở dữ liệu
        currentUser.setUser_pass(newPassword);

        // Thêm try-catch để xử lý ngoại lệ SQLException
        try {
            boolean isUpdated = usersDAO.updatePassword(currentUser); // Gọi phương thức updatePassword

            // Kiểm tra kết quả cập nhật và thiết lập thông báo trong session
            if (isUpdated) {
                session.setAttribute("updateMessage", "Đổi mật khẩu thành công");
            } else {
                session.setAttribute("error_pass", "Đã có lỗi xảy ra khi cập nhật mật khẩu");
            }
        } catch (SQLException e) {
            // Bắt ngoại lệ SQLException và thông báo lỗi
            session.setAttribute("error_pass", "Có lỗi xảy ra khi cập nhật mật khẩu: " + e.getMessage());
            e.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(ChangePasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Chuyển hướng trở lại trang tài khoản
        response.sendRedirect("my-account.jsp");
    
}

/**
 * Returns a short description of the servlet.
 *
 * @return a String containing servlet description
 */
@Override
public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
