package com.bookshopweb.dao;

import com.bookshopweb.beans.StatisticalProduct;
import com.bookshopweb.utils.JDBCUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class StatiscalProductDAO {
    private Connection conn = JDBCUtils.getConnection();

    public List<StatisticalProduct> getAll(){
        List<StatisticalProduct> result = new ArrayList<>();
        try {
            String sql = "SELECT pd.id, pd.name,  \n" +
                    "COALESCE((SELECT SUM(product_import.quanlity) FROM product_import \n" +
                    "WHERE product_import.productId=pd.id), 0) AS import_quatity,\n" +
                    "COALESCE((SELECT SUM(order_item.quantity) \n" +
                    "FROM order_item \n" +
                    "INNER JOIN orders ON order_item.orderId = orders.id \n" +
                    "WHERE order_item.productId = pd.id AND orders.status != 3 ), 0) AS sell_quantityitem, \n" +
                    "COALESCE((SELECT SUM(order_item.price) \n" +
                    "FROM order_item \n" +
                    "INNER JOIN orders ON order_item.orderId = orders.id \n" +
                    "WHERE order_item.productId = pd.id AND orders.status != 3), 0) AS total_sell_price,\n" +
                    "COALESCE((SELECT SUM(product_import.quanlity * product_import.price) \n" +
                    "FROM product_import \n" +
                    "WHERE product_import.productId=pd.id), 0) AS total_import_price\n" +
                    "FROM product pd";
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();


        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return result;
    }
    public List<StatisticalProduct> getFromResultset(ResultSet rs){
        List<StatisticalProduct> result = new ArrayList<>();
        try {
            while(rs.next()){
                long productId = rs.getLong("id");
                String name = rs.getString("name");
                int importQuantity = rs.getInt("import_quatity");
                int sellQuantity = rs.getInt("sell_quantityitem");
                double totalSellPrice = rs.getDouble("total_sell_price");
                double totalImportPrice = rs.getDouble("total_import_price");
                double totalProfit = totalSellPrice - totalImportPrice;
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return result;
    }
}
