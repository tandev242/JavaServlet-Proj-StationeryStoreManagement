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
import model.subCategory;
import util.DBUtil;

/**
 *
 * @author ASUS
 */
public class subCategoryDAO {

    public static List<subCategory> getAll() {
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        String qString = "SELECT i FROM subCategory i";
        TypedQuery<subCategory> q = em.createQuery(qString, subCategory.class);
        List<subCategory> listSub;
        try {
            listSub = q.getResultList();
            if (listSub == null || listSub.isEmpty()) {
                listSub = null;
            }
        } finally {
            em.close();
        }
        return listSub;
    }
    public static void insert(subCategory subcate) {
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.persist(subcate);
            trans.commit();
        } catch (Exception ex) {
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static List<subCategory> getAllByIDCategory(int idCate) {
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        String qString = "SELECT i FROM subCategory i where i.IDCategory = :id";
        TypedQuery<subCategory> q = em.createQuery(qString, subCategory.class);
        q.setParameter("id", idCate);
        List<subCategory> listSub;
        try {
            listSub = q.getResultList();
            if (listSub == null || listSub.isEmpty()) {
                listSub = null;
            }
        } finally {
            em.close();
        }
        return listSub;
    }

    public static subCategory get(int ID) {
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        try {
            subCategory sub = em.find(subCategory.class, ID);
            return sub;
        } finally {
            em.close();
        }
    }

    public static int getSubCateIDbySubCateName(String Subcate) {
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        String qString = "SELECT i FROM subCategory i where i.NameSubCategory = :NameSubCategory ";
        Query q = em.createQuery(qString);
        q.setParameter("NameSubCategory", Subcate);
        subCategory SubcategoryID = null;
        try {
            SubcategoryID = (subCategory) q.getSingleResult();
        } catch (NoResultException e) {

        } finally {
            em.close();
        }
        return SubcategoryID.getID();
    }
    
    public static boolean checkExistSubCategoryName(String Subcate) {
        boolean duplicate = false;
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        String qString = "SELECT i FROM subCategory i where i.NameSubCategory = :NameSubCategory ";
        Query q = em.createQuery(qString);
        q.setParameter("NameSubCategory", Subcate);
        subCategory info = null;
        try {
            info = (subCategory) q.getSingleResult();
            duplicate = true;
        } catch (NoResultException e) {

        } finally {
            em.close();
        }
        return duplicate;
    }
//    public static void main(String args[]) {
//        System.out.println(getAllByIDCategory(1).get(1).getNameSubCategory());
//    }
}
