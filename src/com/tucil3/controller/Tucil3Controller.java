package com.tucil3.controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.Scanner;

import javax.servlet.ServletContext;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	String path = "/home/daniar/documents/KriptografiProject/file/uploaded/";
	
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
		String result ="";
		switch(operationType){
			case "0": // bangkitkan kunci
				result = "from 0";
				break; 
			case "1": // enkripsi
				result = "from 1";
			
				break; 
			case "2": // dekripsi
				result = "from 2";
			
				break; 
			default: 
		}
		return result;
	}

    @RequestMapping(value="/upload", method=RequestMethod.POST)
    @ResponseBody
    public String handleFileUpload(@RequestParam("name") String name,
            @RequestParam("file") MultipartFile file){
        if (!file.isEmpty()) {
            try {
            	
                byte[] bytes = file.getBytes();
                FileUtils.writeByteArrayToFile(new File(path+name), bytes);
	                System.out.println(file.getOriginalFilename()); 
               
                return "You successfully uploaded " + name + "!";
            } catch (Exception e) {
                return "You failed to upload " + name + " => " + e.getMessage();
            }
        } else {
            return "You failed to upload " + name + " because the file was empty.";
        }
    }
    
    
    
}
