<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>新闻列表信息</title>
    <style>
        .containter{
            width:1000px;
            margin:0px auto;
        }
        table{ width:100%;}
        table td,th{
            padding: 5px;
        }
        .titleCss{
            text-align: center;
            font-size: 37px;
            padding: 7px;
        }
        form{
            text-align: center;
        }
        #tit{
            margin-left: 40px;
        }
    </style>
</head>
<body>

<div class="containter">
    <form action="${pageContext.request.contextPath}/news/list" method="POST">
        <span>新闻分类：</span>
        <select name="categoryId">
            <option value="0">全部</option>
            <c:forEach items="${categoryList}" var="category">
                <option value="${category.id}" <c:if test="${category.id == categoryId}">selected</c:if> >${category.name}</option>
            </c:forEach>
        </select>
        <span id="tit">新闻标题：</span>
        <input name="title" type="text" <c:if test="${title != null}">value="${title}"</c:if> />
        <input type="submit" value="查询"/>
    </form>

    <div>
        <table border="1" cellspacing="0" cellpadding="0">
            <tr>
                <th colspan="6" class="titleCss">新闻列表</th>
            </tr>
            <tr>
                <th>新闻编号</th>
                <th>新闻标题</th>
                <th>新闻摘要</th>
                <th>作者</th>
                <th>创建时间</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${detailList}" var="detail">
                <tr>
                    <td>${detail.id}</td>
                    <td>${detail.title}</td>
                    <td>${detail.summary}</td>
                    <td>${detail.author}</td>
                    <td>
                        <fm:formatDate value="${detail.createDate}" pattern="yyyy-MM-dd HH:mm"/>
                    </td>
                    <td>
                        <a href="${pageContext.request.contextPath}/news/toUpdate?id=${detail.id}">修改</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>
<script src="${pageContext.request.contextPath}/statics/jquery.min.js"></script>
<script>
    $(function(){
        $("tr:odd").css("background-color", "yellow");  //隔行变色
    });
</script>
</html>
