/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AdminController;

import DAO.categoryDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.inventory;
import DAO.inventoryDAO;
import model.product;
import DAO.productDAO;
import DAO.subCategoryDAO;
import java.io.File;
import java.time.LocalDate;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import model.userInfo;
import model.subCategory;

/**
 *
 * @author Minh Hoang
 */
@WebServlet(urlPatterns = "/admin/inventory")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 50, // 50MB
    maxRequestSize = 1024 * 1024 * 50) // 50MB

public class InventoryController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        List<inventory> inventory = inventoryDAO.getAll();
        request.setAttribute("inventory", inventory);
        request.getRequestDispatcher("/Menu/FinalProject/views/admin/inventory.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");

        //Lấy dữ liệu từ new_product.jsp
        String prName = request.getParameter("pname");
        String Category = request.getParameter("cate");
        String SubCategoryName = request.getParameter("subcate");
        String Descrip = request.getParameter("description");
        int PriceBuy = Integer.parseInt(request.getParameter("priceBuy"));
        int Price = Integer.parseInt(request.getParameter("price"));
        int Promotion = Integer.parseInt(request.getParameter("promotion"));
        int Quantity = Integer.parseInt(request.getParameter("quantity"));
        String fileName = "";

        if (productDAO.checkExistProductName(prName) == false) {

            //Lấy CateID và SubID của sản phẩm mới thêm về, nếu SubCate đó chưa có trong database thì insert vào
            int CateID = categoryDAO.getCateIDbyCateName(Category);
            subCategory SubCate = new subCategory(SubCategoryName, CateID);
            if (subCategoryDAO.checkExistSubCategoryName(SubCategoryName) == false) {
                subCategoryDAO.insert(SubCate);
            }
            int SubcateID = subCategoryDAO.getSubCateIDbySubCateName(SubCategoryName);

            //Lấy thông tin của người thêm sản phẩm vào
            HttpSession session = request.getSession();
            Object obj = session.getAttribute("account");
            userInfo admin = (userInfo) obj;
            
            String saveDir = "Menu/FinalProject/views/layout/user/assets/themes/images/products";
            // Đường dẫn tuyệt đối tới thư mục gốc của web app.
           String appPath = request.getServletContext().getRealPath("");
           appPath = appPath.replace('\\', '/');
           
           // Thư mục để save file tải lên.
//           String fullSavePath = "/Menu/FinalProject/views/layout/user/assets/theme/images/products";
           // Thư mục để save file tải lên.
           String fullSavePath = null;
           if(appPath.endsWith("/")){
               fullSavePath = appPath + saveDir;
           }
           else{
               fullSavePath = appPath + "/" + saveDir;
           }
//           // Tạo thư mục nếu nó không tồn tại.
           File fileSaveDir = new File(fullSavePath);
           if (!fileSaveDir.exists()) {
               fileSaveDir.mkdir();
           }
           // Danh mục các phần đã upload lên (Có thể là nhiều file).
           for (Part part : request.getParts()) {
               fileName = extractFileName(part);
               if (fileName != null && fileName.length() > 0) {
                   String filePath = fullSavePath + File.separator + fileName;
  
                   // Ghi vào file.
                   part.write(filePath);
               }
           }
            
            //Thêm sản phẩm mới được nhập vào trong database
            product Product = new product();
            Product.setName(prName);
            Product.setIDSubCategory(SubcateID);
            Product.setDescription(Descrip);
            Product.setPrice(Price);
            Product.setPromotionPrice(Promotion);
            Product.setCreatedDate(java.sql.Date.valueOf(LocalDate.now()));
            Product.setCreatedBy(admin.getFirstName());
            Product.setImage(fileName);
            productDAO.insert(Product);
            int ProductID = productDAO.getProductIDbyProductName(prName);

            //Thêm sản phẩm vào inventory
            inventory Inventory = new inventory(ProductID, Product.getIDSubCategory(), PriceBuy, Quantity);
            inventoryDAO.insert(Inventory);

        } else {
            String alert = "Sản phẩm đã có trong kho";
            request.setAttribute("alert", alert);
        }
        doGet(request, response);
    }
    private String extractFileName(Part part) {
       // form-data; name="file"; filename="C:\file1.zip"
       // form-data; name="file"; filename="C:\Note\file2.zip"
       String contentDisp = part.getHeader("content-disposition");
       String[] items = contentDisp.split(";");
       for (String s : items) {
           if (s.trim().startsWith("filename")) {
               // C:\file1.zip
               // C:\Note\file2.zip
               String clientFileName = s.substring(s.indexOf("=") + 2, s.length() - 1);
               clientFileName = clientFileName.replace("\\", "/");
               int i = clientFileName.lastIndexOf('/');
               // file1.zip
               // file2.zip
               return clientFileName.substring(i + 1);
           }
       }
       return null;
   }
}
