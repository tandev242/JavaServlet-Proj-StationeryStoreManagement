/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.sql.Date;
import java.time.LocalDateTime;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author ASUS
 */
@Entity
public class bill implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int ID;
    private Boolean Confirmed;
    private Boolean Completed; 
    private Boolean Canceled;
    private LocalDateTime CreatedDate;

    public bill() {
    }

    public bill(int ID, Boolean Confirmed, Boolean Completed, Boolean Canceled, LocalDateTime CreatedDate) {
        this.ID = ID;
        this.Confirmed = Confirmed;
        this.Completed = Completed;
        this.Canceled = Canceled;
        this.CreatedDate = CreatedDate;
    }
    
    public bill( Boolean Confirmed, Boolean Completed, Boolean Canceled, LocalDateTime CreatedDate) {
        this.Confirmed = Confirmed;
        this.Completed = Completed;
        this.Canceled = Canceled;
        this.CreatedDate = CreatedDate;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public Boolean getConfirmed() {
        return Confirmed;
    }

    public void setConfirmed(Boolean Confirmed) {
        this.Confirmed = Confirmed;
    }

    public Boolean getCompleted() {
        return Completed;
    }

    public void setCompleted(Boolean Completed) {
        this.Completed = Completed;
    }

    public Boolean getCanceled() {
        return Canceled;
    }

    public void setCanceled(Boolean Canceled) {
        this.Canceled = Canceled;
    }

    public LocalDateTime getCreatedDate() {
        return CreatedDate;
    }

    public void setCreatedDate(LocalDateTime CreatedDate) {
        this.CreatedDate = CreatedDate;
    }
}
