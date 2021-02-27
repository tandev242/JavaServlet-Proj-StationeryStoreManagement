/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

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
@WebServlet(urlPatterns = "/waiting")
public class waitingController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if(session != null && session.getAttribute("account") != null){
            userInfo u = (userInfo)session.getAttribute("account");
            request.setAttribute("UserName", u.getUserName());
            if(u.getRole()==1){
                response.sendRedirect(request.getContextPath() + "/admin/welcome");
            }
            else{
                response.sendRedirect(request.getContextPath() + "/welcome");
            }
        }    
    }


}
