/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.cartItemDAO;
import DAO.productDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.cart;
import model.cartItem;
import model.product;

/**
 *
 * @author ASUS
 */
@WebServlet(urlPatterns = {"/cart/add"})
public class cartAddController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pId = req.getParameter("id"); // get id product
        String quantity = req.getParameter("quantity");
        product product = productDAO.get(Integer.parseInt(pId));
        HttpSession httpSession = req.getSession();
        Object obj = httpSession.getAttribute("cart");
        Object cartUser = httpSession.getAttribute("cartUser");
        cartItem cartItem = new cartItem();
        cartItem.setQuantity(Integer.parseInt(quantity));
        cartItem.setUnitPrice(product.getPrice());
        cartItem.setCart((cart) cartUser);
        cartItem.setProduct(product);
        if (obj == null) {
            Map<Integer, cartItem> map = new HashMap<Integer, cartItem>();
            map.put(cartItem.getProduct().getID(), cartItem);
            httpSession.setAttribute("cart", map);
            if (httpSession.getAttribute("account") != null) {
                cartItemDAO.insert(cartItem);
            }
        } else {
            Map<Integer, cartItem> map = (Map<Integer, cartItem>) obj;

            cartItem existedCartItem = map.get(Integer.valueOf(pId));

            if (existedCartItem == null) {
                map.put(product.getID(), cartItem);
                if (httpSession.getAttribute("account") != null) {
                    cartItemDAO.insert(cartItem);
                }
            } else {
                existedCartItem.setQuantity(existedCartItem.getQuantity() + Integer.parseInt(quantity));
                if (existedCartItem.getQuantity() == 0) {
                    existedCartItem.setQuantity(1);
                }
                if (httpSession.getAttribute("account") != null) {
                    cartItemDAO.edit(existedCartItem);
                }
            }

            httpSession.setAttribute("cart", map);
        }
        resp.sendRedirect(req.getContextPath() + "/cart");
    }
}
