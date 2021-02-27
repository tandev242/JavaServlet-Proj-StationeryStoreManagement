/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AdminController;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.userInfo;

/**
 *
 * @author Minh Hoang
 */
@WebServlet(urlPatterns = "/admin/welcome")
public class AdminHomeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("account");
        userInfo user = (userInfo)obj;
        if(user != null)
        {
            if(user.getRole() == 1)
            {
                session.setAttribute("account",user);
                request.getRequestDispatcher("/Menu/FinalProject/views/admin/dashboard.jsp").forward(request,response);
            }
            else
            {
                response.sendRedirect(request.getContextPath() + "/logout");
            }
        }
        else
        {
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }
}
