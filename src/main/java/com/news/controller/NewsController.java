package com.news.controller;

import com.news.pojo.News_category;
import com.news.pojo.News_detail;
import com.news.service.NewsService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/news")
public class NewsController {

    @Resource
    private NewsService newsService;

    @RequestMapping("/list")
    public String NewsList(@RequestParam(value = "categoryId",required = false)Integer categoryId,
                           @RequestParam(value = "title",required = false)String title,
                           Model model){
        if(title != null && title != ""){
            model.addAttribute("title",title);    //如果标题不为空，就存储起来，在返回到页面
        }
        if(categoryId != null){
            model.addAttribute("categoryId",categoryId);    //如果类型编号不为空，就存储起来，在返回到页面
        }
        List<News_category> categoryList = newsService.queryCategoryList();    //获得新闻列表的类型
        List<News_detail> detailList = newsService.queryDetailList(categoryId,title);
        model.addAttribute("categoryList",categoryList);
        model.addAttribute("detailList",detailList);
        return "list";
    }

    @RequestMapping("/toUpdate")
    public String toUpdate(Model model,@RequestParam("id")Integer id){
        News_detail detail = newsService.getByIdDateil(id);
        List<News_category> categoryList = newsService.queryCategoryList();    //获得新闻列表的类型
        model.addAttribute("categoryList",categoryList);
        model.addAttribute("detail",detail);
        return "update";
    }

    @RequestMapping("/update")
    public String update(News_detail detail){
        detail.setUpdateDate(new Date());
        int count = newsService.updateDetail(detail);
        if(count > 0){
            return "redirect:/news/list";
        }else{
            return "redirect:/news/toUpdate?id=" + detail.getId();
        }
    }

    @RequestMapping("/ByTitle")
    @ResponseBody
    public String ByTitle(@RequestParam("title")String title,@RequestParam("id")Integer id){
        News_detail detail = newsService.getByIdDateil(id);
        if(detail.getTitle().equals(title)){
            return "false";
        }else{
            return "true";
        }
    }
}
