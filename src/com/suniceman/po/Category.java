package com.suniceman.po;

import java.io.Serializable;

public class Category implements Serializable {
    
    private static final long serialVersionUID = 1L;
    
    private int id;
    private String categoryName;
    private String desc;
    private int userId;
    private String createdTime;
    
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public String getCategoryName() {
        return categoryName;
    }
    
    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
    
    public String getDesc() {
        return desc;
    }
    
    public void setDesc(String desc) {
        this.desc = desc;
    }
    
    public int getUserId() {
        return userId;
    }
    
    public void setUserId(int userId) {
        this.userId = userId;
    }
    
    public String getCreatedTime() {
        return createdTime;
    }
    
    public void setCreatedTime(String createdTime) {
        this.createdTime = createdTime;
    }
    
    @Override
    public String toString() {
        return "Category [id=" + id + ", categoryName=" + categoryName + ", desc=" + desc + ", userId=" + userId
                + ", createdTime=" + createdTime + "]";
    }
    
}
