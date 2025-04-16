/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.SQLException;
import model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDAO extends DBContext {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public boolean updatePassword(User user) throws Exception {
        String sql = "UPDATE users set user_pass = ? where user_email = ?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, user.getUser_pass()); // Mật khẩu mới
            ps.setString(2, user.getUser_email());// ID người dùng

            int result = ps.executeUpdate();
            return result > 0; // Nếu có dòng bị ảnh hưởng, trả về true
        } catch (SQLException e) {
            e.printStackTrace();
            return false; // Trả về false nếu có lỗi xảy ra
        }
    }
    
    public List<User> getUser() {
        List<User> list = new ArrayList<>();
        String sql = "select *, CAST(banned AS BIT) AS banned FROM users";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getBoolean("banned"), rs.getString(10), rs.getString(11)));
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    public void setAdmin(int user_id, String isAdmin, String isStoreStaff, String adminReason) {
        String sql = "UPDATE users SET isAdmin = ?, isStoreStaff = ?, adminReason = ? WHERE user_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, isAdmin.toUpperCase());
            ps.setString(2, isStoreStaff.toUpperCase());
            ps.setString(3, adminReason);
            ps.setInt(4, user_id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();

        }
    }

    public void deleteUser(int user_id) {
        String sql = "DELETE FROM users WHERE user_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, user_id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }  

    public void banUser(int user_id) {
        String sql = "UPDATE users SET banned = 1 WHERE user_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, user_id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void unbanUser(int user_id) {
        String sql = "UPDATE users SET banned = 0 WHERE user_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, user_id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
