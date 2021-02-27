/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AdminController;

import DAO.userInfoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.userInfo;

/**
 *
 * @author Minh Hoang
 */
@WebServlet(urlPatterns="/admin/staff")
public class ManagerStaffController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        List<userInfo> User = userInfoDAO.getAll();
        request.setAttribute("user", User);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Menu/FinalProject/views/admin/staff.jsp");
        dispatcher.forward(request, response);
    }
}
