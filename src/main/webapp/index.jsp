<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2021/10/11
  Time: 9:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<select id="sel" name="hospital_id">
</select>
<input type="button" value="查询" id="btn">
<table>
    <thead>
        <td>负责人</td>
        <td>供应商</td>
        <td>品牌</td>
        <td>所属楼宇</td>
        <td>安装日期</td>
        <td>运行状态</td>
        <td>操作</td>
    </thead>
    <tbody id="tbody">

    </tbody>

</table>
<div id="div"></div>
</body>
</html>${status==0?"":""}
<script src="${pageContext.request.contextPath}/statics/jquery-1.12.4.min.js"></script>
<script>
    $(function () {
        show(1)

        $("#btn").click(function () {
            show(1);
        })
    })
    function show(pageIndex) {
        var hospital_id=$("#sel").val();
        $.ajax({
            url:"${pageContext.request.contextPath}/show",
            data:{"pageIndex":pageIndex,"hospital_id":hospital_id},
            dataType:"json",
            type:"post",
            success:function (result) {
                var str="";
                var list=result.page.list;
                for (var i=0;i<list.length;i++){
                    str+="<tr><td>"+list[i].principal+"</td><td>"+list[i].supplier+"</td>" +
                        "<td>"+list[i].brand+"</td><td>"+list[i].budName+"</td><td>"+list[i].add_time+"</td>" +
                        "<td>"+(list[i].status==0?"停用":"启用")+"</td>" +
                        "<td><a href='javascript:void(0)'>"+(list[i].status==0?"启用":"停用")+"</a></td></tr>";
                }

                $("#tbody").html(str);
                var sst="";
                if(result.page.pageIndex!=1){
                   sst+="<a href='javascript:show(1)'>首页</a>";
                    sst+="<a href='javascript:show("+(result.page.pageIndex+1)+")'>上一页</a>";
                }
                if (result.page.pageIndex!=result.page.pageCount){
                    sst+="<a href='javascript:show("+(result.page.pageIndex+1)+")'>下一页</a>";
                    sst+="<a href='javascript:show("+(result.page.pageCount)+")'>尾页</a>";
                }
                $("#div").html(sst);
                var slist=result.list;
                var ssp="";
                ssp+="<option value='-1'>请选择</option>";
                for(var s=0;s<slist.length;s++){
                    ssp+="<option value='"+slist[s].id+"'>"+slist[s].name+"</option>";
                }
                $("#sel").html(ssp);
                $("tr:even").css("background","gray");
                $("tr:odd").css("background","blue");
            }
        })
    }
</script>
