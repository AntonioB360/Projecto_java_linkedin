package Model;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Criptografia {

    public static String criptografa(String senha) {
        try {
           
            MessageDigest md = MessageDigest.getInstance("SHA-256");

           
            byte[] hashBytes = md.digest(senha.getBytes());

            
            StringBuilder hexString = new StringBuilder();
            for (byte b : hashBytes) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }

            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            
            e.printStackTrace();
            return null;
        }
    }
}