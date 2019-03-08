package com.school.service;

import com.school.entity.News;

import java.util.Map;

public interface NewsService {
    /**
     * 实现增加操作
     * @param vo
     * @return
     * @throws Exception
     */
    boolean insert(News vo) throws Exception;

    public Map<String, Object> listBySplit(String column, String keyword, int currentPage, int lineSize) throws Exception;
}
