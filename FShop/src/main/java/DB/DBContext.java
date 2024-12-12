/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DB;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author KienBTCE180180
 */
public class DBContext {

    protected Connection connector = null;

    public DBContext() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); // regist a class Database of Microsoft to memory

            String dbURL = "jdbc:sqlserver://localhost:1433;"
                    + "databaseName=FSHOP;"
                    + "user=sa;" // Enter your user SQL Server
                    + "password=12345;" // Enter your password SQL Server
                    + "encrypt=true;trustServerCertificate=true";

            connector = DriverManager.getConnection(dbURL); // connect to database server follow the dbURL string

            if (connector == null) {
                DatabaseMetaData dm = (DatabaseMetaData) connector.getMetaData();
                System.out.println("Driver name: " + dm.getDriverName());
                System.out.println("Driver version: " + dm.getDriverVersion());
                System.out.println("Product name: " + dm.getDatabaseProductName());
                System.out.println("Product version: " + dm.getDatabaseProductVersion());
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        }
    }
    public static void main(String[] args) {
        DBContext db = new DBContext();
    }
}
