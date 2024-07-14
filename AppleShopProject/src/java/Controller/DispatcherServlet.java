/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Users;
import ModelDao.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

/**
 *
 * @author kivil
 */
public class DispatcherServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DispatcherServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DispatcherServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page = request.getParameter("page");
        if(page.equals("EditUserForm.jsp")){
            int id = Integer.parseInt(request.getParameter("id"));
            Users existingUser = UserDao.getUsersbyID(id);
            request.getSession().setAttribute("user", existingUser);
        } else if(page.equals("DeleteUser.jsp")){
            int id = Integer.parseInt(request.getParameter("id"));
            UserDao.deleteUsers(id);
            page = "UserCategory.jsp";
        }
        request.setAttribute("bodyPage", page);
        ArrayList<Users> list = UserDao.getAllUsers();
        request.getSession().setAttribute("list", list);
        request.getRequestDispatcher("AdminPage.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
