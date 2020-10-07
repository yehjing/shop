package com.product.service;

import com.product.dao.ProductDao;
import com.product.vo.ProductVo;

import java.util.ArrayList;

/*
 * 呼叫 DAO
 */
public class ProductService {
    public void addProduct (ProductVo product) {
        ProductDao dao = new ProductDao();
        dao.insert(product);
    }
    public ArrayList<ProductVo> getAllProduct () {
        ProductDao dao = new ProductDao();
        return dao.getAllProduct();
    }
    public boolean delProduct (Integer id) {
        ProductDao dao = new ProductDao();
        return dao.delete(id);
    }
}
