/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.billDetailDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.billDetail;
import model.userInfo;

/**
 *
 * @author ASUS
 */
@WebServlet(urlPatterns = {"/myOrder"})
public class myOrderController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession httpSession = req.getSession();
        Object obj = httpSession.getAttribute("account");
        userInfo info = (userInfo)obj;
        List<billDetail> bd = billDetailDAO.getBillDetailByIdUser(info.getUserID());
        req.setAttribute("listBD", bd);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/Menu/FinalProject/views/user/my_order.jsp");
        dispatcher.forward(req, resp);
    }
}
