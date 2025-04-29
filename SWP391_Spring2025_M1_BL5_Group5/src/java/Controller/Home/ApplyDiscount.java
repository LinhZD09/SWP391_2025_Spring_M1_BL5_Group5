/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Home;

import dal.SaleOffDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.time.LocalDate;
import model.SaleOff;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ApplyDiscount", urlPatterns = {"/applyDiscount"})
public class ApplyDiscount extends HttpServlet {

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
            out.println("<title>Servlet ApplyDiscount</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ApplyDiscount at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();

        String action = request.getParameter("action");
        String discountCode = request.getParameter("discountCode");

        // Nếu bấm HỦY MÃ
        if ("remove".equals(action)) {
            session.removeAttribute("discountCode");
            session.removeAttribute("discountAmount");
            session.removeAttribute("finalTotal");
            response.sendRedirect("cart.jsp");
            return;
        }

        // Nếu bấm ÁP DỤNG
        Double total = (Double) session.getAttribute("total");
        if (discountCode == null || discountCode.trim().isEmpty() || total == null) {
            response.sendRedirect("cart.jsp");
            return;
        }

        Date today = Date.valueOf(LocalDate.now());
        SaleOffDAO dao = new SaleOffDAO();
        SaleOff discount = dao.getValidSaleOff(discountCode.trim(), today);

        if (discount == null) {
            request.setAttribute("discountCode", discountCode);
            request.setAttribute("error", "❌ Mã giảm giá không hợp lệ hoặc hết hạn.");
            request.getRequestDispatcher("cart.jsp").forward(request, response);
            return;
        }

        double discountAmount = 0;
        if ("fixed".equalsIgnoreCase(discount.getDiscountType())) {
            discountAmount = discount.getDiscountValue();
        } else if ("percentage".equalsIgnoreCase(discount.getDiscountType())) {
            discountAmount = total * discount.getDiscountValue() / 100.0;
            if (discountAmount > discount.getMaxDiscount()) {
                discountAmount = discount.getMaxDiscount();
            }
        }

        double finalTotal = total - discountAmount;
        if (finalTotal < 0) {
            finalTotal = 0;
        }
        request.setAttribute("finalTotal", finalTotal);
        session.setAttribute("discountCode", discountCode);
        session.setAttribute("discountAmount", discountAmount);
        session.setAttribute("finalTotal", finalTotal);

        dao.reduceQuantity(discount.getSaleId());

        response.sendRedirect("cart.jsp");
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
