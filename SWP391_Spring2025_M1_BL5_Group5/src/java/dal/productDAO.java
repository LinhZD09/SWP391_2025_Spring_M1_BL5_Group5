/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Product;
import model.Product_Active;

/**
 *
 * @author MSI
 */
public class productDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public List<Product> getProduct(){
        List<Product> list = new ArrayList<>();
        String sql = "select c.category_name ,  p.product_id , p.product_name, p.product_price, p.product_describe, p.quantity,p.img, p.category_id from  \n"
                + "product p inner join category c on p.category_id = c.category_id";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()){
                Category c = new Category(rs.getInt(8), rs.getString(1));
                list.add(new Product(c, rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getString(5), rs.getInt(6), rs.getString(7)));
            }        
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public List<Product> getProductA(){
        List<Product> list = new ArrayList<>();
        String sql = "select c.category_name ,  p.product_id , p.product_name, p.product_price, p.product_describe, p.quantity,p.img, p.category_id from  \n"
                + "product p inner join category c on p.category_id = c.category_id inner join product_active pa on pa.product_id = p.product_id Where pa.active='True'";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()){
                Category c = new Category(rs.getInt(8), rs.getString(1));
                list.add(new Product(c, rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getString(5), rs.getInt(6), rs.getString(7)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
            
        }
  

    public List<Product_Active> getActive(){
        List<Product_Active> list = new ArrayList<>();
        String sql = "select * from product_active";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(new Product_Active(rs.getString(1), rs.getString(2)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public List<Product> getProductHigh(){
        List<Product> list = new ArrayList<>();
        String sql = "select c.category_name , p.product_id , p.product_name, p.product_price, p.product_describe, p.quantity,p.img from product p inner join category c on p.category_id = c.category_id ORDER BY p.product_price DESC";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Category c = new Category(rs.getString(1));
                list.add(new Product(c, rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getString(5), rs.getInt(6), rs.getString(7)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public List<Product> getProductAZ() {
        List<Product> list = new ArrayList<>();
        String sql = "select c.category_name , p.product_id , p.product_name, p.product_price, p.product_describe, p.quantity,p.img from product p inner join category c on p.category_id = c.category_id inner join product_active pa on pa.product_id = p.product_id Where pa.active ='True' ORDER BY p.product_name";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getString(1));
                list.add(new Product(c, rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getString(5), rs.getInt(6), rs.getString(7)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public List<Product> getListByPage(List<Product> list,
            int start, int end) {
        ArrayList<Product> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }
    
    public List<Category> getCategory() {
        List<Category> list = new ArrayList<>();
        String sql = "select * from category";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public List<Product> getTop10Product() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT TOP 10 p.product_id , p.product_name, p.product_price, p.product_describe, p.quantity,p.img FROM product p inner join product_active pa on pa.product_id = p.product_id Where pa.active ='True' ORDER BY NEWID()";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getString(1), rs.getString(2), rs.getFloat(3), rs.getString(4), rs.getInt(5), rs.getString(6)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getTrendProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT TOP 5 p.product_id , p.product_name, p.product_price, p.product_describe, p.quantity,p.img FROM product p inner join bill_detail bd on p.product_id = bd.product_id inner join product_active pa on pa.product_id = p.product_id Where pa.active ='True' \n"
                + "ORDER BY bd.quantity DESC";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getString(1), rs.getString(2), rs.getFloat(3), rs.getString(4), rs.getInt(5), rs.getString(6)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getNewProducts(int limit) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT TOP  p.product_id , p.product_name, p.product_price, p.product_describe, p.quantity,p.img FROM product p inner join bill_detail bd on p.product_id = bd.product_id\n"
                + "ORDER BY bd.quantity";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, limit);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getString(1));
                list.add(new Product(c, rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getString(5), rs.getInt(6), rs.getString(7)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public int CountProduct() {
        int count = 0;
        String sql = "SELECT COUNT(*) as 'count'\n"
                + "  FROM product";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return count;
    }

    public int CountUser() {
        int count = 0;
        String sql = "SELECT COUNT(*) as 'count'\n"
                + "  FROM users where isAdmin = 'False' or isAdmin = 'FALSE' ";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return count;
    }

    public int CountBill() {
        int count = 0;
        String sql = "SELECT COUNT(*) as 'count'\n"
                + "  FROM bill";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return count;
    }

    public int CountProductLow() {
        int count = 0;
        String sql = "SELECT COUNT(*) as 'count'\n"
                + "  FROM product where quantity < 50 ";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return count;
    }

    public static void main(String[] args) {
        // Tạo đối tượng của DAO
        productDAO dao = new productDAO();

        // Gọi phương thức CountUser để lấy số lượng người dùng
        int countUser = dao.CountUser();

        // In kết quả ra console
        System.out.println("Tổng số người dùng: " + countUser);
    }
}
