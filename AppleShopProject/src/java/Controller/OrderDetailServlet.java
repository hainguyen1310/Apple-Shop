/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Bags;
import Model.OrderDetail;
import ModelDao.BagsDao;
import ModelDao.OrderDetailDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

/**
 *
 * @author PC
 */
public class OrderDetailServlet extends HttpServlet {

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
            out.println("<title>Servlet OrderDetailServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderDetailServlet at " + request.getContextPath() + "</h1>");
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
        String page = request.getParameter("page");
        if (page.equals("Edit.jsp")) {
            int prid = Integer.parseInt(request.getParameter("prid"));
            int oid = Integer.parseInt(request.getParameter("oid"));
            OrderDetail odetail = OrderDetailDao.getOrderDetailbyID(prid,oid);
            request.getSession().setAttribute("odetail", odetail);
        } else if (page.equals("Delete.jsp")) {
            int prid = Integer.parseInt(request.getParameter("prid"));
            int oid = Integer.parseInt(request.getParameter("oid"));
            OrderDetailDao.deleteOrderDetail(prid,oid);
            page = "Index.jsp";
        }
        request.setAttribute("bodyPage", "orderdetail/" + page);
        ArrayList<OrderDetail> list = OrderDetailDao.getAllOrderDetail();
        request.getSession().setAttribute("list", list);
        RequestDispatcher rd = request.getRequestDispatcher("AdminPage.jsp");
        rd.forward(request, response);
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
        String result = request.getParameter("submit");

        try {
            switch (result) {
                case "Add New":
                    AddOrderDetail(request, response);
                    break;
                case "Update":
                    UpdateOrderDetail(request, response);
                    break;
//                default:
//                    listStudent(request, response);
//                    break;
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    private void AddOrderDetail(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int orderid = Integer.parseInt(request.getParameter("orderid"));
        int productid = Integer.parseInt(request.getParameter("productid"));
        int stock = Integer.parseInt(request.getParameter("stock"));
        float price = Float.parseFloat(request.getParameter("price"));
        OrderDetail odetail = new OrderDetail(orderid,productid,stock,price);
        int status = OrderDetailDao.addOrderDetail(odetail);
        if (status > 0) {
            request.setAttribute("bodyPage", "orderdetail/Index.jsp");
            ArrayList<OrderDetail> list = OrderDetailDao.getAllOrderDetail();
            request.getSession().setAttribute("list", list);
            RequestDispatcher rd = request.getRequestDispatcher("AdminPage.jsp");
            rd.forward(request, response);
        }
    }

    private void UpdateOrderDetail(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int orderid = Integer.parseInt(request.getParameter("orderid"));
        int productid = Integer.parseInt(request.getParameter("productid"));
        int stock = Integer.parseInt(request.getParameter("stock"));
        float price = Float.parseFloat(request.getParameter("price"));

        OrderDetail odetail = new OrderDetail(orderid,productid,stock,price);
        int status = OrderDetailDao.updateOrderDetail(odetail);
        if (status >0) {
            request.setAttribute("bodyPage", "orderdetail/Index.jsp");
            ArrayList<OrderDetail> list = OrderDetailDao.getAllOrderDetail();
            request.getSession().setAttribute("list", list);
            RequestDispatcher rd = request.getRequestDispatcher("AdminPage.jsp");
            rd.forward(request, response);
        }
    }
}
