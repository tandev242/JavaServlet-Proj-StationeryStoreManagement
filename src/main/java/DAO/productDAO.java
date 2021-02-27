/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import model.product;
import util.DBUtil;

/**
 *
 * @author ASUS
 */
public class productDAO {

    public static List<product> getAll() {
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        String qString = "SELECT i FROM product i";
        TypedQuery<product> q = em.createQuery(qString, product.class);
        List<product> list;
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

    public static List<product> getListBestSell() {
        String qString = "SELECT p FROM product p join billDetail b WHERE p.ID = b.IDProduct GROUP BY p order by sum(b.Quantity) DESC";
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        TypedQuery<product> q = em.createQuery(qString, product.class);
        List<product> list;
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

    public static List<product> getListNewProduct() {
        String qString = "SELECT i FROM product i WHERE i.CreatedDate > :datebefore20day ";
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        TypedQuery<product> q = em.createQuery(qString, product.class);
        q.setParameter("datebefore20day", Timestamp.valueOf(LocalDateTime.now().minusDays(100)));
        List<product> list;
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

    public static List<product> getAllByIdSubCategory(int id) {
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        String qString = "SELECT i FROM product i WHERE i.IDSubCategory = :id";
        TypedQuery<product> q = em.createQuery(qString, product.class);
        q.setParameter("id", id);
        List<product> list;
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

    public static List<product> searchByText(String text) {
        text = "%" + text + "%";
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        String qString = "SELECT i FROM product i WHERE i.Name like :text";
        TypedQuery<product> q = em.createQuery(qString, product.class);
        q.setParameter("text", text);
        List<product> list;
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

    public static product get(int id) {
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        try {
            product pro = em.find(product.class, id);
            return pro;
        } finally {
            em.close();
        }
    }

    public static void insert(product product) {
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.persist(product);
            trans.commit();
        } catch (Exception e) {
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static void edit(product product) {
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.merge(product);
            trans.commit();
        } catch (Exception e) {
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static void delete(product product) {
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.remove(em.merge(product));
            trans.commit();
        } catch (Exception e) {
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static int getProductIDbyProductName(String Name) {
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        String qString = "SELECT i FROM product i where i.Name = :Name ";
        Query q = em.createQuery(qString);
        q.setParameter("Name", Name);
        product pName = null;
        try {
            pName = (product) q.getSingleResult();
        } catch (NoResultException e) {

        } finally {
            em.close();
        }
        return pName.getID();
    }

    public static boolean checkExistProductName(String productName) {
        boolean duplicate = false;
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        String qString = "SELECT i FROM product i where i.Name = :Name ";
        Query q = em.createQuery(qString);
        q.setParameter("Name", productName);
        product info = null;
        try {
            info = (product) q.getSingleResult();
            duplicate = true;
        } catch (NoResultException e) {

        } finally {
            em.close();
        }
        return duplicate;
    }

//    public static void main(String args[]) {
//        String name = getProductNameByIDInventory(1).get(0).getName();
//        System.out.println(name);
//    }
}
