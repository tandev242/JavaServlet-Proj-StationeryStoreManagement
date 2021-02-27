package model;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;

/**
 *
 * @author Minh Hoang
 */
public class Hash {
    //MD2, MD5, SHA-1, SHA-224, SHA-256, SHA-384, SHA-512
    public static String getHash(String data) {
        /*SecureRandom random = new SecureRandom();
        byte[] salt = new byte[16];             //Hash các chuỗi giống nhau ra kết quả không trùng
        random.nextBytes(salt);*/
        String hashValue = "";
        try {
            MessageDigest messageDigest = MessageDigest.getInstance("SHA-512");
            messageDigest.update(data.getBytes());
//            messageDigest.update(salt);       //Hash các chuỗi giống nhau ra kết quả không trùng
            byte[] hashedPassword = messageDigest.digest(data.getBytes(StandardCharsets.UTF_8));
            hashValue = Base64.getEncoder().encodeToString(hashedPassword);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return hashValue;
    }

//    public static void main(String[] args) {
//        String s = "1234";
//        System.out.print(getHash(s));
//    }
}
