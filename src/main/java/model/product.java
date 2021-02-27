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
 * @author ASUS
 */
@Entity
public class product implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int ID;
    private int IDSubCategory;
    private String Name;
    private String Description;
    private String Image;
    private int Price;
    private int PromotionPrice;    
    private Date CreatedDate;
    private String CreatedBy;

    public product() {
    }

    public product(int ID, int IDSubCategory, String Name, String Description, String Image, int Price, int PromotionPrice, Date CreatedDate, String CreatedBy) {
        this.ID = ID;
        this.IDSubCategory = IDSubCategory;
        this.Name = Name;
        this.Description = Description;
        this.Image = Image;
        this.Price = Price;
        this.PromotionPrice = PromotionPrice;
        this.CreatedDate = CreatedDate;
        this.CreatedBy = CreatedBy;
    }
    
    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public int getIDSubCategory() {
        return IDSubCategory;
    }

    public void setIDSubCategory(int IDSubCategory) {
        this.IDSubCategory = IDSubCategory;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public String getImage() {
        return Image;
    }

    public void setImage(String Image) {
        this.Image = Image;
    }

    public int getPrice() {
        return Price;
    }

    public void setPrice(int Price) {
        this.Price = Price;
    }

    public int getPromotionPrice() {
        return PromotionPrice;
    }

    public void setPromotionPrice(int PromotionPrice) {
        this.PromotionPrice = PromotionPrice;
    }

    public Date getCreatedDate() {
        return CreatedDate;
    }

    public void setCreatedDate(Date CreatedDate) {
        this.CreatedDate = CreatedDate;
    }

    public String getCreatedBy() {
        return CreatedBy;
    }

    public void setCreatedBy(String CreatedBy) {
        this.CreatedBy = CreatedBy;
    }

}
