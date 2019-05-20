package com.news.dao;

import com.news.pojo.News_category;
import com.news.pojo.News_detail;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface NewsMapper {


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
    public List<News_detail> queryDetailList(@Param("categoryId")Integer categoryId,@Param("title")String title);

    /**
     * 根据id来查询对象的唯一信息
     * @param id 对象唯一id
     * @return
     */
    public News_detail getByIdDateil(@Param("id")Integer id);

    /**
     * 修改某一个新闻的信息
     * @param detail 新闻对象
     * @return
     */
    public int updateDetail(News_detail detail);
}
