/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.cartItem;

/**
 *
 * @author ASUS
 */
@WebServlet(urlPatterns = {"/cart/remove"})
public class cartRemoveController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = resp.getWriter()) {
            HttpSession httpSession = req.getSession();
            Object obj = httpSession.getAttribute("cart");// Doc tu Session ra
            String pId = req.getParameter("ID");
            if (obj != null) {
                Map<Integer, cartItem> map = (Map<Integer, cartItem>) obj; // ep ve kieu cua no
                // Xoa san pham trong map
                map.remove(Integer.parseInt(pId));

                // Cap nhat lai Session
                httpSession.setAttribute("cart", map);
            }
            resp.sendRedirect(req.getContextPath() + "/cart");
        }
    }
}