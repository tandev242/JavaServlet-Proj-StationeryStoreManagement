/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package json;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import json.DAO.amountChartByMonthDAO;

/**
 *
 * @author Minh Hoang
 */
@WebServlet("/admin/jsonAmountByMonth")
public class jsonAmountByMonth extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        amountChartByMonthDAO jsonAmount = new amountChartByMonthDAO();
        Gson gson = new Gson();
        String json = gson.toJson(jsonAmount.getAll());
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.println(json);
    }
}
