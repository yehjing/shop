package com.product.vo;

import java.sql.Timestamp;

public class ProductVo {
    private Integer id;
    private String name;
    private Integer price;
    private Timestamp creat_date;
    private String update_date;
    private String img_path;
    private String description;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Timestamp getCreat_date() {
        return creat_date;
    }

    public void setCreat_date(Timestamp creat_date) {
        this.creat_date = creat_date;
    }

    public String getUpdate_date() {
        return update_date;
    }

    public void setUpdate_date(String update_date) {
        this.update_date = update_date;
    }

    public String getImg_path() {
        return img_path;
    }

    public void setImg_path(String img_path) {
        this.img_path = img_path;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


}
