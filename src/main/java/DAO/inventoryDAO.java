package DAO;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;
import model.inventory;
import util.DBUtil;

/**
 *
 * @author ASUS
 */
public class inventoryDAO {

    public static List<inventory> getAll() {
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        String qString = "SELECT i FROM inventory i";
        TypedQuery<inventory> q = em.createQuery(qString, inventory.class);
        List<inventory> list;
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

    public static void insert(inventory inv) {
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.persist(inv);
            trans.commit();
        } catch (Exception ex) {
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static void edit(inventory inv) {
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.merge(inv);
            trans.commit();
        } catch (Exception e) {
            trans.rollback();
        } finally {
            em.close();
        }

    }

    public static inventory get(int ID) {
        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
        try {
            inventory inv = em.find(inventory.class, ID);
            return inv;
        } finally {
            em.close();
        }
    }

//    public static List<inventory> getProductNameByIDInventory(int idProduct) {
//        EntityManager em = DBUtil.getEntityManagerFactory().createEntityManager();
//        String qString = "SELECT i FROM inventory i where i.IDProduct = :id";
//        TypedQuery<inventory> q = em.createQuery(qString, inventory.class);
//        q.setParameter("id", idProduct);
//        List<inventory> listInven;
//        try {
//            listInven = q.getResultList();
//            if (listInven == null || listInven.isEmpty()) {
//                listInven = null;
//            }
//        } finally {
//            em.close();
//        }
//        return listInven;
//    }
//    public static void main(String args[]) {
//        String name = String.valueOf(getProductNameByIDInventory(1).get(0).getQuantity());
//        System.out.println(name);
//    }
}
