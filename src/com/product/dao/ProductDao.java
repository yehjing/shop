package com.product.dao;

import com.product.vo.ProductVo;
import utils.JDBC;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
/*
 * 這邊放對 DB 的操作
 */
public class ProductDao implements IProductDao {

    private static Connection conn = JDBC.getConnection();

    private PreparedStatement pstmt = null;
    private ResultSet rs = null;

    @Override
    public void insert(ProductVo vo) {
        String sql = "insert into product (name, price, creat_date, update_date) values(?,?,?,?)";
        try{
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, vo.getName());
            pstmt.setInt(2, vo.getPrice());
            pstmt.setString(3, vo.getCreat_date());
            pstmt.setString(4, vo.getUpdate_date());

            pstmt.executeUpdate();

        } catch (SQLException e){
            System.out.println(e);
        } finally {
            if(pstmt != null){
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

    }

    @Override
    public void update() {

    }

    @Override
    public void delete(int id) throws SQLException {
        String sql = "delete from product where id=?";
        try{
            pstmt = conn.prepareStatement(sql);
            // 對SQL語句中的第一個占位符賦值
            pstmt.setInt(1, id);
            // 執行更新操作
            pstmt.executeUpdate();

        }finally{
            if (pstmt != null) {
                pstmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    @Override
    public List getResult() {
        return null;
    }
}
