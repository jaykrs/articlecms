<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored = "false" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Article Page</title>
<script src="<c:url value='resources/js/tinymce/tinymce.min.js'/>" ></script>
<script src="<c:url value='resources/js/jquery.min.js'/>" ></script>
<script src="<c:url value='resources/js/ui.js'/>" ></script>
<link href="<c:url value='resources/css/side-menu.css' />" rel="stylesheet"></link>
<link href="<c:url value='resources/css/Article.css' />" rel="stylesheet"></link>
<link href="<c:url value='resources/css/pure-min.css' />" rel="stylesheet"></link>

<script>
tinymce.init({
	 selector: '.textbodyarea',
	  height: 300,
	  width: 500,
	  theme: 'modern',
	  plugins: [
	    'advlist autolink lists link image charmap print preview hr anchor pagebreak',
	    'searchreplace wordcount visualblocks visualchars code fullscreen',
	    'insertdatetime media nonbreaking save table contextmenu directionality',
	    'emoticons template paste textcolor colorpicker textpattern imagetools'
	  ],
	  toolbar1: 'insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image',
	  toolbar2: 'print preview media | forecolor backcolor emoticons',
	  image_advtab: true,
	  templates: [
	    { title: 'Test template 1', content: 'Test 1' },
	    { title: 'Test template 2', content: 'Test 2' }
	  ],
	  content_css: [
//	    '//fast.fonts.net/cssapi/e6dc9b99-64fe-4292-ad98-6974f93cd2a2.css',
//	    '//www.tinymce.com/css/codepen.min.css'
	  ]
	 });

$(document).ready(function(){
    $("#userclk").click(function(){
    	alert("j");
        $.ajax({url: "user.jsp", success: function(result){
            $("#User").html(result);
        }});
    });
});
</script>
</head>
<body><div id="layout">

    <div id="menu">
        <div class="pure-menu">
            <a class="pure-menu-heading" href="#">${userID}</a>

            <ul class="pure-menu-list">
                <li class="pure-menu-item"><a href="#" class="pure-menu-link">Home</a></li>
                <li class="pure-menu-item">
                <a href="#Article" class="pure-menu-link" onclick="document.getElementById('Article').style.display = 'block';document.getElementById('User').style.display = 'none';document.getElementById('ArticleHeader').style.display = 'none';document.getElementById('Upload').style.display = 'none';">Article</a>
                </li>
				<li class="pure-menu-item">
				<a href="#" class="pure-menu-link" onclick="document.getElementById('ArticleHeader').style.display = 'block';document.getElementById('Article').style.display = 'none';document.getElementById('User').style.display = 'none';document.getElementById('Upload').style.display = 'none';">ArticleHeader</a>
				</li>
                <li class="pure-menu-item" class="menu-item-divided pure-menu-selected">
                    <a id ="userclk" href="#user" class="pure-menu-link" onclick="document.getElementById('User').style.display = 'block';document.getElementById('ArticleHeader').style.display = 'none';document.getElementById('Article').style.display = 'none';document.getElementById('Upload').style.display = 'none';">User</a>
                </li>
				<li class="pure-menu-item" class="menu-item-divided pure-menu-selected">
                    <a href="#Upload" class="pure-menu-link" onclick="document.getElementById('Upload').style.display = 'block';document.getElementById('User').style.display = 'none';document.getElementById('ArticleHeader').style.display = 'none';document.getElementById('Article').style.display = 'none'">File Upload</a>
                </li>
                <li class="pure-menu-item"><a href="logout" class="pure-menu-link">Logout</a></li>
            </ul>
        </div>
    </div>

<div id="Article" style="display:none;">
<table class="pure-table" style="margin-left:20px !important;">
<thead>
        <tr>
            <th>Serial</th>
            <th>Title</th>
            <th>Teaser</th>
            <th>Edit</th>
            <th>Publish</th>
            <th>Delete</th>
            
        </tr>
    </thead><tbody>
<c:forEach var="article" items="${listArticle}" varStatus="status">
        <tr>
            <c:if test="${article.teaser ne 'HeaderFooter'}">
            <td>${article.id}</td>
            <td><a target="blank" href="articledetails?articleid=${article.id}">${article.title}</a></td>
            <td>${article.teaser}</td>
            <td><a href="editarticle?articleid=${article.id}" >Edit</a></td>
            <td><a href="articlepublish?articleid=${article.id}">publish</a></td>
            <td><a href="articledelete?articleid=${article.id}">delete</a></td>
           </c:if>
        </tr>       
    <%--                 <span class="title">${article.id}</span>
                    <span class="title"><a target="blank" href="articledetails?articleid=${article.id}">${article.title}</a></span>
                    <span class="teaser">${article.teaser}</span> --%>
