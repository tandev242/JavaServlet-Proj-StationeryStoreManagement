/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package json;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import javax.servlet.annotation.WebServlet;
import json.DAO.quantityDAO;

/**
 *
 * @author Minh Hoang
 */
@WebServlet("/admin/jsonQuantity")
public class jsonQuantity extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        quantityDAO jsonQuantity = new quantityDAO();
        Gson gson = new Gson();
        String json = gson.toJson(jsonQuantity.getAll());
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.println(json);
    }
}
