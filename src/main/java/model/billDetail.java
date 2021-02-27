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
/**
 *
 * @author ASUS
 */
@Entity
public class billDetail implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int ID;
    private int IDBill;
    private int IDProduct;
    private int UserID;
    private Boolean Status;
    private int Amount;
    private String Description;
    private int Quantity;

    public billDetail() {
    }

    public billDetail(int ID, int IDBill, int IDProduct, int UserID, Boolean Status, int Amount, String Description, int Quantity) {
        this.ID = ID;
        this.IDBill = IDBill;
        this.IDProduct = IDProduct;
        this.UserID = UserID;
        this.Status = Status;
        this.Amount = Amount;
        this.Description = Description;
        this.Quantity = Quantity;
    }

    public billDetail(int IDBill, int IDProduct, int UserID, Boolean Status, int Amount, String Description, int Quantity) {
        this.IDBill = IDBill;
        this.IDProduct = IDProduct;
        this.UserID = UserID;
        this.Status = Status;
        this.Amount = Amount;
        this.Description = Description;
        this.Quantity = Quantity;
    }
    
    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public int getIDBill() {
        return IDBill;
    }

    public void setIDBill(int IDBill) {
        this.IDBill = IDBill;
    }

    public int getIDProduct() {
        return IDProduct;
    }

    public void setIDProduct(int IDProduct) {
        this.IDProduct = IDProduct;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public Boolean getStatus() {
        return Status;
    }

    public void setStatus(Boolean Status) {
        this.Status = Status;
    }

    public int getAmount() {
        return Amount;
    }

    public void setAmount(int Amount) {
        this.Amount = Amount;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }
    
}
