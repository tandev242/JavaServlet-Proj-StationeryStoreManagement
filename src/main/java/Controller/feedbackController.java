/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.feedbackDAO;
import DAO.productDAO;
import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.feedback;
import model.product;
import model.userInfo;

/**
 *
 * @author ASUS
 */
@WebServlet(urlPatterns = "/feedback")
public class feedbackController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("utf-8");

    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("utf-8");
        Date createdDate = new Date(System.currentTimeMillis());
        String id = req.getParameter("idPro");
        String comment = req.getParameter("comment");
        product product = productDAO.get(Integer.parseInt(id));
        HttpSession httpSession = req.getSession();
        Object obj = httpSession.getAttribute("account");
        if(obj == null)
            resp.sendRedirect(req.getContextPath() + "/login");
        else
        {
            userInfo info = (userInfo)obj;
            feedback fb = new feedback(product, info, comment, createdDate);
            feedbackDAO.insert(fb);
            resp.sendRedirect(req.getContextPath() + "/product/detail?id=" +id);
        }
    }

}
