/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.billDAO;
import DAO.billDetailDAO;
import DAO.cartItemDAO;
import DAO.inventoryDAO;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.bill;
import model.billDetail;
import model.cartItem;
import model.inventory;
import model.userInfo;
import util.sendMail;

/**
 *
 * @author ASUS
 */
@WebServlet(urlPatterns = "/payment")
public class paymentController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        session.setAttribute("alert", "Phương thức thanh toán chưa hỗ trợ");
        resp.sendRedirect(req.getContextPath() + "/cart");
    }
}
