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


</script>
</head>
<body><div id="layout">

    <div id="menu">
        <div class="pure-menu">
            <a class="pure-menu-heading" href="#">${userID}</a>

            <ul class="pure-menu-list">
                <li class="pure-menu-item"><a href="#" class="pure-menu-link">Home</a></li>
                <li class="pure-menu-item"><a href="#Article" class="pure-menu-link" onclick="document.getElementById('Article').style.display = 'block'">Article</a></li>

              <li class="pure-menu-item"><a href="logout" class="pure-menu-link">Logout</a></li>
            </ul>
        </div>
    </div>

<div id="Article" >

<br/><br/>

<input type = "button" id="cancelArticle" style="margin-left:20px !important;" class="pure-button pure-button-primary" value="cancel" onclick="window.history.back();"/>

<form id="createArticleFrm" class="pure-form pure-form-stacked" method = "post" style="margin-left:20px !important;display:block;" action = "addarticle" >

<!-- Article Template <input type = "file" name= "file" value=''/><br/> --><input type = "hidden" name= "action" value='update'/>
<input type = "hidden" name= "articleId" value='${articleId}'/>
Article Title <input type = "text" name="title" value ='${TitleArticle}' style="width:500px;"/><br/>
Article Teaser<input type = "text" name= "teaser" value='${TeaserArticle}'style="width:500px;"/> <br/>
Article Resources <textarea class ="textresarea" name= "Resources" >${ResourcesArticle}</textarea> <br/>
Article Header  <textarea class ="textbodyarea" name= "Header">${HeaderArticle}</textarea><br/>
Article Body <textarea class ="textbodyarea" name= "body">${BodyArticle}</textarea><br/>
Article Footer <textarea class ="textbodyarea" name= "footer">${FooterArticle}</textarea><br/>
<input type = "submit" class="pure-button pure-button-primary" value="Save"/>
</form>
</div>


</div>
</body>
</html>