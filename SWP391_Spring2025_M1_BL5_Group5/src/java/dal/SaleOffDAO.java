package dal;

import model.SaleOff;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SaleOffDAO extends DBContext {

    public List<SaleOff> getAllSaleOffs() {
        List<SaleOff> saleOffs = new ArrayList<>();
        String sql = "SELECT * FROM sale_off";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                SaleOff saleOff = new SaleOff(
                        rs.getInt("sale_off_id"),
                        rs.getString("sale_off_code"),
                        rs.getString("discount_type"),
                        rs.getDouble("discount_value"),
                        rs.getDouble("max_discount"),
                        rs.getDate("start_date"),
                        rs.getDate("end_date"),
                        rs.getInt("quantity")
                );
                saleOffs.add(saleOff);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return saleOffs;
    }

    public static void main(String[] args) {
        // Tạo đối tượng SaleOffDAO để gọi phương thức getAllSaleOffs
        SaleOffDAO saleOffDAO = new SaleOffDAO();

        // Lấy tất cả mã giảm giá từ cơ sở dữ liệu
        List<SaleOff> saleOffs = saleOffDAO.getAllSaleOffs();

        // Kiểm tra nếu danh sách không rỗng, và hiển thị các mã giảm giá
        if (saleOffs != null && !saleOffs.isEmpty()) {
            System.out.println("Danh sách mã giảm giá:");
            for (SaleOff saleOff : saleOffs) {
                // Hiển thị thông tin của từng mã giảm giá
                System.out.println("SaleOff ID: " + saleOff.getSaleId());
                System.out.println("SaleOff Code: " + saleOff.getSaleCode());
                System.out.println("Discount Type: " + saleOff.getDiscountType());
                System.out.println("Discount Value: " + saleOff.getDiscountValue());
                System.out.println("Max Discount: " + saleOff.getMaxDiscount());
                System.out.println("Start Date: " + saleOff.getStart_date());
                System.out.println("End Date: " + saleOff.getEnd_date());
                System.out.println("Quantity: " + saleOff.getQuantity());
                System.out.println("------------------------------------");
            }
        } else {
            System.out.println("Không có mã giảm giá nào.");
        }
    }
}
