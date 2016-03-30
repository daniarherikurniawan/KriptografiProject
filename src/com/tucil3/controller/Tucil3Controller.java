package com.tucil3.controller;


import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.Scanner;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.algoritma.controller.*;
import com.tugas1.controller.InvalidSizeException;

import algorithm.Bpcs;
import object.MessageBlock;

@Controller
@RequestMapping("/tucil3")
public class Tucil3Controller {
	String path = "/home/daniar/documents/KriptografiProject/file/";
	
	@RequestMapping("/")
	public ModelAndView Tucil3Controller() {

		ModelAndView model = new ModelAndView("Tucil3Page");
		model.addObject("msg","Tucil 3");
		model.addObject("folderLevel","../");
		return model;
	}

	@Autowired
    ServletContext context; 
	
	@RequestMapping(value="/execute",  method=RequestMethod.POST)
	@ResponseBody
	public String startExecuting(@RequestParam("strKunciPublik") String strKunciPublik,
			@RequestParam("strKunciPrivat") String strKunciPrivat,
			@RequestParam("fileInput") String fileInput,
			@RequestParam("fileKunciPublik") String fileKunciPublik,
			@RequestParam("fileKunciPrivat") String fileKunciPrivat,
			@RequestParam("operationType") String operationType
			) {
		JSONObject result = new JSONObject();
		String msg ="";
		String dataResult = "";
		boolean parameterIsComplete = false;
		switch(operationType){
			case "0": // bangkitkan kunci
				/*Generation process*/
				
				msg = "Public Key and Private Key are gererated successfully!";
				
				break; 
			case "1": // enkripsi
				/*Checking*/
				if(((strKunciPublik != "" ||  fileKunciPublik != "") && fileInput != "") && 
						!(strKunciPublik != "" &&  fileKunciPublik != ""))
					parameterIsComplete = true;
				
				if (parameterIsComplete){
					/*Processing*/
					
					
					
					dataResult = "encryption result (harusnya hexadecimal)";
					msg = "Encryption is finish!";
					result.put("filename", "encryptionResult");
					result.put("executionTime", "20 ms");
					result.put("fileSize", "13 KB");
					result.put("filetype", "txt");
				}else{
					msg = "Please complete the parameter! [Kunci Publik dan File Input] and specify the key whether from file or input";
				}
				break; 
			case "2": // dekripsi
				/*Checking*/
				if(((strKunciPrivat!= "" ||  fileKunciPrivat!= "") && fileInput != "")&& 
						!(strKunciPrivat != "" &&  fileKunciPrivat != ""))
					parameterIsComplete = true;
				
				if (parameterIsComplete){
					/*Processing*/
					dataResult = "decryption result";
					msg = "Decryption is finish!";
					result.put("filename", "decryptionResult");
					result.put("executionTime", "20 ms");
					result.put("fileSize", "13 KB");
					result.put("filetype", "txt");
				}else{
					msg = "Please complete the parameter! [Kunci Privat dan File Input] and specify the key whether from file or input";
				}
				break; 
			default: 
				msg = "Action is not recognized!";
		}
		
		if(parameterIsComplete)
			result.put("success", true);
		else
			result.put("success", false);
		
		result.put("msg", msg);
		result.put("data", dataResult);
		return result.toJSONString();
	}
	
	@RequestMapping(value = "/files/{file_name}/{file_type}", method = RequestMethod.GET)
	public void getFile(@PathVariable("file_name") String fileName, @PathVariable("file_type") String file_type, 
		    HttpServletResponse response) throws IOException {

        File file = new File(path+"result/"+fileName+"."+file_type);
        InputStream is = new FileInputStream(file);
 
        // MIME type of the file
        response.setContentType("application/octet-stream");
        // Response header
        response.setHeader("Content-Disposition", "attachment; filename=\""
                + file.getName() + "\"");
        // Read from the file and write into the response
        OutputStream os = response.getOutputStream();
        byte[] buffer = new byte[1024];
        int len;
        while ((len = is.read(buffer)) != -1) {
            os.write(buffer, 0, len);
        }
        os.flush();
        os.close();
        is.close();
    }

    @RequestMapping(value="/upload", method=RequestMethod.POST)
    @ResponseBody
    public String handleFileUpload(@RequestParam("name") String name,
            @RequestParam("file") MultipartFile file){
        if (!file.isEmpty()) {
            try {
            	
                byte[] bytes = file.getBytes();
                FileUtils.writeByteArrayToFile(new File(path+"uploaded/"+name), bytes);
	                System.out.println(file.getOriginalFilename()); 
               
                return "You successfully uploaded " + name + "!";
            } catch (Exception e) {
                return "You failed to upload " + name + " => " + e.getMessage();
            }
        } else {
            return "You failed to upload " + name + " because the file was empty.";
        }
    }
    
    public ArrayList<Integer> readFile(String path){
		FileInputStream fis = null;
		ArrayList<Integer> myList = new ArrayList<Integer>();
    	try {
			fis = new FileInputStream(path);
			int content;
			while ((content = fis.read()) != -1) {
	            myList.add(content);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (fis != null)
					fis.close();
			} catch (IOException ex) {
				ex.printStackTrace();
			}
		}
		return myList;
	}
   
    public void writeEncryptedFile(ArrayList<Integer> myList , String filename){
		BufferedOutputStream bos;
		try {
			bos = new BufferedOutputStream(
			        new FileOutputStream(new File(path + "encrypted"+filename)));
			for (int i = 0; i < myList.size(); i++) {
            	bos.write(myList.get(i).intValue());
    		}
	        bos.close();
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void writeDecryptedFile(ArrayList<Integer> myList , String filename){
		BufferedOutputStream bos;
		try {
			bos = new BufferedOutputStream(
			        new FileOutputStream(new File(path + "decrypted"+filename)));
			for (int i = 0; i < myList.size(); i++) {
            	bos.write(myList.get(i).intValue());
    		}
	        bos.close();
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
    
}
