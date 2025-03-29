/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author us
 */
public class Conexao {
    
   private static final String url="jdbc:mysql://localhost:3306/socialmidia";
   private static final  String user="root";
   private static final  String senha="";
   
   public static Connection getCom(){
       
       try {
            System.out.println("Conexao bem sucedida");
           return DriverManager.getConnection(url, user, senha);
          
       } catch (SQLException ex) {
           Logger.getLogger(Conexao.class.getName()).log(Level.SEVERE, null, ex);
       }
       return getCom();
   }
   
     static {
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
        throw new RuntimeException("Driver JDBC do MySQL não encontrado!", e);
    }
}

}
