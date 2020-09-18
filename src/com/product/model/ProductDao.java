package com.product.model;

import utils.JDBC;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class ProductDao implements IProductDao {

    private static Connection conn = JDBC.getConnection();

    private PreparedStatement ptmt = null;
    private ResultSet rs = null;

    @Override
    public void insert() {

    }

    @Override
    public void update() {

    }

    @Override
    public void delete(int id) throws SQLException {
        String sql = "delete from product where id=?";
        try{
            ptmt = conn.prepareStatement(sql);
            // 對SQL語句中的第一個占位符賦值
            ptmt.setInt(1, id);
            // 執行更新操作
            ptmt.executeUpdate();

        }finally{
            if (ptmt != null) {
                ptmt.close();
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
