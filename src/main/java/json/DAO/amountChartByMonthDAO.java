/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package json.DAO;

import java.util.ArrayList;
import java.util.List;
import json.model.amountChartByMonth;

/**
 *
 * @author Minh Hoang
 */
public class amountChartByMonthDAO {

    public static List<amountChartByMonth> getAll() {
        List<amountChartByMonth> list = new ArrayList<amountChartByMonth>();
        for(long i = 1; i <= 12; i++)
        {
            amountChartByMonth amount = new amountChartByMonth(DAO.billDetailDAO.getAmountByMonth(i),i);
            list.add(amount);
        }
        return list;
    }
}
