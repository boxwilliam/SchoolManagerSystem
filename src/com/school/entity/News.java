package com.school.entity;

import java.util.Date;

public class News {
    private int newsId;
    private String content;
    private String author;
    private Date publishdate;
    private short isBackground;
    private String describ;
    private long newsImage;
    private String newsTitle;
    private int newsArea;
    private String newsType;

    public int getNewsId() {
        return newsId;
    }

    public void setNewsId(int newsId) {
        this.newsId = newsId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Date getPublishdate() {
        return publishdate;
    }

    public void setPublishdate(Date publishdate) {
        this.publishdate = publishdate;
    }

    public short getIsBackground() {
        return isBackground;
    }

    public void setIsBackground(short isBackground) {
        this.isBackground = isBackground;
    }

    public String getDescrib() {
        return describ;
    }

    public void setDescrib(String describ) {
        this.describ = describ;
    }

    public long getNewsImage() {
        return newsImage;
    }

    public void setNewsImage(long newsImage) {
        this.newsImage = newsImage;
    }

    public String getNewsTitle() {
        return newsTitle;
    }

    public void setNewsTitle(String newsTitle) {
        this.newsTitle = newsTitle;
    }

    public int getNewsArea() {
        return newsArea;
    }

    public void setNewsArea(int newsArea) {
        this.newsArea = newsArea;
    }

    public String getNewsType() {
        return newsType;
    }

    public void setNewsType(String newsType) {
        this.newsType = newsType;
    }

    @Override
    public String toString() {
        return "News{" +
                "newsId=" + newsId +
                ", content='" + content + '\'' +
                ", author='" + author + '\'' +
                ", publishdate=" + publishdate +
                ", isBackground=" + isBackground +
                ", describ='" + describ + '\'' +
                ", newsImage=" + newsImage +
                ", newsTitle='" + newsTitle + '\'' +
                ", newsArea=" + newsArea +
                ", newsType='" + newsType + '\'' +
                '}';
    }
}
