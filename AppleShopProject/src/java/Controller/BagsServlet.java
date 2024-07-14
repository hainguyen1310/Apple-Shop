/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Bags;
import Model.Orders;
import ModelDao.BagsDao;
import ModelDao.OrdersDao;
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
public class BagsServlet extends HttpServlet {

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
            out.println("<title>Servlet Bags</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Bags at " + request.getContextPath() + "</h1>");
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
            int uid = Integer.parseInt(request.getParameter("uid"));
            Bags bag = BagsDao.getBagsbyID(prid,uid);
            request.getSession().setAttribute("bag", bag);
        } else if (page.equals("Delete.jsp")) {
            int prid = Integer.parseInt(request.getParameter("prid"));
            int uid = Integer.parseInt(request.getParameter("uid"));
            BagsDao.deleteBags(prid,uid);
            page = "Index.jsp";
        }
        request.setAttribute("bodyPage", "bags/" + page);
        ArrayList<Bags> list = BagsDao.getAllBags();
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
                    AddBags(request, response);
                    break;
                case "Update":
                    UpdateBags(request, response);
                    break;
//                default:
//                    listStudent(request, response);
//                    break;
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    private void AddBags(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int userid = Integer.parseInt(request.getParameter("userid"));
        int productid = Integer.parseInt(request.getParameter("productid"));
        int stock = Integer.parseInt(request.getParameter("stock"));
        boolean status = Boolean.parseBoolean(request.getParameter("status"));
        Bags bag = new Bags(userid,productid,status,stock);
        int status1 = BagsDao.addBags(bag);
        if (status1 > 0) {
            request.setAttribute("bodyPage", "bags/Index.jsp");
            ArrayList<Bags> list = BagsDao.getAllBags();
            request.getSession().setAttribute("list", list);
            RequestDispatcher rd = request.getRequestDispatcher("AdminPage.jsp");
            rd.forward(request, response);
        }
    }

    private void UpdateBags(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int userid = Integer.parseInt(request.getParameter("userid"));
        int productid = Integer.parseInt(request.getParameter("productid"));
        int stock = Integer.parseInt(request.getParameter("stock"));
        boolean status = Boolean.parseBoolean(request.getParameter("status"));

        Bags bag = new Bags(userid,productid,status,stock);
        int status1 = BagsDao.updateBags(bag);
        if (status1 >0) {
            request.setAttribute("bodyPage", "bags/Index.jsp");
            ArrayList<Bags> list = BagsDao.getAllBags();
            request.getSession().setAttribute("list", list);
            RequestDispatcher rd = request.getRequestDispatcher("AdminPage.jsp");
            rd.forward(request, response);
        }
    }
}
