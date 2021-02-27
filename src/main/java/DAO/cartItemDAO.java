/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;
import model.cartItem;
import util.DBUtil;

/**
 *
 * @author ASUS
 */
public class cartItemDAO {

    public static List<cartItem> getAll() {
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        String qString = "SELECT i from cartItem i ";
        TypedQuery<cartItem> q = em.createQuery(qString, cartItem.class);
        List<cartItem> list;
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

    public static List<cartItem> getAllByCartUserID(int id) {
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        String qString = "SELECT i from cartItem i WHERE i.cart.buyer.UserID = :id";
        TypedQuery<cartItem> q = em.createQuery(qString, cartItem.class);
        q.setParameter("id", id);
        List<cartItem> list;
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
    
    public static cartItem get(int id) {
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        try {
            cartItem cart = em.find(cartItem.class, id);
            return cart;
        } finally {
            em.close();
        }
    }

    public static void insert(cartItem cartItem) {
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.persist(cartItem);
            trans.commit();
        } catch (Exception e) {
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static void edit(cartItem cartItem) {
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.merge(cartItem);
            trans.commit();
        } catch (Exception e) {
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static void delete(cartItem cartItem) {

        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.remove(em.merge(cartItem));
            trans.commit();
        } catch (Exception e) {
            trans.rollback();
        } finally {
            em.close();
        }
    }
//  public static void main(String[] args) {
//      System.out.println(getAllByCartUserID(51).get(0).getCart().getBuyer().getLastName());
//    }

}
