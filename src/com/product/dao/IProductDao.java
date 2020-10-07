package com.product.dao;

import com.product.vo.ProductVo;

import java.sql.SQLException;
import java.util.List;

public interface IProductDao {
    public void insert(ProductVo ProductVo) throws SQLException;
    public void update();
    public void delete(int id) throws SQLException;
    public List getAllProduct();
}
