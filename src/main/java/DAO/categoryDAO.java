/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import model.category;
import util.DBUtil;

/**
 *
 * @author ASUS
 */
public class categoryDAO {

    public static List<category> getAll() {
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        String qString = "SELECT i FROM category i";
        TypedQuery<category> q = em.createQuery(qString, category.class);
        List<category> list;
        try {
            list = q.getResultList();
            if (list == null || list.isEmpty()) {
                list = null;
            }
        } finally {
            em.close();
        }
        return list;
    } 
    public static int getCateIDbyCateName(String cate) {
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        String qString = "SELECT i FROM category i where i.NameCategory = :NameCategory ";
        Query q = em.createQuery(qString);
        q.setParameter("NameCategory", cate);
        category categoryID = null;
        try {
            categoryID = (category) q.getSingleResult();
        } catch (NoResultException e) {

        } finally {
            em.close();
        }
        return categoryID.getID();
    }
    
    public static String getCateNamebyCateID(int id) {
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        String qString = "SELECT i FROM category i where i.ID = :ID ";
        Query q = em.createQuery(qString);
        q.setParameter("ID", id);
        category categoryName = null;
        try {
            categoryName = (category) q.getSingleResult();
        } catch (NoResultException e) {

        } finally {
            em.close();
        }
        return categoryName.getNameCategory();
    }
//        
//    public static void main(String args[]) {
//        System.out.println(getAll().get(0).getNameCategory());
//    }
}
