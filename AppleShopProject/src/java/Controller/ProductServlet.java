/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Product;
import Model.Role;
import ModelDao.ProductDao;
import ModelDao.RoleDao;
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
public class ProductServlet extends HttpServlet {

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
            out.println("<title>Servlet ProductServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductServlet at " + request.getContextPath() + "</h1>");
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
            Product existing = ProductDao.getProductbyID(id);
            request.getSession().setAttribute("product", existing);
        } else if (page.equals("Delete.jsp")) {
            int id = Integer.parseInt(request.getParameter("id"));
            ProductDao.deleteProduct(id);
            page = "Index.jsp";
        }
        request.setAttribute("bodyPage", "product/" + page);
        ArrayList<Product> list = ProductDao.getAllProduct();
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
                    Add(request, response);
                    break;
                case "Update":
                    Update(request, response);
                    break;
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    private void Add(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String pname = request.getParameter("productname");
        int categoryID = Integer.parseInt(request.getParameter("categoryID"));
        float money = Float.parseFloat(request.getParameter("money"));
        int stock = Integer.parseInt(request.getParameter("stock"));
        String imageURL = request.getParameter("imageURL");
        String description = request.getParameter("description");
        String metaContent = request.getParameter("metaContent");

        Product product = new Product();
        product.setProductName(pname);
        product.setCategoryID(categoryID);
        product.setMoney(money);
        product.setStock(stock);
        product.setStatus(true);
        product.setImageURL(imageURL);
        product.setDescription(description);
        product.setMetaContent(metaContent);
        int status = ProductDao.addProduct(product);
        if (status > 0) {
            request.setAttribute("bodyPage", "product/Index.jsp");
            ArrayList<Product> list = ProductDao.getAllProduct();
            request.getSession().setAttribute("list", list);
            RequestDispatcher rd = request.getRequestDispatcher("AdminPage.jsp");
            rd.forward(request, response);
        }
    }

    private void Update(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        String pname = request.getParameter("productname");
        int categoryID = Integer.parseInt(request.getParameter("categoryID"));
        float money = Float.parseFloat(request.getParameter("money"));
        int stock = Integer.parseInt(request.getParameter("stock"));
        String imageURL = request.getParameter("imageURL");
        String description = request.getParameter("description");
        String metaContent = request.getParameter("metaContent");


        Product product = new Product();
        product.setProductID(id);
        product.setProductName(pname);
        product.setCategoryID(categoryID);
        product.setMoney(money);
        product.setStock(stock);
        product.setStatus(true);
        product.setImageURL(imageURL);
        product.setDescription(description);
        product.setMetaContent(metaContent);

        int status = ProductDao.updateProduct(product);
        if (status >0) {
            request.setAttribute("bodyPage", "product/Index.jsp");
            ArrayList<Product> list = ProductDao.getAllProduct();
            request.getSession().setAttribute("list", list);
            RequestDispatcher rd = request.getRequestDispatcher("AdminPage.jsp");
            rd.forward(request, response);
        }
    }
}

