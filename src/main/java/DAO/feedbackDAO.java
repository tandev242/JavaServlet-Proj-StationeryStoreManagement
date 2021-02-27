/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;


import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import model.feedback;
import util.DBUtil;

/**
 *
 * @author ASUS
 */
public class feedbackDAO {

    public static List<feedback> getAll() {
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        String qString = "SELECT i FROM feedback i";
        TypedQuery<feedback> q = em.createQuery(qString, feedback.class);
        List<feedback> list;
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

    public static List<feedback> getListFeedbackByProduct(int IDProduct) {
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        String qString = "SELECT i FROM feedback i where i.Product.ID = :id ";
        Query q = em.createQuery(qString);
        q.setParameter("id", IDProduct);
        List<feedback> list;
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
    public static List<feedback> getListFeedbackByUser(int UserID) {
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        String qString = "SELECT i FROM feedback i where i.Buyer.UserID = :id ";
        Query q = em.createQuery(qString);
        q.setParameter("id", UserID);
        List<feedback> list;
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
  
    public static void insert(feedback feedback) {
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.persist(feedback);
            trans.commit();
        } catch (Exception e) {
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static void edit(feedback feedback) {
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.merge(feedback);
            trans.commit();
        } catch (Exception e) {
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static void delete(feedback feedback) {
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.remove(em.merge(feedback));
            trans.commit();
        } catch (Exception e) {
            trans.rollback();
        } finally {
            em.close();
        }
    }   
//public static void main(String args[]) {
//
//        System.out.println(getListFeedbackByProduct(1).get(0).getComment());
//    }
}
