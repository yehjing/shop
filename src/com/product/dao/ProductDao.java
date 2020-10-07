package com.product.dao;

import com.product.vo.ProductVo;
import utils.JDBC;

import java.sql.*;
import java.util.ArrayList;
/*
 * 這邊放對 DB 的操作
 */
public class ProductDao implements IProductDao {

    private Connection conn = JDBC.getConnection(); //取得連線

    private PreparedStatement pstmt = null;
    private ResultSet rs = null; // 取資料用

    /**
     * 新增 1 筆產品
     */
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

    /**
     * 更新產品資訊
     */
    @Override
    public void update() {

    }

    /**
     * 刪除產品
     */
    @Override
    public boolean delete(Integer id) {
        String sql = "delete from product where id=?";
        int times = 0;
        try{
            pstmt = conn.prepareStatement(sql);
            // 對SQL語句中的第一個占位符賦值
            pstmt.setInt(1, id);
            // 執行更新操作
            times = pstmt.executeUpdate();

        } catch (SQLException e){
            System.out.println(e);
        } finally{
            if (pstmt != null) {
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
        return times > 0;
    }

    /**
     * 取得所有產品
     */
    @Override
    public ArrayList<ProductVo> getAllProduct() {
        String sql = "select * from product";
        ArrayList<ProductVo> list = new ArrayList();

        try{
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                ProductVo vo = new ProductVo();

                vo.setId(rs.getInt("id"));
                vo.setName(rs.getString("name"));
                vo.setPrice(rs.getInt("price"));
                vo.setCreat_date(rs.getString("creat_date"));
                vo.setUpdate_date(rs.getString("update_date"));

                list.add(vo);
            }


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
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }


        return list;
    }
}
