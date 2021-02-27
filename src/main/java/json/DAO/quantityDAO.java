/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package json.DAO;

import java.util.ArrayList;
import java.util.List;
import json.model.quantityChart;

/**
 *
 * @author Minh Hoang
 */
public class quantityDAO {   
    public static List<quantityChart> getAll() {
        List<quantityChart> list = new ArrayList<quantityChart>();
        for (int i = 1; i <= DAO.categoryDAO.getAll().size(); i++) {
            quantityChart chart = new quantityChart();
            chart.setCateName(DAO.categoryDAO.getCateNamebyCateID(i));
            chart.setQuantity(DAO.billDetailDAO.getQuantityByIdCategory(i));
            list.add(chart);
        }
        return list;
    }
}
