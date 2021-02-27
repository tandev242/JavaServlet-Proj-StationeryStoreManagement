/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package json.model;

/**
 *
 * @author Minh Hoang
 */
public class quantityChart {

    private String CateName;
    private long Quantity;

    public quantityChart() {
        super();
    }

    public quantityChart(String CateName, long Quantity) {
        super();
        this.CateName = CateName;
        this.Quantity = Quantity;
    }

    public String getCateName() {
        return CateName;
    }

    public long getQuantity() {
        return Quantity;
    }

    public void setCateName(String CateName) {
        this.CateName = CateName;
    }

    public void setQuantity(long Quantity) {
        this.Quantity = Quantity;
    }
}
