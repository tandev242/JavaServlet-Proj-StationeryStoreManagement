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
public class subCategory implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
     private int ID;
    private String NameSubCategory;
    private int IDCategory;

    public subCategory() {
    }

    public subCategory(int ID, String NameSubCategory, int IDCategory) {
        this.ID = ID;
        this.NameSubCategory = NameSubCategory;
        this.IDCategory = IDCategory;
    }
    
    public subCategory(String NameSubCategory, int IDCategory) {
        this.NameSubCategory = NameSubCategory;
        this.IDCategory = IDCategory;
    }
    
     public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getNameSubCategory() {
        return NameSubCategory;
    }

    public void setNameSubCategory(String NameSubCategory) {
        this.NameSubCategory = NameSubCategory;
    }

    public int getIDCategory() {
        return IDCategory;
    }

    public void setIDCategory(int IDCategory) {
        this.IDCategory = IDCategory;
    }
    
}
