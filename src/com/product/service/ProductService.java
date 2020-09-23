package com.product.service;

import com.product.dao.ProductDao;
import com.product.vo.ProductVo;

import java.sql.SQLException;

/*
 * 呼叫 DAO
 */
public class ProductService {
    public void addProduct (ProductVo product) throws SQLException {
        ProductDao dao = new ProductDao();
        dao.insert(product);
    }
}
