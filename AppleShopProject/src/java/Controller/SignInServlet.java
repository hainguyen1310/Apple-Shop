/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Role;
import Model.Users;
import ModelDao.RoleDao;
import ModelDao.UserDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 *
 * @author PC
 */
public class SignInServlet extends HttpServlet {

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
            out.println("<title>Servlet SignInServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignInServlet at " + request.getContextPath() + "</h1>");
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
        String uname = request.getParameter("user");
        String upass = request.getParameter("pass");
        String uemail = request.getParameter("email");
        String telphone = request.getParameter("telphone");

        Users user = new Users();
        user.setUserName(uname);
        user.setPassword(upass);
        user.setEmail(uemail);
        user.setTel(telphone);
        user.setRoleID(2);
        int status = UserDao.addClient(user);
        HttpSession session = request.getSession();
        if (status > 0) {
            session.setAttribute("username", uname);
            Role role = new Role();
            
            role.setRoleName(RoleDao.getRolebyID(user.getRoleID()).getRoleName());
            session.setAttribute("pass", upass);
            session.setAttribute("role", role.getRoleName());
            session.setAttribute("username", uname);
            RequestDispatcher rd = request.getRequestDispatcher("/client/index.jsp");
            rd.forward(request, response);
        } else {
            RequestDispatcher rd = request.getRequestDispatcher("/client/registration.jsp");
            rd.include(request, response);
        }
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
        response.setContentType("text/html;charset=UTF-8");
        String username = request.getParameter("user");
        String password = request.getParameter("password");
        Users u = new Users();
        u.setUserName(username);
        u.setPassword(password);
        boolean user = UserDao.validate(u);
        HttpSession session = request.getSession();
        session.setAttribute("username", username);
        session.setAttribute("pass", password);
        if(user){
            u.setRoleID(UserDao.getRoleByUsername(username));
            Role role = new Role();
            
            role.setRoleName(RoleDao.getRolebyID(u.getRoleID()).getRoleName());
            session.setAttribute("role", role.getRoleName());
            RequestDispatcher rd = request.getRequestDispatcher("/client/index.jsp");
            rd.forward(request, response);
        } else {
            RequestDispatcher rd = request.getRequestDispatcher("/client/registration.jsp");
            rd.include(request, response);
        }
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
