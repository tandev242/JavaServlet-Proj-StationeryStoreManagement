/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.cartDAO;
import DAO.cartItemDAO;
import java.io.IOException;

import model.userInfo;
import DAO.userInfoDAO;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import util.Constant;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import static model.Hash.getHash;
import model.cart;
import model.cartItem;

/**
 *
 * @author Minh Hoang
 */
@WebServlet(urlPatterns = "/login")
public class loginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session != null && session.getAttribute("account") != null) {
            resp.sendRedirect(req.getContextPath() + "/waiting");
            return;
        }
        // Check cookie
        Cookie[] cookies = req.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("UserName")) {
                    session = req.getSession(true);
                    session.setAttribute("UserName", cookie.getValue());
                    resp.sendRedirect(req.getContextPath() + "/waiting");
                    return;
                }
            }
        }
        req.getRequestDispatcher("/Menu/FinalProject/views/user/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("UserName");
        String password = req.getParameter("Password");
        boolean isRememberMe = false;
        String remember = req.getParameter("remember");
        if ("on".equals(remember)) {
            isRememberMe = true;
        }
        String alertMsg = "";
        if (username.isEmpty() || password.isEmpty()) {
            alertMsg = "Username and password can't be empty!";
            req.setAttribute("alert", alertMsg);
            req.getRequestDispatcher("/Menu/FinalProject/views/user/login.jsp").forward(req, resp);
            return;
        }
        password = getHash(password);
        userInfoDAO service = new userInfoDAO();
        userInfo user = service.login(username, password);
        if (user != null) {
            user = service.get(user.getUserName());
            HttpSession session = req.getSession(true);
            session.setAttribute("account", user);
            if (isRememberMe) {
                saveRemeberMe(resp, username);
            }
            if (cartDAO.getByUserID(user.getUserID()) == null) {
                long time = System.currentTimeMillis();
                cart cart = new cart();
                cart.setBuyer(user);
                cart.setBuyDate(new java.sql.Date(time));
                cartDAO.insert(cart);
                session.setAttribute("cartUser", cart);
            } else {
                session.setAttribute("cartUser", cartDAO.getByUserID(user.getUserID()));
            }
            if (cartItemDAO.getAllByCartUserID(user.getUserID()) != null) {
                List<cartItem> listCartItem = cartItemDAO.getAllByCartUserID(user.getUserID());
                Map<Integer, cartItem> map = new HashMap<Integer, cartItem>();
                for (cartItem item : listCartItem) {
                    map.put(item.getProduct().getID(), item);
                }
                session.setAttribute("cart", map);
            }
            resp.sendRedirect(req.getContextPath() + "/waiting");
        } else {
            alertMsg = "Username or password isn't correct";
            req.setAttribute("alert", alertMsg);
            req.getRequestDispatcher("/Menu/FinalProject/views/user/login.jsp").forward(req, resp);
        }
    }

    private void saveRemeberMe(HttpServletResponse response, String username) {
        Cookie cookie = new Cookie(Constant.COOKIE_REMEMBER, username);
        cookie.setMaxAge(30 * 60);
        response.addCookie(cookie);
    }
}
