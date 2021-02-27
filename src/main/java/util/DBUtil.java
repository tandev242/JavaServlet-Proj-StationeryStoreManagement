/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author ASUS
 */
public class DBUtil {
    private static final EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPA_VPP");
    public static EntityManagerFactory getEntityManagerFactory()
    {
        return emf;
    }
//    public static void main(String args[]) {
//        if(getEntityManagerFactory() != null)
//        {
//            System.out.println("thanh cong");
//            
//        }
//        else
//            System.out.println("fail");
//    }
}
