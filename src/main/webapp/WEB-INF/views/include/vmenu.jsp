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