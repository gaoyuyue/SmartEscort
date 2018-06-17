<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: arthurme
  Date: 2017/3/20
  Time: 20:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<shiro:hasRole name="admin">
    <%@ include file="admin.jsp"%>
</shiro:hasRole>
<shiro:hasRole name="user">
    <%--<%@include file="user.jsp"%>--%>
    <%@include file="./WEB-INF/views/User/PostPackage/index.jsp"%>
</shiro:hasRole>
