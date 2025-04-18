/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import dal.billDAO;
import dal.categoryDAO;
import dal.productDAO;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Bill;
import model.Category;
import model.User;

/**
 *
 * @author Admin
 */
public class Dashboard extends HttpServlet {

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

        try {
            HttpSession session = request.getSession();
            model.User user = (User) session.getAttribute("user");
            if (user.getIsAdmin().equalsIgnoreCase("true") || user.getIsStoreStaff().equalsIgnoreCase("true")) {
                productDAO dao = new productDAO();
                billDAO bdao = new billDAO();
                categoryDAO cdao = new categoryDAO();
             

                int count = dao.CountProduct();
                int countuser = dao.CountUser();
                int countbill = dao.CountBill();
                int countproductlow = dao.CountProductLow();
//            List<Bill> billbyday = bdao.getBillByDay();
                request.setAttribute("product", count);
                request.setAttribute("user", countuser);
                request.setAttribute("bill", countbill);
                request.setAttribute("low", countproductlow);
              

                List<Object[]> monthlyTotals = bdao.getTotalBillAmountByMonth();
                request.setAttribute("monthlyTotals", monthlyTotals);
                request.getRequestDispatcher("/admin/index.jsp").forward(request, response);

            } else {
                response.sendRedirect("login");
            }
        } catch (Exception e) {
            response.sendRedirect("404.jsp");
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
        processRequest(request, response);
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
