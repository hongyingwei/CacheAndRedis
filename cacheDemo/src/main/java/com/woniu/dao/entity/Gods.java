package com.woniu.dao.entity;

import java.io.Serializable;

public class Gods implements Serializable {
    /**
     *
     */
    private static final long serialVersionUID = 1L;
    private Integer id;
    private String godsName;
    private String godsPrice;
    private String godsDetail;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getGodsName() {
        return godsName;
    }

    public void setGodsName(String godsName) {
        this.godsName = godsName;
    }

    public String getGodsPrice() {
        return godsPrice;
    }

    public void setGodsPrice(String godsPrice) {
        this.godsPrice = godsPrice;
    }

    public String getGodsDetail() {
        return godsDetail;
    }

    public void setGodsDetail(String godsDetail) {
        this.godsDetail = godsDetail;
    }
}
