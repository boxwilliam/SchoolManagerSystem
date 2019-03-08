package com.school.entity;

public class Image {
    private int imageId;
    private String aboutNewsTitle;
    private String imageAddress;

    public int getImageId() {
        return imageId;
    }

    public void setImageId(int imageId) {
        this.imageId = imageId;
    }

    public String getAboutNewsTitle() {
        return aboutNewsTitle;
    }

    public void setAboutNewsTitle(String aboutNewsTitle) {
        this.aboutNewsTitle = aboutNewsTitle;
    }

    public String getImageAddress() {
        return imageAddress;
    }

    public void setImageAddress(String imageAddress) {
        this.imageAddress = imageAddress;
    }

    @Override
    public String toString() {
        return "Image{" +
                "imageId=" + imageId +
                ", aboutNewsTitle='" + aboutNewsTitle + '\'' +
                ", imageAddress='" + imageAddress + '\'' +
                '}';
    }
}
