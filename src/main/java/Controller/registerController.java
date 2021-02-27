/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.userInfoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import static model.Hash.getHash;
import util.Constant;

/**
 *
 * @author Minh Hoang
 */
@WebServlet(urlPatterns = "/register")
public class registerController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("utf-8");
        PrintWriter out = resp.getWriter();
        HttpSession session = req.getSession(false);
        if (session != null && session.getAttribute("UserName") != null) {
            //Cần sửa chỗ này
            resp.sendRedirect(req.getContextPath() + "/admin/welcome");
            return;
            //
        }
        // Check cookie
        Cookie[] cookies = req.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("UserName")) {
                    session = req.getSession(true);
                    session.setAttribute("UserName", cookie.getValue());
                    resp.sendRedirect(req.getContextPath() + "/admin/welcome");
                    return;
                }
            }
        }
        req.getRequestDispatcher(Constant.Path.REGISTER).forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("utf-8");
        String username = req.getParameter("UserName");
        String password = req.getParameter("Password");
        String firstname = req.getParameter("FirstName");
        String lastname = req.getParameter("LastName");
        String address = req.getParameter("Address");
        String email = req.getParameter("Email");
        String phone = req.getParameter("Phone");
        userInfoDAO service = new userInfoDAO();
        String alertMsg = "";
        if (service.checkExistEmail(email)) {
            alertMsg = "Email already exist!";
            req.setAttribute("alert", alertMsg);
            req.getRequestDispatcher(Constant.Path.REGISTER).forward(req, resp);
            return;
        }
        if (service.checkExistUsername(username)) {
            alertMsg = "Username already exist!";
            req.setAttribute("alert", alertMsg);
            req.getRequestDispatcher(Constant.Path.REGISTER).forward(req, resp);
            return;
        }
        password = getHash(password);
        boolean isSuccess = service.register(username, password, firstname, lastname, address, email, phone);
        if (isSuccess) {
//			SendMail sm= new SendMail();
//			sm.sendMail(email, "UNIFY", "Welcome to UNIFY. Please Login to use service. Thanks !");
//			req.setAttribute("alert", alertMsg);

            resp.sendRedirect(req.getContextPath() + "/login");
        } else {
            alertMsg = "System error!";
            req.setAttribute("alert", alertMsg);
            req.getRequestDispatcher(Constant.Path.REGISTER).forward(req, resp);
        }
    }
}
