/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Item;
import model.Order;
import model.Product;

/**
 *
 * @author tuant
 */
@WebServlet(name = "BuyServlet", urlPatterns = {"/buy"})
public class BuyServlet extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BuyServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BuyServlet at " + request.getContextPath() + "</h1>");
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
        String quantity_raw = request.getParameter("quantity");
        String id_raw = request.getParameter("id");
        
        if (quantity_raw != null) {
            int quantity, id;
            quantity = Integer.parseInt(quantity_raw);
            id = Integer.parseInt(id_raw);
            DAO d = new DAO();
            Product product = d.getProductsByPId(id);
            
            HttpSession session = request.getSession();

            if (session.getAttribute("order") == null) {
                Order order = new Order();
                List<Item> listItems = new ArrayList<>();
                Item item = new Item();
                item.setQuantity(quantity);
                item.setProduct(product);
                item.setPrice(product.getPrice());
                listItems.add(item);
                order.setItems(listItems);
                session.setAttribute("order", order);
            }else{
                Order order = (Order) session.getAttribute("order");
                List<Item> listItems = order.getItems();
                boolean check =false;
                for (Item item : listItems) {
                    if(item.getProduct().getId()==product.getId()){
                        item.setQuantity(item.getQuantity()+quantity);
                        check=true;
                    }
                }
                if(check==false){
                    Item item = new Item();
                    item.setQuantity(quantity);
                    item.setProduct(product);
                    item.setPrice(product.getPrice());
                    listItems.add(item);
                }
                int size = order.getItems().size();             
                session.setAttribute("size", size);
                session.setAttribute("order", order);
            }
        }
        
        request.getRequestDispatcher("home").forward(request, response);
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

        String quantity_raw = request.getParameter("num");
        String id_raw = request.getParameter("id");
        
        if (quantity_raw != null) {
            int quantity, id;
            quantity = Integer.parseInt(quantity_raw);
            id = Integer.parseInt(id_raw);
            DAO d = new DAO();
            Product product = d.getProductsByPId(id);
            
            HttpSession session = request.getSession();

            if (session.getAttribute("order") == null) {
                Order order = new Order();
                List<Item> listItems = new ArrayList<>();
                Item item = new Item();
                item.setQuantity(quantity);
                item.setProduct(product);
                item.setPrice(product.getPrice());
                listItems.add(item);
                order.setItems(listItems);
                session.setAttribute("order", order);
            }else{
                Order order = (Order) session.getAttribute("order");
                List<Item> listItems = order.getItems();
                boolean check =false;
                for (Item item : listItems) {
                    if(item.getProduct().getId()==product.getId()){
                        item.setQuantity(item.getQuantity()+quantity);
                        check=true;
                    }
                }
                if(check==false){
                    Item item = new Item();
                    item.setQuantity(quantity);
                    item.setProduct(product);
                    item.setPrice(product.getPrice());
                    listItems.add(item);
                }
                int size = order.getItems().size();             
                session.setAttribute("size", size);
                session.setAttribute("order", order);
            }
        }
        
        request.getRequestDispatcher("home").forward(request, response);
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
