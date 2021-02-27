/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.categoryDAO;
import DAO.feedbackDAO;
import DAO.inventoryDAO;
import DAO.productDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.category;
import model.feedback;
import model.product;
/**
 *
 * @author ASUS
 */
@WebServlet(urlPatterns = "/product/detail")
public class productDetailController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String id = req.getParameter("id");
        product product = productDAO.get(Integer.parseInt(id));
        List<category> category = categoryDAO.getAll();
        List<product> listPro = productDAO.getAllByIdSubCategory(product.getIDSubCategory());
        int quantity = inventoryDAO.get(Integer.parseInt(id)).getQuantity();
        List<feedback> listFb = feedbackDAO.getListFeedbackByProduct(Integer.parseInt(id));
        req.setAttribute("category", category);
        req.setAttribute("listPro", listPro);
        req.setAttribute("product", product);
        req.setAttribute("quantity", quantity);
        req.setAttribute("listFeedback", listFb);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/Menu/FinalProject/views/user/product_details.jsp");
        dispatcher.forward(req, resp);
    }
}