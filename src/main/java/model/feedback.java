/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.sql.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

/**
 *
 * @author maikh
 */
@Entity
public class feedback implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int ID;
    @OneToOne
    private product Product;
    @OneToOne
    private userInfo Buyer;
    private String Comment;
    private Date CreatedDate;
    

    public feedback() {
    }

    public feedback(int ID, product Product, userInfo Buyer, String Comment, Date CreatedDate) {
        this.ID = ID;
        this.Product = Product;
        this.Buyer = Buyer;
        this.Comment = Comment;
        this.CreatedDate = CreatedDate;
    }

    public feedback(product Product, userInfo Buyer, String Comment, Date CreatedDate) {
        this.Product = Product;
        this.Buyer = Buyer;
        this.Comment = Comment;
        this.CreatedDate = CreatedDate;
    }
    
    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }
    
    public void setProduct(product Product) {
        this.Product = Product;
    }
    public product getProduct() {
        return Product;
    }

    public void setBuyer(userInfo Buyer) {
        this.Buyer = Buyer;
    }
    public userInfo getBuyer() {
        return Buyer;
    }


    public String getComment() {
        return Comment;
    }

    public void setComment(String Comment) {
        this.Comment = Comment;
    }


    public Date getCreatedDate() {
        return CreatedDate;
    }

    public void setCreatedDate(Date CreatedDate) {
        this.CreatedDate = CreatedDate;
    }

}