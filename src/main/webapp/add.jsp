<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2021/10/13
  Time: 10:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/doadd" method="post">
    <table border="1">
        <tr>
            <td>负责人</td>
            <td><input type="text" name="principal"></td>
        </tr>
        <tr>
            <td>供货商</td>
            <td><input type="text" name="supplier"></td>
        </tr>
        <tr>
            <td>品牌</td>
            <td><input type="text" name="brand"></td>
        </tr>
        <tr>
            <td>所属楼宇</td>
            <td><select name="hospital_id" id="hospital_id">
            </select>
            </td>
        </tr>
        <tr>
            <td>安装日期</td>
            <td><input type="text" name="add_time"></td>
        </tr>
        <tr>
            <td>
                <input type="submit" value="添加">
                <input type="button" value="返回" onclick="getBack()">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
<script src="${pageContext.request.contextPath}/statics/jquery-1.12.4.min.js"></script>
<script>
    $(function () {
        pageshow();

      $("form").submit(function () {
          var principal=$("input[name=principal]").val();
          var supplier=$("input[name=supplier]").val();
          var brand=$("input[name=brand]").val();
          var hospital_id=$("select[name=hospital_id]").val();
          var add_time=$("input[name=add_time]").val();
          if (principal==""){
              alert("请输入负责人");
              return false;
          }
          if (supplier==""){
              alert("请输入供货商");
              return false;
          }
          if (brand==""){
              alert("请输入品牌");
              return false;
          }
          if (hospital_id==-1){
              alert("请选择所属楼宇");
              return false;
          }
          if (add_time==""){
              alert("请输入日期");
              return false;
          }
          var regdate=/^\d{4}-\d{1,2}-\d{1,2}$/;
          if (!regdate.test(add_time)){
            alert("请输入正确的日期格式！");
            return false;
          }
          return true;
      })
    })
    function pageshow() {
        $.ajax({
            url:"${pageContext.request.contextPath}/show2",
            dataType:"json",
            type:"post",
            success:function (result) {
                var lsp="";
                lsp+="<option value='-1' selected=selected>请选择</option>"
                for(var s=0;s<result.length;s++){
                        lsp+="<option value='"+result[s].id+"'>"+result[s].name+"</option>";
                }
                $("#hospital_id").append(lsp);
            }
        })
    }
</script>
