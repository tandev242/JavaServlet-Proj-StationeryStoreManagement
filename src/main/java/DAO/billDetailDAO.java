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
import model.billDetail;
import util.DBUtil;

/**
 *
 * @author Minh Hoang
 */
public class billDetailDAO {

    public static void insert(billDetail bd) {
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.persist(bd);
            trans.commit();
        } catch (Exception e) {
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static long getQuantityByIdCategory(int id) {
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        String qString = "SELECT SUM(i.Quantity) FROM billDetail i inner join product p on i.IDProduct = p.ID inner join subCategory s on p.IDSubCategory = s.ID inner join category c on s.IDCategory = c.ID WHERE c.ID = :id GROUP BY c.ID";
        Query q = em.createQuery(qString, billDetail.class);
        q.setParameter("id", id);
        try {
            Object kq = q.getSingleResult();
            return (long) kq;
        } catch (NoResultException e) {

        } finally {
            em.close();
        }
        return 0;
    }

    public static long getQuantityByIDProduct(int id) {
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        String qString = "SELECT SUM(i.Quantity) FROM billDetail i inner join product p on i.IDProduct = p.ID WHERE p.ID = :id GROUP BY p.ID";
        Query q = em.createQuery(qString, billDetail.class);
        q.setParameter("id", id);
        try {
            Object kq = q.getSingleResult();
            return (long) kq;
        } catch (NoResultException e) {

        } finally {
            em.close();
        }
        return 0;
    }
    
    public static long getAmountByMonth(long month) {
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        String qString = "SELECT SUM(i.Amount) FROM billDetail i inner join product p on i.IDProduct = p.ID inner join bill b on i.IDBill = b.ID WHERE FUNC('MONTH', b.CreatedDate) = :month";
        Query q = em.createQuery(qString, billDetail.class);
        q.setParameter("month", month);
        try {
            Object kq = q.getSingleResult();
            if (kq != null) {
                return (long) kq;
            }
        } catch (NoResultException e) {
            System.out.println(e);

        } finally {
            em.close();
        }
        return 0;
    }

    public static List<billDetail> getBillDetailByIdUser(int id) {
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        String qString = "SELECT i from billDetail i WHERE i.UserID = :id";
        TypedQuery<billDetail> q = em.createQuery(qString, billDetail.class);
        q.setParameter("id", id);
        List<billDetail> list = null;
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

//    public static void main(String args[]) {
//        long name = getQuantityByIDProduct(2);
//        System.out.println(name);
//    }
}
