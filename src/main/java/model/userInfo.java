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
public class userInfo implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int UserID;
    private String UserName;
    private String Password;
    private String FirstName;
    private String LastName; 
    private String Address;
    private String Email;
    private String Phone;
    private String Image;
    private int Role;

    public userInfo() {
        super();
    }

    public userInfo(int UserID, String UserName, String Password, String FirstName, String LastName, String Address, String Email, String Phone, int Role) {
        this.UserID = UserID;
        this.UserName = UserName;
        this.Password = Password;
        this.FirstName = FirstName;
        this.LastName = LastName;
        this.Address = Address;
        this.Email = Email;
        this.Phone = Phone;
        this.Role = Role;
    }

    public userInfo(int UserID, String FirstName, String LastName, String Address, String Phone) {
        this.UserID = UserID;
        this.FirstName = FirstName;
        this.LastName = LastName;
        this.Address = Address;
        this.Phone = Phone;
    }


    public userInfo(int UserID, String UserName, String Password, String FirstName, String LastName, String Address, String Email, String Phone, String Image, int Role) {
        this.UserID = UserID;
        this.UserName = UserName;
        this.Password = Password;
        this.FirstName = FirstName;
        this.LastName = LastName;
        this.Address = Address;
        this.Email = Email;
        this.Phone = Phone;
        this.Image = Image;
        this.Role = Role;
    }
    
    public userInfo(String UserName, String Password, String FirstName, String LastName, String Address, String Email, String Phone){
        this.UserName = UserName;
        this.Password = Password;
        this.FirstName = FirstName;
        this.LastName = LastName;
        this.Address = Address;
        this.Email = Email;
        this.Phone = Phone;
    }
    
    public userInfo(String UserName, String Password, String FirstName, String LastName, String Address, String Email, String Phone, int Role){
        this.UserName = UserName;
        this.Password = Password;
        this.FirstName = FirstName;
        this.LastName = LastName;
        this.Address = Address;
        this.Email = Email;
        this.Phone = Phone;
        this.Role = Role;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String UserName) {
        this.UserName = UserName;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getFirstName() {
        return FirstName;
    }

    public void setFirstName(String FirstName) {
        this.FirstName = FirstName;
    }

    public String getLastName() {
        return LastName;
    }

    public void setLastName(String LastName) {
        this.LastName = LastName;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public String getImage() {
        return Image;
    }

    public void setImage(String Image) {
        this.Image = Image;
    }
    
    public int getRole(){
        return Role;
    }
    
    public void setRole(int Role){
        this.Role = Role;
    }
    
}
