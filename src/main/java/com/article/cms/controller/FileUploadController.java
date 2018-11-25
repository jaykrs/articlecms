package com.article.cms.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLConnection;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.article.cms.model.ArticleFile;
import com.article.cms.service.ArticleFileService;
import com.article.cms.service.ArticleService;

@Controller
public class FileUploadController {

	@Autowired
	private ArticleFileService articleFileService;
	
	//Save the uploaded file to this folder
	private static String UPLOADED_FOLDER = "E:\\Data\\fileupload\\";

 //   @GetMapping("/fileUpload")
    public String index() {
        return "upload";
    }

    @RequestMapping(value = "/upload", method = RequestMethod.POST)
 //   @PostMapping("/upload") // //new annotation since 4.3
    public String singleFileUpload(@RequestParam("file") MultipartFile file,
                                   RedirectAttributes redirectAttributes) {

        if (file.isEmpty()) {
            redirectAttributes.addFlashAttribute("message", "Please select a file to upload");
            return "redirect:uploadStatus";
        }
        String domain = "default";
        try {
        	File theDir = new File(UPLOADED_FOLDER+domain);
        	// if the directory does not exist, create it
        	if (!theDir.exists()) {
        	    System.out.println("creating directory: " + theDir.getName());
        	    boolean result = false;

        	    try{
        	        theDir.mkdir();
        	        result = true;
        	    } 
        	    catch(SecurityException se){
        	        //handle it
        	    }        
        	    if(result) {    
        	        System.out.println("DIR created");  
        	    }
        	}
        	// Get the file and save it somewhere
            byte[] bytes = file.getBytes();
            Path path = Paths.get(UPLOADED_FOLDER+domain+"\\" + file.getOriginalFilename());
            Files.write(path, bytes);

            redirectAttributes.addFlashAttribute("message", 
                        "You successfully uploaded '" + file.getOriginalFilename() + "'");
            String type = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."),file.getOriginalFilename().length());
            ArticleFile afile = new ArticleFile();
        	afile.setFileName(file.getOriginalFilename());
            afile.setDomain("default");
            Long theLong = file.getSize();
            afile.setFileType(type);
            afile.setFileSize(theLong.intValue());
            afile.setFilePath(UPLOADED_FOLDER+domain+"\\"+file.getOriginalFilename());
            articleFileService.addArticleFile(afile);

        } catch (IOException e) {
            e.printStackTrace();
        }

        return "redirect:/listarticle";
    }
//    http://localhost:8081/articlecms/download?filename=ACSCEv5X_ExamBlueprint.pdf&domain=default
    @RequestMapping(value="/download", method = RequestMethod.GET)
    public void downloadFile(HttpServletResponse response, @RequestParam String filename, @RequestParam String domain) throws IOException {
     String filepath = UPLOADED_FOLDER+domain+"\\"+filename;
        File file = null;
            ClassLoader classloader = Thread.currentThread().getContextClassLoader();
            System.out.println("filepath "+filepath);
            file = new File(filepath);
       
         
        if(!file.exists()){
            String errorMessage = "Sorry. The file you are looking for does not exist";
            System.out.println(errorMessage);
            OutputStream outputStream = response.getOutputStream();
            outputStream.write(errorMessage.getBytes(Charset.forName("UTF-8")));
            outputStream.close();
            return;
        }
         
        String mimeType= URLConnection.guessContentTypeFromName(file.getName());
        if(mimeType==null){
            System.out.println("mimetype is not detectable, will take default");
            mimeType = "application/octet-stream";
        }
         
        System.out.println("mimetype : "+mimeType);
         
        response.setContentType(mimeType);
         
       response.setHeader("Content-Disposition", String.format("inline; filename=\"" + file.getName() +"\""));
       response.setContentLength((int)file.length());
        InputStream inputStream = new BufferedInputStream(new FileInputStream(file));
        //Copy bytes from source to destination(outputstream in this example), closes both streams.
        FileCopyUtils.copy(inputStream, response.getOutputStream());
    }
    
    
    
    @RequestMapping(value = "/uploadList", method = RequestMethod.GET)
    public String uploadStatus() {
        
    	return "uploadStatus";
    }

}
