package Controller;

import Model.Orders;
import Model.Users;
import ModelDao.OrdersDao;
import ModelDao.UserDao;
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
public class OrdersServlet extends HttpServlet {

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
            out.println("<title>Servlet OrdersServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrdersServlet at " + request.getContextPath() + "</h1>");
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
            int id = Integer.parseInt(request.getParameter("id"));
            Orders order = OrdersDao.getOrdersbyID(id);
            request.getSession().setAttribute("order", order);
        } else if (page.equals("Delete.jsp")) {
            int id = Integer.parseInt(request.getParameter("id"));
            OrdersDao.deleteOrders(id);
            page = "Index.jsp";
        }
        request.setAttribute("bodyPage", "orders/" + page);
        ArrayList<Orders> list = OrdersDao.getAllOrders();
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
                    AddOrders(request, response);
                    break;
                case "Update":
                    UpdateOrders(request, response);
                    break;
//                default:
//                    listStudent(request, response);
//                    break;
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    private void AddOrders(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int userorder = Integer.parseInt(request.getParameter("userorder"));
        String status = request.getParameter("status");
        Orders order = new Orders(userorder,status);
        int status1 = OrdersDao.addOrders(order);
        if (status1 > 0) {
            request.setAttribute("bodyPage", "orders/Index.jsp");
            ArrayList<Orders> list = OrdersDao.getAllOrders();
            request.getSession().setAttribute("list", list);
            RequestDispatcher rd = request.getRequestDispatcher("AdminPage.jsp");
            rd.forward(request, response);
        }
    }

    private void UpdateOrders(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        int userorder = Integer.parseInt(request.getParameter("userorder"));
        String dateorder = request.getParameter("dateorder");
        String status = request.getParameter("status");

        Orders order = new Orders(id,userorder,dateorder,status);
        int status1 = OrdersDao.updateOrders(order);
        if (status1 >0) {
            request.setAttribute("bodyPage", "orders/Index.jsp");
            ArrayList<Orders> list = OrdersDao.getAllOrders();
            request.getSession().setAttribute("list", list);
            RequestDispatcher rd = request.getRequestDispatcher("AdminPage.jsp");
            rd.forward(request, response);
        }
    }
}
