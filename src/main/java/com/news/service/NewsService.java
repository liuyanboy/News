package com.news.service;

import com.news.pojo.News_category;
import com.news.pojo.News_detail;

import java.util.List;

public interface NewsService {
    /**
     * 获得新闻的类型列表
     * @return
     */
    public List<News_category> queryCategoryList();


    /**
     * 返回详细的新闻列表
     * @param categoryId  新闻类型编号
     * @param title 新闻标题
     * @return
     */
    public List<News_detail> queryDetailList(Integer categoryId, String title);

    /**
     * 根据id来查询对象的唯一信息
     * @param id 对象唯一id
     * @return
     */
    public News_detail getByIdDateil(Integer id);

    /**
     * 修改某一个新闻的信息
     * @param detail 新闻对象
     * @return
     */
    public int updateDetail(News_detail detail);
}
