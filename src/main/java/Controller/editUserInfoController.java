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
import model.userInfo;
import util.Constant;
import util.sendMail;

/**
 *
 * @author ASUS
 */
@WebServlet(urlPatterns = "/edit")
public class editUserInfoController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("utf-8");
        HttpSession httpSession = req.getSession();
        Object obj = httpSession.getAttribute("account");
        userInfo info = (userInfo) obj;

        int id = info.getUserID();
        String oldpw = req.getParameter("OldPw");
        oldpw = getHash(oldpw);
        String password = req.getParameter("Password");
        String confirm = req.getParameter("Confirm");
        String alertMsg = "";
        if (oldpw.equals(info.getPassword()) || password.equals(confirm)) {
            password = getHash(password);
            alertMsg = "Cập nhật mật khẩu thành công";
//        password = getHash(password);
            boolean isSuccess = userInfoDAO.update(id, password);
            if (isSuccess) {
                sendMail.sendMail(info.getEmail(), "HKTT", "Your Password has been changed !");
                httpSession.setAttribute("alert", alertMsg);
                httpSession.setAttribute("account", userInfoDAO.get(id));
                resp.sendRedirect(req.getContextPath() + Constant.Path.MYACCOUNT);
            } else {
                alertMsg = "Đã có lỗi xảy ra !";
                httpSession.setAttribute("alert", alertMsg);
                resp.sendRedirect(req.getContextPath() + Constant.Path.MYACCOUNT);
            }
        }
        else {
                alertMsg = "Mật khẩu cũ hay xác nhận mật khẩu đúng  !";
                httpSession.setAttribute("alert", alertMsg);
                resp.sendRedirect(req.getContextPath() + Constant.Path.MYACCOUNT);
        }
        
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("utf-8");
        HttpSession httpSession = req.getSession();
        Object obj = httpSession.getAttribute("account");
        userInfo info = (userInfo) obj;

        int id = info.getUserID();
        String username = req.getParameter("UserName");
        String password = req.getParameter("Password");
        String firstname = req.getParameter("FirstName");
        String lastname = req.getParameter("LastName");
        String address = req.getParameter("Address");
        String email = req.getParameter("Email");
        String phone = req.getParameter("Phone");
        String alertMsg = "Cập nhật thông tin thành công";
//        password = getHash(password);
        boolean isSuccess = userInfoDAO.update(id, firstname, lastname, address, phone);
        if (isSuccess) {
            sendMail.sendMail(email, "HKTT", "Your information has been changed !");
            httpSession.setAttribute("alert", alertMsg);
            httpSession.setAttribute("account", userInfoDAO.get(id));
            resp.sendRedirect(req.getContextPath() + Constant.Path.MYACCOUNT);
        } else {
            alertMsg = "Đã có lỗi xảy ra !";
            httpSession.setAttribute("alert", alertMsg);
            resp.sendRedirect(req.getContextPath() + Constant.Path.MYACCOUNT);
        }
    }
}
