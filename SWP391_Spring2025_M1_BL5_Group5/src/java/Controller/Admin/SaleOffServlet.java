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
import java.util.ArrayList;

@WebServlet(name = "SaleOffServlet", urlPatterns = {"/saleoff"})
public class SaleOffServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        SaleOffDAO saleOffDao = new SaleOffDAO();
        List<SaleOff> saleOffs = saleOffDao.getAllSaleOffs();
        request.setAttribute("saleOffs", saleOffs);
        request.getRequestDispatcher("admin/saleoff.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// 
}
