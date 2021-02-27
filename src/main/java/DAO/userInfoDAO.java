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
import model.userInfo;
import util.DBUtil;

/**
 *
 * @author ASUS
 */
public class userInfoDAO {

    public static List<userInfo> getAll() {
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        String qString = "SELECT i FROM userInfo i";
        TypedQuery<userInfo> q = em.createQuery(qString, userInfo.class);
        List<userInfo> list;
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

    public static void insert(userInfo user) {
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.persist(user);
            trans.commit();
        } catch (Exception ex) {
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public boolean edit(userInfo user) {
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.merge(user);
            trans.commit();
            return true;
        } catch (Exception ex) {
            trans.rollback();
            return false;
        } finally {
            em.close();
        }
    }

    public static userInfo get(int UserID) {
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        try {
            userInfo info = em.find(userInfo.class, UserID);
            return info;
        } finally {
            em.close();
        }
    }

    public static userInfo get(String username) {
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        String qString = "SELECT i FROM userInfo i where i.UserName = :UserName ";
        Query q = em.createQuery(qString);
        q.setParameter("UserName", username);
        userInfo info = null;
        try {
            info = (userInfo) q.getSingleResult();
        } catch (NoResultException e) {

        } finally {
            em.close();
        }
        return info;
    }
    public static boolean update(int id , String fn , String ln , String add , String phone)
    {
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        em.getTransaction().begin();
        String qString = "UPDATE userInfo u SET  u.FirstName = :fn , u.LastName = :ln , u.Address = :add , u.Phone = :phn WHERE u.UserID = :id ";
        Query q = em.createQuery(qString);
        q.setParameter("fn", fn);
        q.setParameter("ln", ln);
        q.setParameter("add", add);
        q.setParameter("phn", phone);
        q.setParameter("id", id);
        try {
            int i =  q.executeUpdate();
            if(i > 0)
            {
                em.getTransaction().commit();
                return true;
            }
            return false;      
        } finally {
            em.close();
        }
    }
    public static boolean update(int id , String pass)
    {
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        em.getTransaction().begin();
        String qString = "UPDATE userInfo u SET  u.Password = :pass WHERE u.UserID = :id ";
        Query q = em.createQuery(qString);
        q.setParameter("pass", pass);
        q.setParameter("id", id);
        try {
            int i =  q.executeUpdate();
            if(i > 0)
            {
                em.getTransaction().commit();
                return true;
            }
            return false;      
        } finally {
            em.close();
        }
    }
    public static boolean checkExistEmail(String Email) {
        boolean duplicate = false;
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        String qString = "SELECT i FROM userInfo i where i.Email = :Email ";
        Query q = em.createQuery(qString);
        q.setParameter("Email", Email);
        userInfo info = null;
        try {
            info = (userInfo) q.getSingleResult();
            duplicate = true;
        } catch (NoResultException e) {

        } finally {
            em.close();
        }
        return duplicate;
    }

    public static boolean checkExistUsername(String username) {
        boolean duplicate = false;
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        String qString = "SELECT i FROM userInfo i where i.UserName = :UserName ";
        Query q = em.createQuery(qString);
        q.setParameter("UserName", username);
        userInfo info = null;
        try {
            info = (userInfo) q.getSingleResult();
            duplicate = true;
        } catch (NoResultException e) {

        } finally {
            em.close();
        }
        return duplicate;
    }

    public userInfo login(String username, String password) {
        userInfo user = this.get(username);
        if (user != null && password.equals(user.getPassword())) {
            return user;
        }
        return null;
    }

    public static boolean register(String username, String password, String fname, String lname, String address, String email, String phone) {
        if (checkExistUsername(username)) {
            return false;
        }
        userInfo user = new userInfo(username, password, fname, lname, address, email, phone);
        insert(user);
        return true;
    }
    
    public static boolean registerStaff(String username, String password, String fname, String lname, String address, String email, String phone) {
        if (checkExistUsername(username)) {
            return false;
        }
        userInfo user = new userInfo(username, password, fname, lname, address, email, phone, 1);
        insert(user);
        return true;
    }
//    public static void main(String args[]) {
//        String name =  "Bộ Sách lớp";
//        System.out.println(name);
//    }
}

//    public static void main(String args[]) {
//
//        System.out.println(get(1).getPassword());
//    }

