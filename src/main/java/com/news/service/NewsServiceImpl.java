package com.news.service;

import com.news.dao.NewsMapper;
import com.news.pojo.News_category;
import com.news.pojo.News_detail;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("newsService")
public class NewsServiceImpl implements NewsService {

    @Resource
    private NewsMapper newsMapper;

    @Override
    public List<News_category> queryCategoryList() {
        return newsMapper.queryCategoryList();
    }

    @Override
    public List<News_detail> queryDetailList(Integer categoryId, String title) {
        return newsMapper.queryDetailList(categoryId,title);
    }

    @Override
    public News_detail getByIdDateil(Integer id) {
        return newsMapper.getByIdDateil(id);
    }

    @Override
    public int updateDetail(News_detail detail) {
        return newsMapper.updateDetail(detail);
    }
}
