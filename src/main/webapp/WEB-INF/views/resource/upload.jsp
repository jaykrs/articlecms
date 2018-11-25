
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
