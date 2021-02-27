/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author ASUS
 */
@Entity
public class inventory implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int IDProduct;
    private int IDSubCategory;
    private int PriceBuy;
    private int Quantity;

    public inventory() {
    }

    public inventory(int IDProduct, int IDSubCategory, int PriceBuy, int Quantity) {
        this.IDProduct = IDProduct;
        this.IDSubCategory = IDSubCategory;
        this.PriceBuy = PriceBuy;
        this.Quantity = Quantity;
    }

    public inventory(int IDProduct, int Quantity) {
        this.IDProduct = IDProduct;
        this.Quantity = Quantity;
    }

    public int getIDProduct() {
        return IDProduct;
    }

    public void setIDProduct(int IDProduct) {
        this.IDProduct = IDProduct;
    }

    public int getIDSubCategory() {
        return IDSubCategory;
    }

    public void setIDSubCategory(int IDSubCategory) {
        this.IDSubCategory = IDSubCategory;
    }

    public int getPriceBuy() {
        return PriceBuy;
    }

    public void setPriceBuy(int PriceBuy) {
        this.PriceBuy = PriceBuy;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }
}
