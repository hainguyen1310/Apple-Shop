/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Role;
import ModelDao.RoleDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

/**
 *
 * @author kivil
 */
public class RoleServlet extends HttpServlet {

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
            out.println("<title>Servlet RoleServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RoleServlet at " + request.getContextPath() + "</h1>");
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
            Role existing = RoleDao.getRolebyID(id);
            request.getSession().setAttribute("role", existing);
        } else if (page.equals("Delete.jsp")) {
            int id = Integer.parseInt(request.getParameter("id"));
            RoleDao.deleteRole(id);
            page = "Index.jsp";
        }
        request.setAttribute("bodyPage", "role/" + page);
        ArrayList<Role> list = RoleDao.getAllRole();
        request.getSession().setAttribute("list", list);
        RequestDispatcher rd = request.getRequestDispatcher("AdminPage.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String result = request.getParameter("submit");

        try {
            switch (result) {
                case "Add New":
                    AddRole(request, response);
                    break;
                case "Edit":
                    showEditForm(request, response);
                    break;
                case "Update":
                    UpdateRole(request, response);
                    break;
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    private void AddRole(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String rname = request.getParameter("rolename");


        Role role = new Role();
        role.setRoleName(rname);
        int status = RoleDao.addRole(role);
        if (status > 0) {
            request.setAttribute("bodyPage", "role/Index.jsp");
            ArrayList<Role> list = RoleDao.getAllRole();
            request.getSession().setAttribute("list", list);
            RequestDispatcher rd = request.getRequestDispatcher("AdminPage.jsp");
            rd.forward(request, response);
        }
    }

    private void UpdateRole(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        String rname = request.getParameter("rolename");

        Role user = new Role();
        user.setRoleID(id);
        user.setRoleName(rname);

        int status = RoleDao.updateRole(user);
        if (status >0) {
            request.setAttribute("bodyPage", "role/Index.jsp");
            ArrayList<Role> list = RoleDao.getAllRole();
            request.getSession().setAttribute("list", list);
            RequestDispatcher rd = request.getRequestDispatcher("AdminPage.jsp");
            rd.forward(request, response);
        }
    }
    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        Role existing = RoleDao.getRolebyID(id);
        request.setAttribute("role", existing);
        request.setAttribute("bodyPage", "Edit.jsp");
        RequestDispatcher rd = request.getRequestDispatcher("AdminPage.jsp");
        rd.forward(request, response);
    }
}

