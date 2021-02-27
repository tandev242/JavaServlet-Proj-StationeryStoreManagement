/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.productDAO;
import DAO.subCategoryDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.product;
import model.subCategory;

/**
 *
 * @author ASUS
 */
@WebServlet(urlPatterns = "/products")
public class productsController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String id = req.getParameter("idSub");
        subCategory subCat = subCategoryDAO.get(Integer.parseInt(id));
        List<product> listPro = productDAO.getAllByIdSubCategory(Integer.parseInt(id));
        req.setAttribute("listPro", listPro);
        req.setAttribute("subCat", subCat);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/Menu/FinalProject/views/user/products.jsp");
        dispatcher.forward(req, resp);
    }
}
