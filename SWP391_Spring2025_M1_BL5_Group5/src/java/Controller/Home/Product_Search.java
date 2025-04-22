/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Home;

import dal.productDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.awt.Desktop;
import java.util.ArrayList;
import java.util.List;
import model.Category;

/**
 *
 * @author MSI
 */
public class Product_Search extends HttpServlet {

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
        String action = request.getParameter("action");
        //SearchByPrice
        if (action.equalsIgnoreCase("searchByPrice")) {
            productDAO dao = new productDAO();
            List<Category> category = dao.getCategory();
            String[] choose = request.getParameterValues("price");
            List<model.Product> list1 = dao.searchProductByPrice(0, 50000);
            List<model.Product> list2 = dao.searchProductByPrice(50000, 200000);
            List<model.Product> list3 = dao.searchProductByPrice(200000, 500000);
            List<model.Product> list4 = dao.searchProductByPrice(500000, 1000000);
            List<model.Product> list5 = dao.getProductByPrice(1000000);
            List<model.Product> list0 = dao.getProduct();
            List<model.Product> listc = new ArrayList<>();

            // Combine selected price range lists
            if (choose.length == 5) {
                listc.addAll(list1);
                listc.addAll(list2);
                listc.addAll(list3);
                listc.addAll(list4);
                listc.addAll(list5);
            } else if (choose.length == 2) {
                if (!choose[0].equals("0") && !choose[1].equals("0")) {
                    listc.addAll(list2);
                    listc.addAll(list3);
                }
                if (!choose[0].equals("1") && !choose[1].equals("1")) {
                    listc.addAll(list1);
                    listc.addAll(list3);
                }
                if (!choose[0].equals("2") && !choose[1].equals("2")) {
                    listc.addAll(list1);
                    listc.addAll(list2);
                }
            } else if (choose.length == 1) {
                switch (choose[0]) {
                    case "0":
                        listc.addAll(list1);
                        break;
                    case "1":
                        listc.addAll(list2);
                        break;
                    case "2":
                        listc.addAll(list3);
                        break;
                    case "3":
                        listc.addAll(list4);
                        break;
                    case "4":
                        listc.addAll(list5);
                        break;
                    default:
                        listc.addAll(list0);
                        break;
                }
            } else {
                listc.addAll(list0);
            }

            // Pagination logic
            int page, numperpage = 9;
            int size = listc.size();
            int num = (size % 9 == 0 ? (size / 9) : ((size / 9)) + 1);// Number of pages
            String xpage = request.getParameter("page");
            if (xpage == null) {
                page = 1; // Default page
            } else {
                page = Integer.parseInt(xpage);
            }
            int start = (page - 1) * numperpage;
            int end = Math.min(page * numperpage, size);
            List<model.Product> product = listc.subList(start, end); // Sublist for current page

            request.setAttribute("page", page);
            request.setAttribute("num", num);
            request.setAttribute("CategoryData", category);
            request.setAttribute("ProductData", product);
            request.getRequestDispatcher("shop_category.jsp").forward(request, response);
        }
        // Search by color
        if (action.equalsIgnoreCase("SearchByColor")) {
            productDAO dao = new productDAO();
            List<Category> category = dao.getCategory();
            String[] choose = request.getParameterValues("colors");
            List<model.Product> list1 = dao.getProductByColor("Red");
            List<model.Product> list2 = dao.getProductByColor("Blue");
            List<model.Product> list3 = dao.getProductByColor("White");
            List<model.Product> list4 = dao.getProductByColor("Black");
            List<model.Product> list0 = dao.getProduct();
            List<model.Product> listp = new ArrayList<>();

            // Combine selected color lists
            if (choose == null || choose.length == 0 || choose.length == 4) {
                listp.addAll(list0); // Default to all products if no colors selected
            } else {
                for (String color : choose) {
                    switch (color) {
                        case "0":
                            listp.addAll(list1);
                            break;
                        case "1":
                            listp.addAll(list2);
                            break;
                        case "2":
                            listp.addAll(list3);
                            break;
                        case "3":
                            listp.addAll(list4);
                            break;
                    }
                }
            }

            // Pagination logic
            int page, numperpage = 9;
            int size = listp.size();
            int num = (size % 9 == 0 ? (size / 9) : ((size / 9)) + 1);// Number of pages
            String xpage = request.getParameter("page");
            if (xpage == null) {
                page = 1; // Default page
            } else {
                page = Integer.parseInt(xpage);
            }
            int start = (page - 1) * numperpage;
            int end = Math.min(page * numperpage, size);
            List<model.Product> product = listp.subList(start, end); // Sublist for current page

            request.setAttribute("page", page);
            request.setAttribute("num", num);
            request.setAttribute("CategoryData", category);
            request.setAttribute("ProductData", product);
            request.getRequestDispatcher("shop_category.jsp").forward(request, response);
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
