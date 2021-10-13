
<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2021/10/11
  Time: 10:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/getShow" method="post">
    <select name="hospital_id" id="hospital_id">
        <option value="-1">请选择</option>
    </select>
    <input type="hidden" id="pageIndex" name="pageIndex" value="1">
    <input type="hidden" value="${param.hospital_id}" id="hod">
    <input type="button" value="添加" onclick="toAdd()">
    <input type="submit" value="提交">
</form>
<table border="1">
    <thead>
    <td>负责人</td>
    <td>供应商</td>
    <td>品牌</td>
    <td>所属楼宇</td>
    <td>安装日期</td>
    <td>运行状态</td>
    <td>操作</td>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="p">
    <tr>
        <td>${p.principal}</td>
        <td>${p.supplier}</td>
        <td>${p.brand}</td>
        <td>${p.budName}</td>
        <td>${p.add_time}</td>
        <td>${p.status==0?"停用":"启用"}</td>
        <td><a href="javascript:void(0)" onclick="update(${p.id},${p.status},this)">${p.status==0?"启用":"停用"}</a></td>
    </tr>
    </c:forEach>
    </tbody>
</table>
<div>
    <c:if test="${page.pageIndex!=1}">
        <a href="javascript:topage(1)">首页</a>
        <a href="javascript:topage(${page.pageIndex-1})">上一页</a>
    </c:if>
    <c:if test="${page.pageIndex!=page.pageCount}">
        <a href="javascript:topage(${page.pageIndex+1})">下一页</a>
        <a href="javascript:topage(${page.pageCount})">尾页</a>
    </c:if>
</div>
</body>
</html>
<script src="${pageContext.request.contextPath}/statics/jquery-1.12.4.min.js"></script>
<script>
    function topage(pageIndex){
        $("#pageIndex").val(pageIndex);
        $("form").submit();
    }
    function update(id,status,e){
        if(status==0){
            if(confirm("是否启用？")){
                $.ajax({
                    url:"${pageContext.request.contextPath}/updateA",
                    data:{"id":id,"status":status},
                    dataType:"text",
                    type:"post",
                    success:function (result) {
                        if (result!=0){
                            $(e).html("禁用");
                            $(e).parent().prev().html("启用")
                        }

                    }
                })
            }
        }
        if (status==1){
            if(confirm("是否禁用？")){
                $.ajax({
                    url:"${pageContext.request.contextPath}/updateA",
                    data:{"id":id,"status":status},
                    dataType:"text",
                    type:"post",
                    success:function (result) {
                        if (result!=0){
                            $(e).html("启用");
                            $(e).parent().prev().html("禁用")
                        }

                    }
                })
            }
        }


    }
    $(function () {
        pageshow();
        $("tr:even").css("background","gray");
        $("tr:odd").css("background","green");
    });
    function pageshow() {
        var hod=$("#hod").val();
        $.ajax({
            url:"${pageContext.request.contextPath}/show2",
            dataType:"json",
            type:"post",
            success:function (result) {
                var lsp="";
                for(var s=0;s<result.length;s++){
                    if (hod ==result[s].id){
                        lsp+="<option value='"+result[s].id+"' selected='selected'>"+result[s].name+"</option>";
                    }else{
                        lsp+="<option value='"+result[s].id+"'>"+result[s].name+"</option>";
                    }
                }
                $("#hospital_id").append(lsp);
            }
        })
    }
    function toAdd() {
        location.href="${pageContext.request.contextPath}/getToAdd";
    }


</script>
