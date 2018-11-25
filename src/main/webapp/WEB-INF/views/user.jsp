<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored = "false" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body><div id="layout">
<table class="pure-table" style="margin-left:20px !important;">
<thead>
        <tr>
            <th>email</th>
            <th>userName</th>
            <th>address</th>
            
        </tr>
    </thead><tbody>
<c:forEach var="user" items="${listUsers}" varStatus="status">
        <tr>
            <td>${user.email}</td>
            <td>${user.userName}</td>
            <td>${user.address}</td>
             </tr>      
<br/>                    
                    
</c:forEach>
</table>

<h2>
Create a new User
</h2>
</div>
</body>
</html>