package Controller.Home;

import dal.billDAO;
import dal.UserDAO;
import model.BillDetail;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.logging.Level;
import java.util.logging.Logger;

public class User extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        // giữ nguyên phần encoding
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String action = request.getParameter("action");

        if ("login".equals(action)) {
            request.getRequestDispatcher("login.jsp").forward(request, response);

        } else if ("checkLogin".equals(action)) {
            String user_email = request.getParameter("user_email");
            String user_pass = request.getParameter("user_pass");
            String remember = request.getParameter("remember");
            UserDAO dao = new UserDAO();
            model.User user = dao.checkUser(user_email, user_pass);
            HttpSession session = request.getSession();

            if (user == null) {
                session.setAttribute("error_exist", "Tài khoản không tồn tại !");
                request.getRequestDispatcher("user?action=login").forward(request, response);
                return;
            } else if (user.isBanned()) {
                session.setAttribute("error_ban", "Tài khoản của bạn đã bị khóa. Vui lòng liên hệ quản trị viên.");
                request.getRequestDispatcher("user?action=login").forward(request, response);
                return;
            } else {
                session.setAttribute("user", user);
                session.setAttribute("loginMessage", "Đăng nhập thành công!");
                session.setAttribute("user_id", user.getUser_id());
                session.setAttribute("user_email", user.getUser_email());
                Cookie emailCookie = new Cookie("email", user_email);
                Cookie passCookie = new Cookie("pass", user_pass);
                Cookie remCookie = new Cookie("remember", remember);

                if (remember != null) {
                    emailCookie.setMaxAge(60 * 60 * 24 * 30);
                    passCookie.setMaxAge(60 * 60 * 24 * 30);
                    remCookie.setMaxAge(60 * 60 * 24 * 30);
                } else {
                    emailCookie.setMaxAge(0);
                    passCookie.setMaxAge(0);
                    remCookie.setMaxAge(0);
                }

                response.addCookie(emailCookie);
                response.addCookie(passCookie);
                response.addCookie(remCookie);
                response.sendRedirect("home");
            }

        } else if ("logout".equals(action)) {
            HttpSession session = request.getSession();
            session.removeAttribute("user");
            session.setAttribute("logoutMessage", "Đăng xuất thành công!");
            response.sendRedirect("home");

        } else if ("myaccount".equals(action)) {
            try {
                HttpSession session = request.getSession();
                model.User user = (model.User) session.getAttribute("user");
                if (user != null) {
                    int user_id = user.getUser_id();
                    billDAO dao = new billDAO();
                    List<model.Bill> bill = dao.getBillByID(user_id);
                    request.setAttribute("bill", bill);
                    request.getRequestDispatcher("my-account.jsp").forward(request, response);
                } else {
                    response.sendRedirect("user?action=login");
                }
            } catch (Exception e) {
                response.sendRedirect("user?action=login");
            }

        } else if ("showdetail".equals(action)) {
            String bill_id = request.getParameter("bill_id");
            int id = Integer.parseInt(bill_id);
            billDAO dao = new billDAO();
            List<BillDetail> detail = dao.getDetail(id);
            request.setAttribute("detail", detail);
            request.getRequestDispatcher("billdetail.jsp").forward(request, response);

        } else if ("updateinfo".equals(action)) {
            HttpSession session = request.getSession();
            model.User user = (model.User) session.getAttribute("user");
            if (user == null) {
                response.sendRedirect("user?action=login");
                return;
            }

            String user_name = request.getParameter("user_name");
            String user_email = request.getParameter("user_email");
            String dateOfBirth = request.getParameter("dateOfBirth");
            String address = request.getParameter("address");
            String phoneNumber = request.getParameter("phoneNumber");

            // 1. Validate date of birth
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            address = (address != null ? address.trim() : "");
            if (address.isEmpty()) {
                session.setAttribute("error_address", "Địa chỉ không được để trống");
                request.getRequestDispatcher("user?action=myaccount")
                        .forward(request, response);
                return;
            }
            try {
                Date dob = sdf.parse(dateOfBirth);
                if (dob.after(new Date())) {
                    session.setAttribute("error_dob", "Ngày sinh không được lớn hơn ngày hiện tại");
                    request.getRequestDispatcher("user?action=myaccount").forward(request, response);
                    return;
                }
            } catch (ParseException e) {
                session.setAttribute("error_dob", "Định dạng ngày sinh không hợp lệ");
                request.getRequestDispatcher("user?action=myaccount").forward(request, response);
                return;
            }

            // 2. Validate User Name và Phone Number
            // loại bỏ khoảng trắng đầu/cuối
            user_name = (user_name != null) ? user_name.trim() : "";

            boolean hasError = false;

// User Name: không được trống, 3–50 ký tự (khoảng trắng giữa vẫn cho phép)
            if (user_name.isEmpty()) {
                session.setAttribute("error_userName", "User Name không được để trống");
                hasError = true;
            } else if (user_name.length() < 3 || user_name.length() > 50) {
                session.setAttribute("error_userName", "User Name phải từ 3 đến 50 ký tự");
                hasError = true;
            }

            // Phone Number: đúng 10 chữ số, không chứa khoảng trắng hay ký tự chữ
            if (phoneNumber == null || !phoneNumber.matches("\\d{10}")) {
                session.setAttribute("error_phoneNumber",
                        "Phone Number phải gồm đúng 10 chữ số, không được chứa khoảng trắng hay ký tự chữ");
                hasError = true;
            }

            if (hasError) {
                request.getRequestDispatcher("user?action=myaccount").forward(request, response);
                return;
            }

            // 3. Cập nhật lên CSDL
            int user_id = user.getUser_id();
            UserDAO dao = new UserDAO();
            dao.updateUser(user_id, user_name, user_email, dateOfBirth, address, phoneNumber);

            // 4. Refresh session và thông báo thành công
            model.User updatedUser = new model.User(
                    user_id,
                    user_name,
                    user.getUser_email(),
                    user_email,
                    user.getIsAdmin(),
                    dateOfBirth,
                    address,
                    phoneNumber,
                    user.isBanned(),
                    user.getAdminReason(),
                    user.getIsStoreStaff()
            );
            session.setAttribute("user", updatedUser);
            session.setAttribute("updateMessage", "Cập nhật thông tin thành công!");
            response.sendRedirect("user?action=myaccount");

        } else if ("signup".equals(action)) {
            HttpSession session = request.getSession();
            UserDAO da = new UserDAO();
            String email = request.getParameter("user_email");
            String pass = request.getParameter("user_pass");
            String repass = request.getParameter("re_pass");
            String gRecaptchaResponse = request.getParameter("g-recaptcha-response");

            // Validate reCAPTCHA
            boolean verify = VerifyRecaptcha.verify(gRecaptchaResponse);
            if (!verify) {
                session.setAttribute("Recaptcha", "Vui lòng xác nhận mã captcha");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }

            // Password validation
            String passwordRegex = "^(?=.*[A-Z])(?=.*\\d)[A-Za-z\\d]{6,}$";
            if (!pass.matches(passwordRegex)) {
                session.setAttribute("error_match",
                        "Mật khẩu phải có ít nhất 6 ký tự, bao gồm ít nhất một chữ cái viết hoa và một chữ số");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }

            // Re-pass validation
            if (!pass.equals(repass)) {
                session.setAttribute("error_rePass", "Vui lòng nhập lại mật khẩu cho đúng");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }

            // Check existing account
            model.User existingUser = da.checkAcc(email);
            if (existingUser != null) {
                session.setAttribute("msg", "Email đã tồn tại");
                response.sendRedirect("user?action=login");
                return;
            }

            // Send verification email
            SendEmail sm = new SendEmail();
            String code = sm.getRandom();
            UserC userc = new UserC(code, email);
            boolean emailSent = sm.sendEmail1(userc);

            if (emailSent) {
                session.setAttribute("userc", userc);
                session.setAttribute("email", email);
                session.setAttribute("pass", pass);
                response.sendRedirect("verify.jsp");
            } else {
                session.setAttribute("emailError", "Lỗi khi gửi email. Vui lòng thử lại sau.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }

        } else {
            // Default
            response.sendRedirect("user?action=login");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
