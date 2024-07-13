/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.User;
import ModelDao.UserDao;
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
public class UserServlet extends HttpServlet {

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
            out.println("<title>Servlet UserServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserServlet at " + request.getContextPath() + "</h1>");
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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String result = request.getParameter("submit");

        try {
            switch (result) {
                case "Sign in":
                    SignIn(request, response);
                    break;
                case "Register":
                    Regis(request, response);
                    break;
                case "Add New":
                    AddUser(request, response);
                    break;
                case "Edit":
                    showEditForm(request, response);
                    break;
                case "Update":
                    UpdateUser(request, response);
                    break;
//                default:
//                    listStudent(request, response);
//                    break;
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    private void SignIn(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String uname = request.getParameter("username");
        String upass = request.getParameter("password");

        User user = new User();
        user.setUsername(uname);
        user.setPassword(upass);
        user.setRoleId(UserDao.getRoleByUsername(uname));
        HttpSession session = request.getSession();
        if (UserDao.validate(user)) {
            session.setAttribute("pass", user.getPassword());
            session.setAttribute("role", user.getRoleId());
            session.setAttribute("username", uname);
            RequestDispatcher rd = request.getRequestDispatcher("/admin/html/AdminPage.jsp");
            rd.forward(request, response);
        } else {
            session.setAttribute("login_msg", "Sorry, Username or Password is incorrect");
            RequestDispatcher rd = request.getRequestDispatcher("LoginPage.jsp");
            rd.include(request, response);
        }
    }

    private void Regis(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String uname = request.getParameter("username");
        String upass = request.getParameter("password");
        String uemail = request.getParameter("email");

        User user = new User();
        user.setUsername(uname);
        user.setPassword(upass);
        user.setEmail(uemail);
        user.setRoleId(2);
        int status = UserDao.regis(user);
        HttpSession session = request.getSession();
        if (status > 0) {
            session.setAttribute("username", uname);
            RequestDispatcher rd = request.getRequestDispatcher("/admin/html/AdminPage.jsp");
            rd.forward(request, response);
        } else {
            session.setAttribute("regis_msg", "Sorry, Username already exist");
            RequestDispatcher rd = request.getRequestDispatcher("RegisterForm.jsp");
            rd.include(request, response);
        }
    }

    private void AddUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String uname = request.getParameter("username");
        String upass = request.getParameter("password");
        String uemail = request.getParameter("email");

        User user = new User();
        user.setUsername(uname);
        user.setPassword(upass);
        user.setEmail(uemail);
        user.setRoleId(1);
        int status = UserDao.regis(user);
        if (status > 0) {
            request.setAttribute("bodyPage", "UserCategory.jsp");
            ArrayList<User> list = UserDao.getAllUsers();
            request.getSession().setAttribute("list", list);
            RequestDispatcher rd = request.getRequestDispatcher("AdminPage.jsp");
            rd.forward(request, response);
        }
    }

    private void UpdateUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        String uname = request.getParameter("username");
        String upass = request.getParameter("password");
        String uemail = request.getParameter("email");
        int urole = Integer.parseInt(request.getParameter("role"));

        User user = new User(id,uname,upass,uemail,urole);
        boolean status = UserDao.update(user);
        if (status) {
            request.setAttribute("bodyPage", "UserCategory.jsp");
            ArrayList<User> list = UserDao.getAllUsers();
            request.getSession().setAttribute("list", list);
            RequestDispatcher rd = request.getRequestDispatcher("AdminPage.jsp");
            rd.forward(request, response);
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        User existingUser = UserDao.getUserByUserID(id);
        request.setAttribute("user", existingUser);
        request.setAttribute("bodyPage", "EditUserForm.jsp");
        RequestDispatcher rd = request.getRequestDispatcher("AdminPage.jsp");
        rd.forward(request, response);
    }
}
