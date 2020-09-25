package com.product.service;

import com.product.dao.ProductDao;
import com.product.vo.ProductVo;

/*
 * 呼叫 DAO
 */
public class ProductService {
    public void addProduct (ProductVo product) {
        ProductDao dao = new ProductDao();
        dao.insert(product);
    }
}
