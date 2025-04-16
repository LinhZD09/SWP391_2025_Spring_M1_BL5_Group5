/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class reportDAO extends DBContext{
    
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public void InsertReport(String user_id, String content_report, String subject_report, String user_email) {
        try {
            String sql = "INSERT INTO [dbo].[report]\n"
                    + "           ([user_id]\n"
                    + "           ,[content_report]\n"
                    + "           ,[subject_report]\n"
                    + "           ,[user_email])\n"
                    + "     VALUES (?,?,?,?)";
              conn = new DBContext().getConnection();
                ps = conn.prepareStatement(sql);
                ps.setString(1, user_id); 
                ps.setString(2,content_report );
                ps.setString(3, subject_report); 
                ps.setString(4, user_email); 
                ps.executeUpdate();
        } catch (Exception e) {
        }
    }
}
