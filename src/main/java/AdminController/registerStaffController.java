/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AdminController;

import DAO.userInfoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static model.Hash.getHash;
import util.Constant;

/**
 *
 * @author Minh Hoang
 */
@WebServlet(urlPatterns = "/admin/registerStaff")
public class registerStaffController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        req.getRequestDispatcher("/Menu/FinalProject/views/admin/registerStaff.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
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
            req.getRequestDispatcher("/Menu/FinalProject/views/admin/registerStaff.jsp").forward(req, resp);
            return;
        }
        if (service.checkExistUsername(username)) {
            alertMsg = "Username already exist!";
            req.setAttribute("alert", alertMsg);
            req.getRequestDispatcher("/Menu/FinalProject/views/admin/registerStaff.jsp").forward(req, resp);
            return;
        }
        password = getHash(password);
        boolean isSuccess = service.registerStaff(username, password, firstname, lastname, address, email, phone);
        if (isSuccess) {
//			SendMail sm= new SendMail();
//			sm.sendMail(email, "UNIFY", "Welcome to UNIFY. Please Login to use service. Thanks !");
//			req.setAttribute("alert", alertMsg);

            resp.sendRedirect(req.getContextPath() + "/login");
        } else {
            alertMsg = "System error!";
            req.setAttribute("alert", alertMsg);
            req.getRequestDispatcher("/Menu/FinalProject/views/admin/registerStaff.jsp").forward(req, resp);
        }
    }
}
