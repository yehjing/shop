package com.product.vo;

public class ProductVo {
    private String name;
    private Integer price;
    private String creat_date;
    private String update_date;

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

    public String getCreat_date() {
        return creat_date;
    }

    public void setCreat_date(String creat_date) {
        this.creat_date = creat_date;
    }

    public String getUpdate_date() {
        return update_date;
    }

    public void setUpdate_date(String update_date) {
        this.update_date = update_date;
    }
}
