/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.billDAO;
import DAO.billDetailDAO;
import DAO.cartItemDAO;
import DAO.inventoryDAO;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.bill;
import model.billDetail;
import model.cartItem;
import model.inventory;
import model.userInfo;
import util.sendMail;

/**
 *
 * @author ASUS
 */
@WebServlet(urlPatterns = "/pay")
public class orderController extends HttpServlet {

    long time = System.currentTimeMillis();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Object obj = session.getAttribute("account");
        userInfo buyer = (userInfo) obj;
        bill Bill = new bill();
        Bill.setCreatedDate(LocalDateTime.now());
        Bill.setConfirmed(true);
        Object objCart = session.getAttribute("cart");
        if (objCart != null && obj != null) {
            // neu co cart thi insert vao
            billDAO.insert(Bill);
            // ep ve dung kieu cua no khi them vao o phan them vao gio hang controller
            Map<Integer, cartItem> map = (Map<Integer, cartItem>) objCart;

            for (cartItem cartItem : map.values()) {
                billDetail bd = new billDetail();
                bd.setIDBill(Bill.getID());
                bd.setIDProduct(cartItem.getProduct().getID());
                bd.setQuantity(cartItem.getQuantity());
                bd.setUserID(buyer.getUserID());
                bd.setAmount((int) (cartItem.getQuantity() * cartItem.getUnitPrice() - cartItem.getQuantity() * cartItem.getProduct().getPromotionPrice()));
                bd.setStatus(true);
                bd.setDescription("Đã thanh toán vào lúc " + LocalDateTime.now().toString());
                billDetailDAO.insert(bd);
                cartItemDAO.delete(cartItem);
                inventory inv = inventoryDAO.get(cartItem.getProduct().getID());
                inv.setQuantity(inv.getQuantity() - cartItem.getQuantity());
                inventoryDAO.edit(inv);
            }
            session.removeAttribute("cart");
            sendMail.sendMail(buyer.getEmail(), "HKTT VPP :", "Cam on ban da mua hang tai HKTT VPP");
            session.setAttribute("alert", "Thanh toán đơn hàng thành công !");
            resp.sendRedirect(req.getContextPath() + "/cart");
        } else if (objCart == null && obj != null) {
            session.setAttribute("alert", "Không có sản phẩm nào trong giỏ hàng !");
            resp.sendRedirect(req.getContextPath() + "/cart");
        } else {
            resp.sendRedirect(req.getContextPath() + "/login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
