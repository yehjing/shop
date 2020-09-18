package com.product.model;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public interface IProductDao {
    public void insert();
    public void update();
    public void delete(int id) throws SQLException;
    public List getResult();
}