<br/>                    
                    
</c:forEach>
</table>
<br/><br/>

<input type = "button" id="createArticle" style="margin-left:20px !important;" class="pure-button pure-button-primary" value="Add Article" onclick="document.getElementById('createArticleFrm').style.display = 'block'"/>
<input type = "button" id="cancelArticle" style="margin-left:20px !important;" class="pure-button pure-button-primary" value="cancel" onclick="document.getElementById('createArticleFrm').style.display = 'none'"/>

<form id="createArticleFrm" class="pure-form pure-form-stacked" method = "post" style="display:none;margin-left:20px !important;" action = "addarticle" >

<!-- Article Template <input type = "file" name= "file" value=''/><br/>  -->
Article Title <textarea name= "title" value='${TitleArticle}'></textarea><br/>
Article Teaser<textarea name= "teaser" value='${TeaserArticle}'></textarea> <br/>
Article Header
<select name="articleHeaderFooter">
<c:forEach var="listArticleHeader" items="${listArticleHeader}" varStatus="status">
<option value="${listArticleHeader.id}">${listArticleHeader.title}</option>
</c:forEach>
</select>
<%-- Article Resources <textarea class ="textresarea" name= "Resources" >${ResourcesArticle}</textarea> <br/>
Article Header  <textarea class ="textbodyarea" name= "Header">${HeaderArticle}</textarea><br/> --%>
Article Body <textarea class ="textbodyarea" name= "body">${BodyArticle}</textarea><br/>
<%-- Article Footer <textarea class ="textbodyarea" name= "footer">${FooterArticle}</textarea><br/> --%>
<input type = "submit" class="pure-button pure-button-primary" value="Save"/>
</form>
</div>

<div id="User" style="display:none;">

</div>

<div id="Upload" style="display:none;">
<table class="pure-table" style="margin-left:20px !important;">
<thead>
        <tr>
            <th>FileName</th>
            <th>size</th>
            <th>path</th>
            
        </tr>
    </thead><tbody>
<c:forEach var="articleFile" items="${listArticleFile}" varStatus="status">
        <tr>
            <td>${articleFile.fileName}</td>
            <td>${articleFile.fileSize}</td>
            <td>${articleFile.filePath}</td>
             </tr>      
<br/>                    
                    
</c:forEach>
</table>
upload File
<form method="POST" action="${pageContext.request.contextPath}/upload" enctype="multipart/form-data">
    <input type="file" name="file" /><br/>
    <input type="submit" value="Submit" />
</form>
</div>

<div id="ArticleHeader" style="display:none;">
<table class="pure-table" style="margin-left:20px !important;">
<thead>
        <tr>
            <th>Serial</th>
            <th>Title</th>
            <th>Edit</th>
            <th>Publish</th>
            <th>Delete</th>
            
        </tr>
    </thead><tbody>
<c:forEach var="article" items="${listArticle}" varStatus="status">
        <tr>
            <c:if test="${article.teaser eq 'HeaderFooter'}">
            <td>${article.id}</td>
            <td><a target="blank" href="articledetails?articleid=${article.id}">${article.title}</a></td>
            <td><a href="editarticle?articleid=${article.id}" >Edit</a></td>
            <td><a href="articlepublish?articleid=${article.id}">publish</a></td>
            <td><a href="articledelete?articleid=${article.id}">delete</a></td>
           </c:if>
        </tr>       
   <br/>                    
                    
</c:forEach>
</table>
<br/><br/>

<input type = "button" id="createArticleHeader" style="margin-left:20px !important;" class="pure-button pure-button-primary" value="Add Article Header" onclick="document.getElementById('createArticleHeaderFrm').style.display = 'block'"/>
<input type = "button" id="cancelArticleHeader" style="margin-left:20px !important;" class="pure-button pure-button-primary" value="cancel" onclick="document.getElementById('createArticleHeaderFrm').style.display = 'none'"/>

<form id="createArticleHeaderFrm" class="pure-form pure-form-stacked" method = "post" style="display:none;margin-left:20px !important;" action = "addarticleheaderfooter" >

<!-- Article Template <input type = "file" name= "file" value=''/><br/>  -->
Article Header Title <textarea name= "title" value='${TitleArticle}'></textarea><br/>

Article Header Resources <textarea class ="textresarea" name= "Resources" >${ResourcesArticle}</textarea> <br/>
Article Header Header  <textarea class ="textbodyarea" name= "Header">${HeaderArticle}</textarea><br/>

Article Header Footer <textarea class ="textbodyarea" name= "footer">${FooterArticle}</textarea><br/>
<input type = "submit" class="pure-button pure-button-primary" value="Save"/>
</form>
</div>


</div>
</body>
</html>