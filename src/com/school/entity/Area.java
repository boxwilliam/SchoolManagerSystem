package com.school.entity;

public class Area {
    private String areaId;
    private String firstNav;
    private String secondNav;
    private int pageArea;

    public String getAreaId() {
        return areaId;
    }

    public void setAreaId(String areaId) {
        this.areaId = areaId;
    }

    public String getFirstNav() {
        return firstNav;
    }

    public void setFirstNav(String firstNav) {
        this.firstNav = firstNav;
    }

    public String getSecondNav() {
        return secondNav;
    }

    public void setSecondNav(String secondNav) {
        this.secondNav = secondNav;
    }

    public int getPageArea() {
        return pageArea;
    }

    public void setPageArea(int pageArea) {
        this.pageArea = pageArea;
    }

    @Override
    public String toString() {
        return "Area{" +
                "areaId='" + areaId + '\'' +
                ", firstNav='" + firstNav + '\'' +
                ", secondNav='" + secondNav + '\'' +
                ", pageArea=" + pageArea +
                '}';
    }
}
