/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utilities;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author mhtso
 */
public class DbUtilities {
    
    final static String url = "jdbc:mysql://localhost:3306/private_school";
    final static String username = "root";
    final static String password = "SQLforMitsos2022!@#";

    public static Connection getConnection() {
        Connection con=null;
        try {
            con = DriverManager.getConnection(url, username, password);
        } catch (SQLException ex) {
            Logger.getLogger(DbUtilities.class.getName()).log(Level.SEVERE, null, ex);
        }
        return con;        
    }
}
