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
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

/**
 *
 * @author ASUS
 */
@Entity
public class cartItem implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private int quantity;
    private int unitPrice;
    @OneToOne
    private product product;
    @ManyToOne
    private cart cart;

    public cartItem() {
    }

    public cartItem(int id, int quantity, int unitPrice, product product, cart cart) {
        super();
        this.id = id;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.product = product;
        this.cart = cart;
    }

    public cartItem(int quantity, int unitPrice, product product, cart cart) {
        super();
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.product = product;
        this.cart = cart;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public long getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(int unitPrice) {
        this.unitPrice = unitPrice;
    }

    public product getProduct() {
        return product;
    }

    public void setProduct(product product) {
        this.product = product;
    }

    public cart getCart() {
        return cart;
    }

    public void setCart(cart cart) {
        this.cart = cart;
    }
}
