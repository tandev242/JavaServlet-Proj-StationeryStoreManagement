/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import model.cart;
import util.DBUtil;
/**
 *
 * @author ASUS
 */
public class cartDAO {

    public static List<cart> search(String email) {
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        String qString = "SELECT i FROM cart i where buyer.ID = :email ";
        TypedQuery<cart> q = em.createQuery(qString, cart.class);
        q.setParameter("email", email);
        List<cart> list;
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
    public static List<cart> getAll() {
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        String qString = "SELECT i from cart i ";
        TypedQuery<cart> q = em.createQuery(qString, cart.class);
        List<cart> list;
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

    public static void insert(cart cart) {
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.persist(cart);
            trans.commit();
        } catch (Exception e) {
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static cart get(int id) {
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        try {
            cart cart = em.find(cart.class, id);
            return cart;
        } finally {
            em.close();
        }
    }
    
    public static cart getByUserID(int id) {
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        String qString = "SELECT i FROM cart i where i.buyer.UserID = :id ";
        Query q = em.createQuery(qString);
        q.setParameter("id", id);
        cart info = null;
        try {
            info = (cart) q.getSingleResult();
        } catch (NoResultException e) {

        } finally {
            em.close();
        }
        return info;
    }

    public static void edit(cart cart) {
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.merge(cart);
            trans.commit();
        } catch (Exception e) {
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static void delete(cart cart) {
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.remove(em.merge(cart));
            trans.commit();
        } catch (Exception e) {
            trans.rollback();
        } finally {
            em.close();
        }
    }
//     public static void main(String args[]) {
//        String name = getAll().get(1).
//        String name = getByUserID(51).getBuyer().getLastName();
//        System.out.println(name);
//    }
}
