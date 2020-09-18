package com.product.model;

import java.util.List;

public interface IProductDao {
    public void insert();
    public void update();
    public void delete();
    public List getResult();
}
