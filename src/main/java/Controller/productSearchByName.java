/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.productDAO;
import DAO.subCategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(urlPatterns = "/products/search")
public class productSearchByName extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String name = req.getParameter("Name");
        List<product> listPro = productDAO.searchByText(name);
        req.setAttribute("listPro", listPro);
//        subCategory subCat = subCategoryDAO.get(Integer.parseInt(id));
//        req.setAttribute("subCat", subCat);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/Menu/FinalProject/views/user/products_searchbyname.jsp");
        dispatcher.forward(req, resp);;
    }
}
