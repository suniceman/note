package com.suniceman.po;

import java.io.Serializable;

public class Note implements Serializable {
    
    private static final long serialVersionUID = 1L;
    
    private int id;
    private String title;
    private String content;
    private int userId;
    private String createdTime;
    private int categoryId;
    
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public String getTitle() {
        return title;
    }
    
    public void setTitle(String title) {
        this.title = title;
    }
    
    public String getContent() {
        return content;
    }
    
    public void setContent(String content) {
        this.content = content;
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
    
    public int getCategoryId() {
        return categoryId;
    }
    
    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }
    
    @Override
    public String toString() {
        return "Note [id=" + id + ", title=" + title + ", content=" + content + ", userId=" + userId + ", createdTime="
                + createdTime + ", categoryId=" + categoryId + "]";
    }
    
}
