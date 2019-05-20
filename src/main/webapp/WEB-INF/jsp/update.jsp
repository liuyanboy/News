<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>新闻修改页面</title>
    <style>
        .containter{
            width:800px;
            margin:0px auto;
        }
        .titleCss{
            text-align: center;
            font-size: 37px;
            padding: 7px;
        }
        table th{

        }
    </style>
</head>
<body>
    <div class="containter">
        <form action="${pageContext.request.contextPath}/news/update" method="post">
            <table border="1"  cellspacing="0" cellpadding="0" width="100%">
                <tr>
                    <th colspan="6" class="titleCss">更新新闻内容</th>
                </tr>
                <tr>
                    <th>新闻编号</th>
                    <td>
                        ${detail.id}
                        <input name="id" value="${detail.id}" type="hidden" id="id"/>
                    </td>
                </tr>
                <tr>
                    <th>新闻分类</th>
                    <td>
                        <select name="categoryId">
                            <c:forEach items="${categoryList}" var="category">
                                <option value="${category.id}" <c:if test="${category.id == detail.categoryId}">selected</c:if> >${category.name}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>新闻标题</th>
                    <td>
                        <input type="text" name="title" value="${detail.title}" id="title"/>
                    </td>
                </tr>
                <tr>
                    <th>新闻摘要</th>
                    <td>
                        <textarea name="summary" cols="60" rows="5"> ${detail.summary}</textarea>
                    </td>
                </tr>
                <tr>
                    <th>作者</th>
                    <td>
                        <input type="text" name="author" value="${detail.author}"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;">
                        <input type="submit" value="提交"/>
                        <input type="button" value="返回" onclick="javascript:go(-1);" />
                    </td>
                </tr>
                <input type="hidden" name="createDate" value="${detail.createDate}"/>
            </table>
        </form>
    </div>

<script src="${pageContext.request.contextPath}/statics/jquery.min.js"></script>
<script>
    $(function(){

        $("#title").blur(function () {
            var title = $("#title").val();
            if(title != null && title != ''){
                $.ajax({
                    url : "/news/ByTitle",
                    data:"title="+ title + "&id=" + $("#id").val(),
                    dataType : "text",
                    type : "GET",
                    success :　function (data) {  //data的值为"true"或"false"
                        if (data == "true") {
                           alert("新闻标题可以用");
                        } else {
                           alert("新闻标题已存在，请重新输入");
                        }
                    }
                });
            }else{
                alert("标题不能为空");
            }
        });
    });

</script>

</body>
</html>
