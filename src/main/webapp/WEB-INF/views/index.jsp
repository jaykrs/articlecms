<%@ page isELIgnored = "false" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to Articlecms</title>
<link href='resources/css/Article.css' rel="stylesheet"></link>
<link href='resources/css/pure-min.css' rel="stylesheet"></link>
<style>
body {
    margin:50px 0; 
    padding:0;
    text-align:center;
}

#Content {
    width:300px;
    margin:0 auto;
    text-align:left;
    padding:15px;
    border:1px dashed #333;
    background-color:#eee;
}
</style>
</head>
<body>
<div id="Content">
<h2>${welcomemsg}</h2>
<form class="pure-form pure-form-stacked" action ="login" method="post">
UserId: <input type="text" name="userid" value=""><br/>
Password : <input type="password" name="pwd" value="">
<input type="submit" class="pure-button pure-button-primary" style="text-align:center;" value="Login">
</form>
</div>
</body>
</html>
